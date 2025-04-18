#!/usr/bin/env python3
import math
import os
import subprocess
import sys
import time
import random
import datetime
import threading
import multiprocessing
from concurrent.futures import ThreadPoolExecutor, as_completed
from collections import defaultdict

# 基本配置参数
USER_NAME = "femu"  
WORK_DIR = "/home/femu/ecwide-ssd"
NUM_NODES = 8
NUM_STRIPES = 20  # 条带总数
NUM_BLOCKS_PER_STRIPE = 20  # 每个条带中的数据块数量
NUM_LOCAL_PARITY = 4  # 每个条带的本地奇偶校验块数量
NUM_RACKS = 8  # 每个节点被视为一个机架，node01=rack1, node02=rack2等
NUM_GLOBAL_PARITY = 2  # 每个条带的全局奇偶校验块数量

# 块大小和并行执行配置
DEFAULT_BLOCK_SIZE = 32 * 1024 * 1024  # 32MB块大小
MAX_PARALLEL_TRANSFERS = 16  # 最大并行SSH/SCP操作数
MAX_PARALLEL_UPDATES = 8     # 最大并行块更新数

# 输出文件目录
OUTPUT_DIR = "placedway"  # 所有输出文件的目录
os.makedirs(OUTPUT_DIR, exist_ok=True)  # 确保输出目录存在

# 内存中跟踪块和更新
updated_blocks = set()  # 跟踪已更新的块
update_log = []  # 跟踪更新历史

def get_rack_number(stripe, block):
    """根据条带号和块号计算机架号，基于ECWIDE布局规则"""
    k = block // 5  # 整数除法，k = b/5
    
    is_odd_stripe = stripe % 2 == 1
    condition = (is_odd_stripe and block < 3) or (not is_odd_stripe and block >= 3)
    
    if condition:
        rack = 2*k + 1  # R_{2k+1}
    else:
        rack = 2*k + 2  # R_{2k+2}
    
    # 确保机架号在有效范围[1,8]内
    return max(1, min(NUM_RACKS, rack))

def get_ssd_number(block):
    """根据块号计算SSD编号（1-5）"""
    return (block % 5) + 1

def get_local_parity_location(stripe, parity_idx):
    """计算本地奇偶校验块的位置，返回(rack, ssd)元组"""
    k = parity_idx + 1  # k = b + 1
    
    if stripe % 2 == 1:  # 奇数条带
        rack = 2*k
    else:  # 偶数条带
        rack = 2*k - 1
    
    rack = max(1, min(NUM_RACKS, rack))
    
    return (rack, 6)  # SSD6用于本地奇偶校验

def create_distribution_plan():
    """创建条带分布方案，生成数据块、本地和全局奇偶校验块的分布位置"""
    distribution = {}
    global_pos_counts = defaultdict(int)  # (rack, ssd) -> 使用次数

    for s in range(1, NUM_STRIPES + 1):
        # 存储当前条带的数据块位置，用于避免全局奇偶校验与数据块冲突
        data_locations = set()

        # 分配数据块
        for b in range(NUM_BLOCKS_PER_STRIPE):
            rack_num = get_rack_number(s, b)
            ssd_num = get_ssd_number(b)
            ssd_index = ssd_num - 1  # 转换为0-4索引（对应nvme0-4）
            data_locations.add((rack_num, ssd_index))

            ssd_path = f"/mnt/nvme{ssd_index}"
            distribution[(s, "D", b)] = (rack_num, ssd_path)

        # 分配本地奇偶校验块
        for b in range(NUM_LOCAL_PARITY):
            rack_num, ssd_num = get_local_parity_location(s, b)
            ssd_index = ssd_num - 1  # 将SSD6转换为nvme5
            ssd_path = f"/mnt/nvme{ssd_index}"
            distribution[(s, "L", b)] = (rack_num, ssd_path)

        # 分配全局奇偶校验块
        for g in range(NUM_GLOBAL_PARITY):
            # 当前条带已选全局校验块的机架集合
            selected_racks_for_global = set()
            
            # 候选位置需满足：
            # 1. 不在数据块的位置中（data_locations）
            # 2. 机架未被当前条带的其他全局校验块占用
            candidates = [
                (rack, ssd)
                for rack in range(1, NUM_RACKS + 1)
                for ssd in range(5)
                if (rack, ssd) not in data_locations
                and rack not in selected_racks_for_global
            ]

            if not candidates:
                raise ValueError(f"条带{s}没有可用的全局奇偶校验候选位置")
            
            # 选择使用次数最少的(rack, ssd)位置
            min_usage = min(global_pos_counts[pos] for pos in candidates)
            eligible_positions = [pos for pos in candidates if global_pos_counts[pos] == min_usage]
            
            # 排序以保持确定性
            selected_rack, selected_ssd = sorted(eligible_positions)[0]
            
            # 分配并更新使用计数
            ssd_path = f"/mnt/nvme{selected_ssd}"
            distribution[(s, "G", g)] = (selected_rack, ssd_path)
            global_pos_counts[(selected_rack, selected_ssd)] += 1
            
            # 将当前机架加入已选集合，避免后续校验块重复
            selected_racks_for_global.add(selected_rack)

    return distribution

def execute_distribution_plan(distribution):
    """执行分布方案，创建分布报告文件"""
    report_path = os.path.join(OUTPUT_DIR, "distribution_report_placed.txt")
    with open(report_path, "w") as report:
        report.write("Stripe Distribution Report\n")
        report.write("==========================\n\n")
        
        # 按节点组织块信息
        node_blocks = defaultdict(list)
        for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
            node_blocks[node].append((stripe, block_type, block_id, ssd_path))
        
        # 输出每个节点上的块信息
        for node in sorted(node_blocks.keys()):
            report.write(f"Node {node:02d} distribution:\n")
            for stripe, block_type, block_id, ssd_path in sorted(node_blocks[node]):
                chunk_name = f"{block_type}_{stripe}_{block_id}"
                full_path = f"{ssd_path}/{chunk_name}"
                report.write(f"  {chunk_name} -> {full_path}\n")
            report.write("\n")
    
    print(f"Distribution plan created and saved to {report_path}")

def run_command(cmd, description=None):
    """执行单个命令并返回(成功与否, 输出内容, 命令)元组"""
    if description:
        print(f"Executing: {description}")
    
    try:
        result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, 
                                text=True, check=False)
        
        if result.returncode == 0:
            return (True, result.stdout.strip(), cmd)
        else:
            return (False, f"Error: {result.stderr.strip()}", cmd)
    
    except Exception as e:
        return (False, f"Exception: {str(e)}", cmd)

def run_commands_parallel(commands_with_desc, max_parallel=MAX_PARALLEL_TRANSFERS, timeout=None):
    """使用线程池并行执行多个命令，返回结果列表"""
    results = []
    
    with ThreadPoolExecutor(max_workers=max_parallel) as executor:
        # 提交所有命令给执行器
        future_to_cmd = {
            executor.submit(run_command, cmd, desc): (cmd, desc) 
            for cmd, desc in commands_with_desc
        }
        
        # 处理执行结果
        for future in as_completed(future_to_cmd, timeout=timeout):
            cmd, desc = future_to_cmd[future]
            try:
                success, output, _ = future.result()
                results.append((success, output, cmd))
                
                # 打印进度
                status = "✓" if success else "✗"
                print(f"[{status}] {desc}")
                
            except Exception as e:
                results.append((False, f"Exception: {str(e)}", cmd))
                print(f"[✗] {desc} - {str(e)}")
    
    # 统计成功和失败的命令数
    successes = sum(1 for success, _, _ in results if success)
    failures = len(results) - successes
    
    print(f"Command execution complete: {successes} succeeded, {failures} failed")
    
    return results

def generate_distribution_commands(distribution, generate_script=True, execute=False):
    """生成分布命令并可选择立即执行"""
    # 生成mkdir命令
    mkdir_commands = []
    node_ssd_paths = defaultdict(set)
    
    for (_, _, _), (node, ssd_path) in distribution.items():
        node_ssd_paths[node].add(ssd_path)
    
    for node, ssd_paths in node_ssd_paths.items():
        for ssd_path in ssd_paths:
            cmd = f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {ssd_path}'"
            desc = f"Creating directory {ssd_path} on node{node:02d}"
            mkdir_commands.append((cmd, desc))
    
    # 生成复制命令
    copy_commands = []
    for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
        chunk_name = f"{block_type}_{stripe}_{block_id}"
        cmd = f"scp -C {WORK_DIR}/test/chunks/{chunk_name} {USER_NAME}@node{node:02d}:{ssd_path}/{chunk_name}"
        desc = f"Copying {chunk_name} to node{node:02d}:{ssd_path}"
        copy_commands.append((cmd, desc))
    
    # 生成脚本
    if generate_script:
        script_path = os.path.join(OUTPUT_DIR, "distribute_commands.sh")
        with open(script_path, "w") as script:
            script.write("#!/bin/bash\n\n")
            script.write(f"# Generated distribution commands for {NUM_NODES} nodes, {NUM_STRIPES} stripes\n\n")
            
            # 创建本地源目录
            script.write("# Ensure local source directory exists\n")
            script.write(f"mkdir -p {WORK_DIR}/test/chunks\n\n")
            
            # 并行创建目录
            script.write("# Create remote directories in parallel\n")
            for cmd, _ in mkdir_commands:
                script.write(f"{cmd} &\n")
            script.write("\n# Wait for directory creation to complete\nwait\n\n")
            
            # 定义并行执行函数
            script.write(f"# Copy files to remote nodes (maximum {MAX_PARALLEL_TRANSFERS} parallel transfers)\n")
            script.write("function parallel_execute() {\n")
            script.write("    # Create a temporary directory for command files\n")
            script.write("    local tmpdir=$(mktemp -d /tmp/parallel_exec.XXXXXX)\n")
            script.write("    local count=0\n")
            script.write("    local max_jobs=$1\n")
            script.write("    shift\n\n")
            
            script.write("    # Write each command to a separate file\n")
            script.write("    while [[ $# -gt 0 ]]; do\n")
            script.write("        echo \"#!/bin/bash\" > \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        echo \"$1\" >> \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        chmod +x \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        count=$((count + 1))\n")
            script.write("        shift\n")
            script.write("    done\n\n")
            
            script.write("    # Execute commands with controlled parallelism\n")
            script.write("    local total_cmds=$count\n")
            script.write("    count=0\n")
            script.write("    local running=0\n")
            script.write("    local pids=()\n\n")
            
            script.write("    # Launch up to max_jobs processes\n")
            script.write("    while [[ $count -lt $total_cmds ]]; do\n")
            script.write("        while [[ $running -lt $max_jobs && $count -lt $total_cmds ]]; do\n")
            script.write("            \"$tmpdir/cmd_$count.sh\" &\n")
            script.write("            pids+=($!)\n")
            script.write("            running=$((running + 1))\n")
            script.write("            count=$((count + 1))\n")
            script.write("        done\n\n")
            
            script.write("        # Wait for any child to exit\n")
            script.write("        wait -n 2>/dev/null || true\n")
            script.write("        running=$((running - 1))\n")
            script.write("    done\n\n")
            
            script.write("    # Wait for remaining children\n")
            script.write("    wait\n\n")
            
            script.write("    # Clean up\n")
            script.write("    rm -rf \"$tmpdir\"\n")
            script.write("}\n\n")
            
            # 分批处理命令
            batch_size = MAX_PARALLEL_TRANSFERS
            batches = [copy_commands[i:i+batch_size] for i in range(0, len(copy_commands), batch_size)]
            
            for batch_idx, batch in enumerate(batches, 1):
                script.write(f"# Batch {batch_idx}/{len(batches)}\n")
                
                # 构建parallel_execute参数
                cmd_args = []
                for cmd, _ in batch:
                    cmd_escaped = cmd.replace("'", "'\\''")  # 转义单引号
                    cmd_args.append(f"'{cmd_escaped}'")
                
                script.write(f"echo 'Processing batch {batch_idx}/{len(batches)} ({len(batch)} transfers)...'\n")
                script.write(f"parallel_execute {MAX_PARALLEL_TRANSFERS} {' '.join(cmd_args)}\n\n")
            
        os.chmod(script_path, 0o755)
        print(f"Distribution commands generated in {script_path}")
    
    # 如果需要，直接执行命令
    if execute:
        print("\nExecuting directory creation commands in parallel...")
        run_commands_parallel(mkdir_commands, max_parallel=MAX_PARALLEL_TRANSFERS)
        
        print("\nExecuting file transfer commands in parallel...")
        total_batches = math.ceil(len(copy_commands) / MAX_PARALLEL_TRANSFERS)
        
        for batch_idx, i in enumerate(range(0, len(copy_commands), MAX_PARALLEL_TRANSFERS), 1):
            batch = copy_commands[i:i+MAX_PARALLEL_TRANSFERS]
            print(f"\nProcessing batch {batch_idx}/{total_batches} ({len(batch)} transfers)...")
            run_commands_parallel(batch, max_parallel=MAX_PARALLEL_TRANSFERS)
        
        print("\nDistribution completed.")

def validate_stripe_block(stripe, block_id):
    """验证条带和块ID是否在有效范围内"""
    if not 1 <= stripe <= NUM_STRIPES:
        raise ValueError(f"Stripe must be between 1-{NUM_STRIPES}")
    if not 0 <= block_id < NUM_BLOCKS_PER_STRIPE:
        raise ValueError(f"Block ID must be between 0-{NUM_BLOCKS_PER_STRIPE-1}")

def get_affected_components(distribution, stripe, block_id):
    """获取更新数据块时受影响的所有存储组件"""
    components = []
    
    # 数据块
    data_key = (stripe, 'D', block_id)
    if data_key not in distribution:
        raise ValueError(f"Data block D_{stripe}_{block_id} not found")
    components.append(('DATA', *distribution[data_key]))
    
    # 本地奇偶校验块
    group_idx = block_id // 5
    local_key = (stripe, 'L', group_idx)
    if local_key not in distribution:
        raise ValueError(f"Local parity L_{stripe}_{group_idx} missing")
    components.append(('LOCAL', *distribution[local_key]))
    
    # 全局奇偶校验块
    for g in range(NUM_GLOBAL_PARITY):
        global_key = (stripe, 'G', g)
        if global_key not in distribution:
            raise ValueError(f"Global parity G_{stripe}_{g} missing")
        components.append((f'GLOBAL{g+1}', *distribution[global_key]))
    
    return components

def calculate_wear_impact(components):
    """计算更新对机架和SSD的写入影响"""
    rack_impact = defaultdict(int)
    ssd_impact = defaultdict(int)
    
    for entry in components:
        _, rack, ssd = entry
        rack_impact[f"R{rack:02d}"] += 1
        ssd_impact[ssd] += 1
    
    return rack_impact, ssd_impact

def generate_update_report(stripe, block_id, components, rack_impact, ssd_impact):
    """生成更新影响的详细报告"""
    report = [
        f"Storage Impact Analysis Report for D_{stripe}_{block_id}",
        "="*60,
        "Affected Storage Components:",
        "| Component Type | Rack | SSD Path        |",
        "|----------------|------|-----------------|"
    ]
    
    # 添加组件详情
    for comp_type, rack, ssd in components:
        report.append(f"| {comp_type:<14} | R{rack:02d} | {ssd:<15} |")
    
    # 添加磨损统计
    report.extend([
        "\nRack-level Write Impact:",
        "| Rack  | Write Count |",
        "|-------|-------------|"
    ])
    for rack, count in sorted(rack_impact.items()):
        report.append(f"| {rack} | {count:^11} |")
    
    return report

def write_update_report(report_content, stripe, block_id):
    """将更新报告写入文件"""
    filename = os.path.join(OUTPUT_DIR, f"update_impact_D_{stripe}_{block_id}.txt")
    with open(filename, 'w') as f:
        f.write('\n'.join(report_content))
    print(f"Report generated: {filename}")

def execute_update_commands(commands_with_desc):
    """并行执行更新命令，返回是否全部成功"""
    print(f"Executing update commands in parallel (max {MAX_PARALLEL_UPDATES} at once)...")
    results = run_commands_parallel(commands_with_desc, max_parallel=MAX_PARALLEL_UPDATES)
    
    # 检查失败的命令
    failures = [(cmd, output) for success, output, cmd in results if not success]
    
    if failures:
        print(f"\nWARNING: {len(failures)} commands failed during update:")
        for cmd, error in failures[:5]:  # 显示前几个失败
            print(f"  Command: {cmd}")
            print(f"  Error: {error}")
            print("")
        
        if len(failures) > 5:
            print(f"  ... and {len(failures) - 5} more failures.")
    else:
        print("All update commands completed successfully.")
    
    return len(failures) == 0

def simulate_update(distribution, stripe, block_id, execute=False):
    """模拟更新数据块，可选择实际并行执行"""
    # 获取受影响组件和影响分析
    components = get_affected_components(distribution, stripe, block_id)
    rack_impact, ssd_impact = calculate_wear_impact(components)
    
    # 准备报告
    report = generate_update_report(stripe, block_id, components, rack_impact, ssd_impact)
    write_update_report(report, stripe, block_id)
    
    # 在内存中跟踪更新
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    data_key = (stripe, 'D', block_id)
    rack_num, ssd_path = distribution[data_key]
    chunk_name = f"D_{stripe}_{block_id}"
    
    # 生成命令
    update_commands = []
    
    # 创建本地目录
    create_local_dir_cmd = f"mkdir -p {WORK_DIR}/test/chunks"
    update_commands.append((create_local_dir_cmd, f"Create local directory for chunks"))
    
    # 创建并上传数据块（防止竞态条件，先生成后上传）
    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
    remote_chunk_path = f"{ssd_path}/{chunk_name}"
    target_node = f"node{rack_num:02d}"

    create_and_copy_cmd = (
        # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_chunk_path} && "
        # f"scp -C {local_chunk_path} {USER_NAME}@{target_node}:{remote_chunk_path}"

        f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_chunk_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
    )
    update_commands.append((create_and_copy_cmd, f"Create and upload {chunk_name} to {target_node}"))
    
    # 更新奇偶校验块
    for comp_type, comp_rack, comp_ssd in components:
        if comp_type != 'DATA':  # 只处理奇偶校验块
            # 提取校验块类型和ID
            if comp_type.startswith('GLOBAL'):
                block_type = 'G'
                block_id_parity = int(comp_type[6:]) - 1  # GLOBAL1 -> 0, GLOBAL2 -> 1
            else:  # LOCAL
                block_type = 'L'
                block_id_parity = block_id // 5  # Group index
                
            parity_chunk_name = f"{block_type}_{stripe}_{block_id_parity}"
            local_parity_path = f"{WORK_DIR}/test/chunks/{parity_chunk_name}"
            remote_parity_path = f"{comp_ssd}/{parity_chunk_name}"
            target_node = f"node{comp_rack:02d}"
            
            # 合并dd和scp命令，确保完整生成后再上传
            create_and_copy_parity_cmd = (
                # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_parity_path} && "
                # f"scp -C {local_parity_path} {USER_NAME}@{target_node}:{remote_parity_path}"
                f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_parity_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
            )
            update_commands.append((create_and_copy_parity_cmd, f"Create and upload {parity_chunk_name} to {target_node}"))
    
    # 如果请求，并行执行命令
    if execute:
        success = execute_update_commands(update_commands)
        if not success:
            print(f"Warning: Some commands failed during update of D_{stripe}_{block_id}")
    
    # 添加到已更新块集合
    updated_blocks.add((stripe, block_id))
    
    # 记录更新
    update_entry = {
        "timestamp": timestamp,
        "block": chunk_name,
        "rack": rack_num,
        "ssd_path": ssd_path,
        "components": components
    }
    update_log.append(update_entry)
    
    # 更新日志文件
    log_path = os.path.join(OUTPUT_DIR, "update_log.txt")
    with open(log_path, "a") as log:
        log.write(f"{timestamp} - Updated {chunk_name} on {rack_num}:{ssd_path}\n")
        
        # 记录受影响组件
        for comp_type, rack, ssd in components:
            log.write(f"  - Affected {comp_type} on R{rack:02d}:{ssd}\n")
    
    print(f"Updated data block D_{stripe}_{block_id} {'(parallel execution)' if execute else '(virtual update)'}")
    print(f"Update logged to {log_path}")
    
    # 返回更新信息
    return {
        "updated_block": chunk_name,
        "timestamp": timestamp,
        "affected_components": components,
        "rack_impact": dict(rack_impact),
        "ssd_impact": dict(ssd_impact)
    }

def generate_random_updates(distribution, count, stripe_range=None):
    """生成随机数据块更新列表"""
    # 获取所有符合条件的数据块
    data_blocks = []
    for (s, block_type, b) in distribution.keys():
        if block_type == 'D':  # 只选择数据块
            if stripe_range is None or (stripe_range[0] <= s <= stripe_range[1]):
                data_blocks.append((s, b))
    
    # 随机选择指定数量的块
    if count > len(data_blocks):
        count = len(data_blocks)
        print(f"Warning: Requested more updates than available blocks. Using {count} blocks.")
    
    selected = random.sample(data_blocks, count)
    return selected

def generate_ssh_update_commands(distribution, stripe, block_id, with_descriptions=False):
    """生成SSH命令更新数据块和对应的奇偶校验块"""
    # 获取受影响组件
    components = get_affected_components(distribution, stripe, block_id)
    commands = []
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    
    # 创建本地目录
    create_local_dir_cmd = f"mkdir -p {WORK_DIR}/test/chunks"
    if with_descriptions:
        commands.append((create_local_dir_cmd, f"Create local directory for chunks"))
    else:
        commands.append(create_local_dir_cmd)
    
    # 生成更新数据块的命令
    data_key = (stripe, 'D', block_id)
    rack_num, ssd_path = distribution[data_key]
    chunk_name = f"D_{stripe}_{block_id}"
    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
    remote_chunk_path = f"{ssd_path}/{chunk_name}"
    target_node = f"node{rack_num:02d}"
    
    # 合并dd和scp命令，确保先完成生成再传输
    create_and_copy_cmd = (
        # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_chunk_path} && "
        # f"scp -C {local_chunk_path} {USER_NAME}@{target_node}:{remote_chunk_path}"
        f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_chunk_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
    )
    if with_descriptions:
        commands.append((create_and_copy_cmd, f"Create and upload {chunk_name} to {target_node}"))
    else:
        commands.append(create_and_copy_cmd)
    
    # 生成更新奇偶校验块的命令
    for comp_type, comp_rack, comp_ssd in components:
        if comp_type != 'DATA':  # 只处理奇偶校验块
            # 提取块类型和ID
            if comp_type.startswith('GLOBAL'):
                block_type = 'G'
                block_id_parity = int(comp_type[6:]) - 1  # GLOBAL1 -> 0, GLOBAL2 -> 1
            else:  # LOCAL
                block_type = 'L'
                block_id_parity = block_id // 5  # Group index
                
            parity_chunk_name = f"{block_type}_{stripe}_{block_id_parity}"
            local_parity_path = f"{WORK_DIR}/test/chunks/{parity_chunk_name}"
            remote_parity_path = f"{comp_ssd}/{parity_chunk_name}"
            target_node = f"node{comp_rack:02d}"
            
            # 合并dd和scp命令
            create_and_copy_parity_cmd = (
                # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_parity_path} && "
                # f"scp -C {local_parity_path} {USER_NAME}@{target_node}:{remote_parity_path}"
                f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_parity_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
            )
            if with_descriptions:
                commands.append((create_and_copy_parity_cmd, f"Create and upload {parity_chunk_name} to {target_node}"))
            else:
                commands.append(create_and_copy_parity_cmd)
    
    return commands

def execute_batch_update(distribution, updates, parallel=True):
    """并行或顺序执行批量更新"""
    print(f"Executing batch update of {len(updates)} blocks {'in parallel' if parallel else 'sequentially'}...")
    
    if parallel:
        # 分成更小的批次处理，防止系统过载
        batch_size = MAX_PARALLEL_UPDATES // 4  # 每个更新会影响多个组件
        batches = [updates[i:i+batch_size] for i in range(0, len(updates), batch_size)]
        
        # 逐批处理
        for batch_idx, batch in enumerate(batches, 1):
            print(f"\nProcessing batch {batch_idx}/{len(batches)} ({len(batch)} blocks)...")
            
            # 为这批次生成所有命令
            all_commands = []
            for stripe, block_id in batch:
                commands = generate_ssh_update_commands(distribution, stripe, block_id, with_descriptions=True)
                all_commands.extend(commands)
            
            # 并行执行这批次的所有命令
            execute_update_commands(all_commands)
            
            # 批次之间短暂暂停
            if batch_idx < len(batches):
                print("Pausing briefly between batches...")
                time.sleep(0.5)
                
        print(f"\nCompleted parallel batch update of {len(updates)} blocks.")
    else:
        # 顺序执行
        for idx, (stripe, block_id) in enumerate(updates, 1):
            print(f"\nProcessing update {idx}/{len(updates)}: D_{stripe}_{block_id}")
            simulate_update(distribution, stripe, block_id, execute=True)
    
    return True

def generate_batch_update_script(distribution, updates, script_name="batch_update.sh", execute=False, parallel=True):
    """生成批量更新shell脚本，可选择立即执行"""
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    script_path = os.path.join(OUTPUT_DIR, script_name)
    
    with open(script_path, 'w') as script:
        script.write("#!/bin/bash\n\n")
        script.write(f"# Batch update script for {len(updates)} blocks\n")
        script.write(f"# Generated on {timestamp}\n\n")
        
        # 创建本地目录
        script.write("# Create local directory for test chunks\n")
        script.write(f"mkdir -p {WORK_DIR}/test/chunks\n\n")
        
        # 添加并行执行函数
        if parallel:
            script.write("# Function to execute commands in parallel with controlled concurrency\n")
            script.write("function parallel_exec() {\n")
            script.write("    local max_jobs=$1\n")
            script.write("    shift\n")
            script.write("    \n")
            script.write("    # Create a temporary directory for command files\n")
            script.write("    local tmpdir=$(mktemp -d /tmp/parallel_exec.XXXXXX)\n")
            script.write("    \n")
            script.write("    # Write each command to a separate file\n")
            script.write("    local count=0\n")
            script.write("    while [[ $# -gt 0 ]]; do\n")
            script.write("        echo \"#!/bin/bash\" > \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        echo \"$1\" >> \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        chmod +x \"$tmpdir/cmd_$count.sh\"\n")
            script.write("        shift\n")
            script.write("        count=$((count + 1))\n")
            script.write("    done\n")
            script.write("    \n")
            script.write("    # Execute commands with controlled parallelism\n")
            script.write("    local total=$count\n")
            script.write("    count=0\n")
            script.write("    local running=0\n")
            script.write("    local pids=()\n")
            script.write("    \n")
            script.write("    while [[ $count -lt $total ]]; do\n")
            script.write("        # Launch up to max_jobs processes\n")
            script.write("        while [[ $running -lt $max_jobs && $count -lt $total ]]; do\n")
            script.write("            \"$tmpdir/cmd_$count.sh\" &\n")
            script.write("            pids+=($!)\n")
            script.write("            running=$((running + 1))\n")
            script.write("            count=$((count + 1))\n")
            script.write("        done\n")
            script.write("        \n")
            script.write("        # Wait for any child to exit\n")
            script.write("        wait -n 2>/dev/null || true\n")
            script.write("        running=$((running - 1))\n")
            script.write("    done\n")
            script.write("    \n")
            script.write("    # Wait for all remaining children\n")
            script.write("    wait\n")
            script.write("    \n")
            script.write("    # Clean up\n")
            script.write("    rm -rf \"$tmpdir\"\n")
            script.write("}\n\n")
        
        # 添加更新摘要信息
        script.write("# Update summary:\n")
        script.write(f"echo 'Starting batch update of {len(updates)} blocks at $(date)'\n\n")
        
        # 跟踪受影响的机架用于统计
        rack_impacts = defaultdict(int)
        log_path = os.path.join(OUTPUT_DIR, "update_log.txt")
        script.write(f"# Ensure log file exists\n")
        script.write(f"touch \"{log_path}\"\n\n")
        
        # 根据并行模式生成批处理逻辑
        if parallel:
            # 分批处理更新
            batch_size = MAX_PARALLEL_UPDATES // 4
            update_batches = [updates[i:i+batch_size] for i in range(0, len(updates), batch_size)]
            
            for batch_idx, batch in enumerate(update_batches, 1):
                script.write(f"# Batch {batch_idx}/{len(update_batches)} - Processing {len(batch)} blocks\n")
                script.write(f"echo '[$(date +%H:%M:%S)] Processing batch {batch_idx}/{len(update_batches)} ({len(batch)} blocks)...'\n\n")
                
                # 收集需要并行执行的命令
                all_parallel_commands = []
                
                for stripe, block_id in batch:
                    # 获取影响信息
                    components = get_affected_components(distribution, stripe, block_id)
                    rack_impact, _ = calculate_wear_impact(components)
                    
                    # 更新统计信息
                    for rack, count in rack_impact.items():
                        rack_impacts[rack] += count
                    
                    # 写入更新日志
                    script.write(f"# Log update for D_{stripe}_{block_id}\n")
                    log_cmd = f"echo \"$(date +%Y%m%d%H%M%S) - Updated D_{stripe}_{block_id} on rack {distribution[(stripe, 'D', block_id)][0]}\" >> \"{log_path}\"\n"
                    script.write(log_cmd)
                    
                    # 生成数据块和奇偶校验块更新命令
                    data_key = (stripe, 'D', block_id)
                    rack_num, ssd_path = distribution[data_key]
                    chunk_name = f"D_{stripe}_{block_id}"
                    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
                    remote_chunk_path = f"{ssd_path}/{chunk_name}"
                    target_node = f"node{rack_num:02d}"
                    
                    # 合并dd和scp命令
                    create_and_copy_cmd = (
                        # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_chunk_path} && "
                        # f"scp -C {local_chunk_path} {USER_NAME}@{target_node}:{remote_chunk_path}"
                        f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_chunk_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
                    )
                    all_parallel_commands.append(create_and_copy_cmd.replace("'", "'\\''"))
                    
                    # 处理奇偶校验块
                    for comp_type, comp_rack, comp_ssd in components:
                        if comp_type != 'DATA':
                            if comp_type.startswith('GLOBAL'):
                                block_type = 'G'
                                block_id_parity = int(comp_type[6:]) - 1
                            else:  # LOCAL
                                block_type = 'L'
                                block_id_parity = block_id // 5
                                
                            parity_chunk_name = f"{block_type}_{stripe}_{block_id_parity}"
                            local_parity_path = f"{WORK_DIR}/test/chunks/{parity_chunk_name}"
                            remote_parity_path = f"{comp_ssd}/{parity_chunk_name}"
                            target_node = f"node{comp_rack:02d}"
                            
                            create_and_copy_parity_cmd = (
                                # f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_parity_path} && "
                                # f"scp -C {local_parity_path} {USER_NAME}@{target_node}:{remote_parity_path}"
                                f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_parity_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'"
                            )
                            all_parallel_commands.append(create_and_copy_parity_cmd.replace("'", "'\\''"))
                
                # 并行执行该批次的所有命令
                script.write("\n# Execute all commands for this batch in parallel\n")
                script.write(f"parallel_exec {MAX_PARALLEL_UPDATES} \\\n")
                for idx, cmd in enumerate(all_parallel_commands):
                    if idx < len(all_parallel_commands) - 1:
                        script.write(f"  '{cmd}' \\\n")
                    else:
                        script.write(f"  '{cmd}'\n")
                
                # 批次之间添加短暂暂停
                if batch_idx < len(update_batches):
                    script.write("\n# Short pause between batches\n")
                    script.write("sleep 0.1\n")
                script.write("\n")
        
        else:
            # 顺序更新逻辑
            for stripe, block_id in sorted(updates):
                # 获取影响信息
                components = get_affected_components(distribution, stripe, block_id)
                rack_impact, _ = calculate_wear_impact(components)
                
                # 更新统计信息
                for rack, count in rack_impact.items():
                    rack_impacts[rack] += count
                    
                # 添加命令与注释
                script.write(f"# Update block D_{stripe}_{block_id} (impacts {', '.join(rack_impact.keys())})\n")
                script.write(f"echo '[$(date +%H:%M:%S)] Updating D_{stripe}_{block_id}...'\n")
                
                # 获取数据块详情并生成命令
                data_key = (stripe, 'D', block_id)
                rack_num, ssd_path = distribution[data_key]
                chunk_name = f"D_{stripe}_{block_id}"
                local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
                remote_chunk_path = f"{ssd_path}/{chunk_name}"
                target_node = f"node{rack_num:02d}"
                
                script.write(f"# Create and upload data block D_{stripe}_{block_id}\n")

                # script.write(f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_chunk_path} && \\\n")
                # script.write(f"scp -C {local_chunk_path} {USER_NAME}@{target_node}:{remote_chunk_path}\n\n")
                script.write(f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_chunk_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'\n\n")
                
                # 处理奇偶校验块
                for comp_type, comp_rack, comp_ssd in components:
                    if comp_type != 'DATA':
                        if comp_type.startswith('GLOBAL'):
                            block_type = 'G'
                            block_id_parity = int(comp_type[6:]) - 1
                        else:  # LOCAL
                            block_type = 'L'
                            block_id_parity = block_id // 5
                            
                        parity_chunk_name = f"{block_type}_{stripe}_{block_id_parity}"
                        local_parity_path = f"{WORK_DIR}/test/chunks/{parity_chunk_name}"
                        remote_parity_path = f"{comp_ssd}/{parity_chunk_name}"
                        target_node = f"node{comp_rack:02d}"
                        
                        script.write(f"# Create and upload parity block {parity_chunk_name}\n")
                        # script.write(f"dd if=/dev/urandom bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=progress 2>/dev/null > {local_parity_path} && \\\n")
                        # script.write(f"scp -C {local_parity_path} {USER_NAME}@{target_node}:{remote_parity_path}\n\n")
                        script.write(f"ssh {USER_NAME}@{target_node} 'dd if=/dev/urandom of={remote_parity_path} bs={DEFAULT_BLOCK_SIZE} count=1 iflag=fullblock status=none'\n\n")
                
                # 添加短暂休眠
                script.write("sleep 1\n\n")
                
                # 将更新记录到日志文件
                log_cmd = f"echo \"$(date +%Y%m%d%H%M%S) - Updated D_{stripe}_{block_id} on rack {distribution[(stripe, 'D', block_id)][0]}\" >> \"{log_path}\"\n\n"
                script.write(log_cmd)
        
        # 在结尾添加摘要统计
        script.write("# Update complete, print summary\n")
        script.write("echo\n")
        script.write("echo 'Update Summary:'\n")
        script.write("echo '---------------'\n")
        script.write(f"echo 'Total blocks updated: {len(updates)}'\n")
        
        # 添加机架影响统计
        script.write("echo 'Rack write impact:'\n")
        for rack, count in sorted(rack_impacts.items()):
            script.write(f"echo '  {rack}: {count} writes'\n")
            
        script.write("echo\n")
        script.write("echo 'Batch update completed at $(date)'\n")
    
    # 设置为可执行并选择性执行
    os.chmod(script_path, 0o755)
    print(f"Batch update script generated: {script_path}")
    
    if execute:
        print(f"Executing batch update...")
        if os.path.exists(script_path):
            subprocess.run([f"{script_path}"], shell=True)
        else:
            execute_batch_update(distribution, updates, parallel=parallel)
    
    return script_path

def generate_multi_batch_update_scripts(distribution, num_batches, blocks_per_batch, execute=False, parallel=True):
    """生成多个批处理更新脚本，每个脚本更新特定数量的随机块"""
    timestamp = int(time.time())
    script_names = []
    master_script_name = os.path.join(OUTPUT_DIR, f"master_update_{num_batches}x{blocks_per_batch}_{timestamp}.sh")
    
    print(f"Generating {num_batches} batch update scripts, each updating {blocks_per_batch} blocks {'(with parallel execution)' if parallel else ''}...")
    
    # 生成每个批处理脚本
    for batch_idx in range(1, num_batches + 1):
        updates = generate_random_updates(distribution, blocks_per_batch)
        batch_script_base = f"batch_update_{batch_idx}_of_{num_batches}_{blocks_per_batch}_{timestamp}.sh"
        generate_batch_update_script(distribution, updates, script_name=batch_script_base, execute=False, parallel=parallel)
        script_names.append(batch_script_base)
        
    # 创建主脚本来运行所有批处理脚本
    with open(master_script_name, 'w') as master:
        master.write("#!/bin/bash\n\n")
        master.write(f"# Master script to run {num_batches} batch update scripts\n")
        master.write(f"# Each batch updates {blocks_per_batch} random blocks\n")
        master.write(f"# Generated on {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        master.write("echo '======================================================'\n")
        master.write(f"echo 'Starting execution of {num_batches} batch updates'\n")
        master.write("echo '======================================================'\n\n")
        
        # 切换到正确目录并执行批处理脚本
        master.write(f"# Change to output directory\n")
        master.write(f"cd \"{os.path.abspath(OUTPUT_DIR)}\"\n\n")
        
        # 添加每个批处理脚本的执行命令
        for idx, script in enumerate(script_names, 1):
            master.write(f"echo\n")
            master.write(f"echo '======================================================'\n")
            master.write(f"echo 'Executing batch {idx}/{num_batches}: {script}'\n")
            master.write(f"echo 'Started at: '$(date)\n")
            master.write(f"echo '======================================================'\n")
            master.write(f"\"./{script}\"\n\n")
            
            # 批次之间添加延迟
            if idx < len(script_names):
                master.write("# Short delay between batches\n")
                master.write("sleep 1\n\n")
        
        master.write("echo\n")
        master.write("echo '======================================================'\n")
        master.write("echo 'All batch updates completed successfully!'\n")
        master.write("echo 'Finished at: '$(date)\n")
        master.write("echo '======================================================'\n")
    
    # 设置为可执行
    os.chmod(master_script_name, 0o755)
    print(f"Master execution script generated: {master_script_name}")
    
    # 如果需要，立即执行
    if execute:
        print(f"Executing master script...")
        subprocess.run([f"{master_script_name}"], shell=True)
    
    return master_script_name

def direct_parallel_update(distribution, updates):
    """直接使用Python线程并行执行更新，无需生成脚本"""
    print(f"Executing {len(updates)} updates in parallel directly from Python...")
    return execute_batch_update(distribution, updates, parallel=True)

def print_help():
    """显示可用命令的帮助信息"""
    help_text = """
ECWIDE-SSD Simulator Commands:
------------------------------
report                      - 生成分布报告
commands [exec]             - 生成分布命令，添加"exec"以立即并行执行
update <s> <b> [exec]       - 模拟更新条带s中的块b，添加"exec"以执行命令
batch-update <count> [exec] [seq]
                            - 生成脚本以更新<count>个随机块，添加"exec"立即执行
                              添加"seq"以生成顺序（非并行）脚本
multi-batch-update <batches> <blocks_per_batch> [exec] [seq]
                            - 生成多个批处理更新脚本，每个更新指定数量的块
                              添加"exec"立即执行，"seq"生成顺序脚本
direct-parallel <count>     - 直接并行执行更新，无需脚本
status                      - 显示模拟状态
list <s> [rack]             - 列出条带s中的块，可选机架过滤器
help                        - 显示此帮助信息
exit                        - 退出模拟器
    """
    print(help_text)

def show_simulation_status(distribution):
    """显示模拟的当前状态"""
    data_count = len(updated_blocks)
    update_count = len(update_log)
    
    print("\n模拟状态:")
    print("-----------------")
    print(f"已更新数据块: {data_count}/{NUM_STRIPES*NUM_BLOCKS_PER_STRIPE}")
    print(f"已执行更新总数: {update_count}")
    
    # 显示机架影响统计
    if update_count > 0:
        rack_impacts = defaultdict(int)
        for entry in update_log:
            for comp_type, rack, ssd in entry["components"]:
                rack_impacts[f"R{rack:02d}"] += 1
        
        print("\n机架影响统计:")
        for rack, count in sorted(rack_impacts.items()):
            print(f"  {rack}: {count} 次写入")
    print("-----------------")

def list_stripe_blocks(distribution, stripe, rack=None):
    """列出给定条带中的所有块，可选按机架过滤"""
    print(f"\n条带 {stripe} 中的块:")
    print("--------------------------")
    
    # 按机架分组块
    rack_blocks = defaultdict(list)
    for (s, block_type, block_id), (r, ssd_path) in distribution.items():
        if s == stripe and (rack is None or r == rack):
            rack_blocks[r].append((block_type, block_id, ssd_path))
    
    # 显示每个机架的块
    for r in sorted(rack_blocks.keys()):
        print(f"\n机架 {r:02d}:")
        for block_type, block_id, ssd_path in sorted(rack_blocks[r]):
            chunk_name = f"{block_type}_{stripe}_{block_id}"
            status = "已更新" if block_type == 'D' and (stripe, block_id) in updated_blocks else "未更新"
            print(f"  {chunk_name:<12} -> {ssd_path:<15} [{status}]")

def run_interactive_loop(distribution):
    """运行交互式命令循环"""
    print("\nECWIDE-SSD Simulator started. Type 'help' for available commands.")
    print(f"All output files will be saved in: {os.path.abspath(OUTPUT_DIR)}")
    
    while True:
        try:
            cmd = input("\n> ").strip()
            
            if cmd == "":
                continue
                
            parts = cmd.split()
            action = parts[0].lower()
            
            if action == "exit":
                print("Exiting simulator...")
                break
                
            elif action == "help":
                print_help()
                
            elif action == "report":
                execute_distribution_plan(distribution)
                
            elif action == "commands":
                execute = len(parts) > 1 and parts[1].lower() == "exec"
                generate_distribution_commands(distribution, generate_script=True, execute=execute)
                
            elif action == "update":
                if len(parts) < 3:
                    print("Usage: update <stripe> <block_id> [exec]")
                    continue
                    
                try:
                    stripe = int(parts[1])
                    block_id = int(parts[2])
                    execute = len(parts) > 3 and parts[3].lower() == "exec"
                    validate_stripe_block(stripe, block_id)
                    simulate_update(distribution, stripe, block_id, execute=execute)
                except ValueError as e:
                    print(f"Error: {str(e)}")
            
            elif action == "batch-update":
                if len(parts) < 2:
                    print("Usage: batch-update <count> [exec] [seq]")
                    continue
                
                try:
                    count = int(parts[1])
                    execute = "exec" in [p.lower() for p in parts[2:]]
                    sequential = "seq" in [p.lower() for p in parts[2:]]
                    
                    if count <= 0:
                        print("Count must be a positive number")
                        continue
                    
                    updates = generate_random_updates(distribution, count)
                    script_name = generate_batch_update_script(
                        distribution, updates, 
                        script_name=f"batch_update_{count}_{int(time.time())}.sh",
                        execute=execute,
                        parallel=not sequential
                    )
                    
                except ValueError as e:
                    print(f"Error: {str(e)}")

            elif action == "multi-batch-update":
                if len(parts) < 3:
                    print("Usage: multi-batch-update <num_batches> <blocks_per_batch> [exec] [seq]")
                    continue
                
                try:
                    num_batches = int(parts[1])
                    blocks_per_batch = int(parts[2])
                    execute = "exec" in [p.lower() for p in parts[3:]]
                    sequential = "seq" in [p.lower() for p in parts[3:]]
                    
                    if num_batches <= 0 or blocks_per_batch <= 0:
                        print("Both number of batches and blocks per batch must be positive")
                        continue
                    
                    master_script = generate_multi_batch_update_scripts(
                        distribution, num_batches, blocks_per_batch, 
                        execute=execute,
                        parallel=not sequential
                    )
                    
                except ValueError as e:
                    print(f"Error: {str(e)}")
                    
            elif action == "direct-parallel":
                if len(parts) < 2:
                    print("Usage: direct-parallel <count>")
                    continue
                
                try:
                    count = int(parts[1])
                    
                    if count <= 0:
                        print("Count must be a positive number")
                        continue
                    
                    updates = generate_random_updates(distribution, count)
                    direct_parallel_update(distribution, updates)
                    
                except ValueError as e:
                    print(f"Error: {str(e)}")
                    
            elif action == "status":
                show_simulation_status(distribution)
                
            elif action == "list":
                if len(parts) < 2:
                    print("Usage: list <stripe> [rack]")
                    continue
                    
                try:
                    stripe = int(parts[1])
                    rack = int(parts[2]) if len(parts) > 2 else None
                    if not 1 <= stripe <= NUM_STRIPES:
                        print(f"Stripe must be between 1-{NUM_STRIPES}")
                        continue
                    if rack is not None and not 1 <= rack <= NUM_RACKS:
                        print(f"Rack must be between 1-{NUM_RACKS}")
                        continue
                    list_stripe_blocks(distribution, stripe, rack)
                except ValueError:
                    print("Stripe and rack must be numbers")
                    
            else:
                print(f"Unknown command: {action}")
                print("Type 'help' for available commands")
                
        except KeyboardInterrupt:
            print("\nUse 'exit' to quit the simulator")
        except Exception as e:
            print(f"Error: {str(e)}")

if __name__ == "__main__":
    # 计算分布方案
    print(f"ECWIDE-SSD Simulator (with Parallel Execution Support)")
    print(f"Current user: liuxynb")
    print(f"Output Directory: {os.path.abspath(OUTPUT_DIR)}")
    print("Calculating distribution plan...")
    distribution = create_distribution_plan()
    run_interactive_loop(distribution)