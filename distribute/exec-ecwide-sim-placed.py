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

# Configuration
USER_NAME = "femu"  
WORK_DIR = "/home/femu/ecwide-ssd"
NUM_NODES = 8
NUM_STRIPES = 20
NUM_BLOCKS_PER_STRIPE = 20
NUM_LOCAL_PARITY = 4  # Local parity blocks per stripe
NUM_RACKS = 8  # Each node is considered a rack (node01=rack1, node02=rack2, etc.)
NUM_GLOBAL_PARITY = 2  # Number of global parity blocks per stripe

# Parallel execution configuration
MAX_PARALLEL_TRANSFERS = 16  # Maximum number of parallel SSH/scp operations
MAX_PARALLEL_UPDATES = 8     # Maximum number of parallel block updates

# 输出文件目录
OUTPUT_DIR = "placedway"  # 所有输出文件的目录
# 确保输出目录存在
os.makedirs(OUTPUT_DIR, exist_ok=True)

# In-memory tracking of blocks and updates
updated_blocks = set()  # Track which blocks have been updated
update_log = []  # Track update history

def get_rack_number(stripe, block):
    k = block // 5  # Integer division for k = b/5
    
    is_odd_stripe = stripe % 2 == 1
    condition = (is_odd_stripe and block < 3) or (not is_odd_stripe and block >= 3)
    
    if condition:
        rack = 2*k + 1  # R_{2k+1}
    else:
        rack = 2*k + 2  # R_{2k+2}
    
    # Ensure rack is within valid range [1,8]
    return max(1, min(NUM_RACKS, rack))

def get_ssd_number(block):
    return (block % 5) + 1

def get_local_parity_location(stripe, parity_idx):
    k = parity_idx + 1  # k = b + 1
    
    if stripe % 2 == 1:  # Odd stripe
        rack = 2*k
    else:  # Even stripe
        rack = 2*k - 1
    
    rack = max(1, min(NUM_RACKS, rack))
    
    return (rack, 6)  # SSD6 is represented as 6

def create_distribution_plan():
    distribution = {}
    global_ssd_counts = defaultdict(int)  # Track usage of each SSD (0-4) for global parity
    global_rack_counts = defaultdict(int)  # Track rack usage for global parity
    
    # Distribute data blocks and local parity
    for s in range(1, NUM_STRIPES + 1):
        # Data blocks
        data_locations = set()
        for b in range(NUM_BLOCKS_PER_STRIPE):
            rack_num = get_rack_number(s, b)
            ssd_num = get_ssd_number(b)
            ssd_index = ssd_num - 1  # Convert to 0-4 for SSD0-SSD4
            data_locations.add((rack_num, ssd_index))
            
            ssd_path = f"/mnt/nvme{ssd_index}"
            distribution[(s, "D", b)] = (rack_num, ssd_path)
        
        # Local parity blocks
        for b in range(NUM_LOCAL_PARITY):
            rack_num, ssd_num = get_local_parity_location(s, b)
            ssd_index = ssd_num - 1  # SSD6 corresponds to nvme5
            ssd_path = f"/mnt/nvme{ssd_index}"
            distribution[(s, "L", b)] = (rack_num, ssd_path)
        
        # Global parity blocks
        for g in range(NUM_GLOBAL_PARITY):
            # Generate candidate locations (rack, ssd) where ssd is 0-4 and not in data_locations
            candidates = []
            for rack in range(1, NUM_RACKS + 1):
                for ssd in range(5):  # SSD0-SSD4 (0-4)
                    if (rack, ssd) not in data_locations:
                        candidates.append((rack, ssd))
            
            if not candidates:
                raise ValueError(f"No available candidates for global parity in stripe {s}")
            
            # Select SSD with the least global usage
            # Group candidates by SSD
            ssd_groups = defaultdict(list)
            for r, s_ssd in candidates:
                ssd_groups[s_ssd].append(r)
            
            # Find SSD(s) with minimum global count
            min_ssd_count = min(global_ssd_counts[ssd] for ssd in ssd_groups.keys())
            eligible_ssds = [ssd for ssd in ssd_groups if global_ssd_counts[ssd] == min_ssd_count]
            
            # Among eligible SSDs, select the one with the most candidates to distribute racks better
            eligible_ssds.sort(key=lambda ssd: len(ssd_groups[ssd]), reverse=True)
            selected_ssd = eligible_ssds[0]
            
            # Now select a rack for this SSD, choosing the one with least global usage
            rack_candidates = ssd_groups[selected_ssd]
            min_rack_count = min(global_rack_counts[r] for r in rack_candidates)
            eligible_racks = [r for r in rack_candidates if global_rack_counts[r] == min_rack_count]
            
            selected_rack = eligible_racks[0]  # Simplest selection
            
            # Update counts
            global_ssd_counts[selected_ssd] += 1
            global_rack_counts[selected_rack] += 1
            
            # Assign to distribution
            ssd_path = f"/mnt/nvme{selected_ssd}"
            distribution[(s, "G", g)] = (selected_rack, ssd_path)
    
    return distribution

def execute_distribution_plan(distribution):
    # 修改文件路径
    report_path = os.path.join(OUTPUT_DIR, "distribution_report_placed.txt")
    with open(report_path, "w") as report:
        report.write("Stripe Distribution Report\n")
        report.write("==========================\n\n")
        
        node_blocks = defaultdict(list)
        for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
            node_blocks[node].append((stripe, block_type, block_id, ssd_path))
        
        for node in sorted(node_blocks.keys()):
            report.write(f"Node {node:02d} distribution:\n")
            for stripe, block_type, block_id, ssd_path in sorted(node_blocks[node]):
                chunk_name = f"{block_type}_{stripe}_{block_id}"
                full_path = f"{ssd_path}/{chunk_name}"
                report.write(f"  {chunk_name} -> {full_path}\n")
            report.write("\n")
    
    print(f"Distribution plan created and saved to {report_path}")

def run_command(cmd, description=None):
    """Execute a single command and return the result"""
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
    """
    Run multiple commands in parallel using a thread pool
    
    Args:
        commands_with_desc: List of (command, description) tuples
        max_parallel: Maximum number of parallel executions
        timeout: Optional timeout in seconds
    
    Returns:
        List of (success, output, command) tuples
    """
    results = []
    
    with ThreadPoolExecutor(max_workers=max_parallel) as executor:
        # Submit all commands to the executor
        future_to_cmd = {
            executor.submit(run_command, cmd, desc): (cmd, desc) 
            for cmd, desc in commands_with_desc
        }
        
        # Process results as they complete
        for future in as_completed(future_to_cmd, timeout=timeout):
            cmd, desc = future_to_cmd[future]
            try:
                success, output, _ = future.result()
                results.append((success, output, cmd))
                
                # Print progress
                status = "✓" if success else "✗"
                print(f"[{status}] {desc}")
                
            except Exception as e:
                results.append((False, f"Exception: {str(e)}", cmd))
                print(f"[✗] {desc} - {str(e)}")
    
    # Count successes and failures
    successes = sum(1 for success, _, _ in results if success)
    failures = len(results) - successes
    
    print(f"Command execution complete: {successes} succeeded, {failures} failed")
    
    return results

def generate_distribution_commands(distribution, generate_script=True, execute=False):
    """
    Generate distribution commands and optionally execute them in parallel
    
    Args:
        distribution: The distribution dictionary
        generate_script: Whether to generate a shell script
        execute: Whether to execute the commands directly in parallel
    """
    # Group commands by node
    node_commands = defaultdict(list)
    
    # First, generate all the mkdir commands
    mkdir_commands = []
    node_ssd_paths = defaultdict(set)
    
    for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
        node_ssd_paths[node].add(ssd_path)
    
    # Create directories on each node
    for node, ssd_paths in node_ssd_paths.items():
        for ssd_path in ssd_paths:
            cmd = f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {ssd_path}'"
            desc = f"Creating directory {ssd_path} on node{node:02d}"
            mkdir_commands.append((cmd, desc))
    
    # Then generate all the copy commands
    copy_commands = []
    
    for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
        chunk_name = f"{block_type}_{stripe}_{block_id}"
        cmd = f"scp {WORK_DIR}/test/chunks/{chunk_name} {USER_NAME}@node{node:02d}:{ssd_path}/{chunk_name}"
        desc = f"Copying {chunk_name} to node{node:02d}:{ssd_path}"
        copy_commands.append((cmd, desc))
    
    # Generate script if requested
    if generate_script:
        script_path = os.path.join(OUTPUT_DIR, "distribute_commands.sh")
        with open(script_path, "w") as script:
            script.write("#!/bin/bash\n\n")
            script.write(f"# Generated distribution commands for {NUM_NODES} nodes, {NUM_STRIPES} stripes\n\n")
            
            # Create local source directory
            script.write("# Ensure local source directory exists\n")
            script.write(f"mkdir -p {WORK_DIR}/test/chunks\n\n")
            
            # Create directories in parallel
            script.write("# Create remote directories in parallel\n")
            for cmd, _ in mkdir_commands:
                script.write(f"{cmd} &\n")
            script.write("\n# Wait for directory creation to complete\nwait\n\n")
            
            # Copy files in parallel (with controlled parallelism)
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
            
            # Group into batches
            batch_size = MAX_PARALLEL_TRANSFERS
            batches = [copy_commands[i:i+batch_size] for i in range(0, len(copy_commands), batch_size)]
            
            for batch_idx, batch in enumerate(batches, 1):
                script.write(f"# Batch {batch_idx}/{len(batches)}\n")
                
                # Build arguments for parallel_execute
                cmd_args = []
                for cmd, _ in batch:
                    cmd_escaped = cmd.replace("'", "'\\''")  # Escape single quotes
                    cmd_args.append(f"'{cmd_escaped}'")
                
                script.write(f"echo 'Processing batch {batch_idx}/{len(batches)} ({len(batch)} transfers)...'\n")
                script.write(f"parallel_execute {MAX_PARALLEL_TRANSFERS} {' '.join(cmd_args)}\n\n")
            
        os.chmod(script_path, 0o755)
        print(f"Distribution commands generated in {script_path}")
    
    # Execute commands if requested
    if execute:
        print("\nExecuting directory creation commands in parallel...")
        run_commands_parallel(mkdir_commands, max_parallel=MAX_PARALLEL_TRANSFERS)
        
        print("\nExecuting file transfer commands in parallel...")
        # Execute copy commands in batches to control parallelism
        total_batches = math.ceil(len(copy_commands) / MAX_PARALLEL_TRANSFERS)
        
        for batch_idx, i in enumerate(range(0, len(copy_commands), MAX_PARALLEL_TRANSFERS), 1):
            batch = copy_commands[i:i+MAX_PARALLEL_TRANSFERS]
            print(f"\nProcessing batch {batch_idx}/{total_batches} ({len(batch)} transfers)...")
            run_commands_parallel(batch, max_parallel=MAX_PARALLEL_TRANSFERS)
        
        print("\nDistribution completed.")

def validate_stripe_block(stripe, block_id):
    """Parameter validation function"""
    if not 1 <= stripe <= NUM_STRIPES:
        raise ValueError(f"Stripe must be between 1-{NUM_STRIPES}")
    if not 0 <= block_id < NUM_BLOCKS_PER_STRIPE:
        raise ValueError(f"Block ID must be between 0-{NUM_BLOCKS_PER_STRIPE-1}")

def get_affected_components(distribution, stripe, block_id):
    """Get all affected storage components"""
    components = []
    
    # Data block
    data_key = (stripe, 'D', block_id)
    if data_key not in distribution:
        raise ValueError(f"Data block D_{stripe}_{block_id} not found")
    components.append(('DATA', *distribution[data_key]))
    
    # Local parity block
    group_idx = block_id // 5
    local_key = (stripe, 'L', group_idx)
    if local_key not in distribution:
        raise ValueError(f"Local parity L_{stripe}_{group_idx} missing")
    components.append(('LOCAL', *distribution[local_key]))
    
    # Global parity blocks
    for g in range(NUM_GLOBAL_PARITY):
        global_key = (stripe, 'G', g)
        if global_key not in distribution:
            raise ValueError(f"Global parity G_{stripe}_{g} missing")
        components.append((f'GLOBAL{g+1}', *distribution[global_key]))
    
    return components

def calculate_wear_impact(components):
    """Calculate rack and SSD wear impact"""
    rack_impact = defaultdict(int)
    ssd_impact = defaultdict(int)
    
    for entry in components:
        _, rack, ssd = entry
        rack_impact[f"R{rack:02d}"] += 1
        ssd_impact[ssd] += 1
    
    return rack_impact, ssd_impact

def generate_update_report(stripe, block_id, components, rack_impact, ssd_impact):
    """Generate detailed update report"""
    report = [
        f"Storage Impact Analysis Report for D_{stripe}_{block_id}",
        "="*60,
        "Affected Storage Components:",
        "| Component Type | Rack | SSD Path        |",
        "|----------------|------|-----------------|"
    ]
    
    # Add component details
    for comp_type, rack, ssd in components:
        report.append(f"| {comp_type:<14} | R{rack:02d} | {ssd:<15} |")
    
    # Add wear statistics
    report.extend([
        "\nRack-level Write Impact:",
        "| Rack  | Write Count |",
        "|-------|-------------|"
    ])
    for rack, count in sorted(rack_impact.items()):
        report.append(f"| {rack} | {count:^11} |")
    
    return report

def write_update_report(report_content, stripe, block_id):
    """Write report to file"""
    filename = os.path.join(OUTPUT_DIR, f"update_impact_D_{stripe}_{block_id}.txt")
    with open(filename, 'w') as f:
        f.write('\n'.join(report_content))
    print(f"Report generated: {filename}")

def execute_update_commands(commands_with_desc):
    """Execute update commands in parallel"""
    print(f"Executing update commands in parallel (max {MAX_PARALLEL_UPDATES} at once)...")
    results = run_commands_parallel(commands_with_desc, max_parallel=MAX_PARALLEL_UPDATES)
    
    # Check for any failures
    failures = [(cmd, output) for success, output, cmd in results if not success]
    
    if failures:
        print(f"\nWARNING: {len(failures)} commands failed during update:")
        for cmd, error in failures[:5]:  # Show first few failures
            print(f"  Command: {cmd}")
            print(f"  Error: {error}")
            print("")
        
        if len(failures) > 5:
            print(f"  ... and {len(failures) - 5} more failures.")
    else:
        print("All update commands completed successfully.")
    
    return len(failures) == 0  # Return True if all commands succeeded

def simulate_update(distribution, stripe, block_id, execute=False):
    """Simulate updating a data block with option for actual parallel execution"""
    # Get affected components
    components = get_affected_components(distribution, stripe, block_id)
    rack_impact, ssd_impact = calculate_wear_impact(components)
    
    # Prepare report
    report = generate_update_report(stripe, block_id, components, rack_impact, ssd_impact)
    write_update_report(report, stripe, block_id)
    
    # Track the update in memory
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    data_key = (stripe, 'D', block_id)
    rack_num, ssd_path = distribution[data_key]
    chunk_name = f"D_{stripe}_{block_id}"
    
    # Generate commands
    update_commands = []
    
    # 创建本地目录
    create_local_dir_cmd = f"mkdir -p {WORK_DIR}/test/chunks"
    update_commands.append((create_local_dir_cmd, f"Create local directory for chunks"))
    
    # 获取本地原始文件大小
    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
    get_size_cmd = f"stat -c%s {local_chunk_path} 2>/dev/null || echo 1048576"
    update_commands.append((get_size_cmd, f"Get local file size of {chunk_name}"))
    
    # 创建更新后的数据块（本地创建）
    create_data_block_cmd = (
        f"FILESIZE=$({get_size_cmd}); "
        f"dd if=/dev/urandom bs=$FILESIZE count=1 2>/dev/null | "
        f"sed \"s/^/Updated_{timestamp}_/\" | head -c $FILESIZE > {local_chunk_path}"
    )
    update_commands.append((create_data_block_cmd, f"Create updated content for {chunk_name} (same size)"))
    
    # 复制更新后的数据块到目标节点
    copy_cmd = f"scp {local_chunk_path} {USER_NAME}@node{rack_num:02d}:{ssd_path}/{chunk_name}"
    update_commands.append((copy_cmd, f"Copy updated {chunk_name} to node{rack_num:02d}"))
    
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
            
            # 获取本地校验块大小
            get_parity_size_cmd = f"stat -c%s {local_parity_path} 2>/dev/null || echo 1048576"
            update_commands.append((get_parity_size_cmd, f"Get local file size of {parity_chunk_name}"))
            
            # 创建更新后的奇偶校验块（本地创建）
            create_parity_block_cmd = (
                f"FILESIZE=$({get_parity_size_cmd}); "
                f"dd if=/dev/urandom bs=$FILESIZE count=1 2>/dev/null | "
                f"sed \"s/^/UpdatedParity_{timestamp}_/\" | head -c $FILESIZE > {local_parity_path}"
            )
            update_commands.append((create_parity_block_cmd, f"Create updated content for {parity_chunk_name} (same size)"))
            
            # 复制更新后的奇偶校验块
            copy_parity_cmd = f"scp {local_parity_path} {USER_NAME}@node{comp_rack:02d}:{comp_ssd}/{parity_chunk_name}"
            update_commands.append((copy_parity_cmd, f"Copy updated {parity_chunk_name} to node{comp_rack:02d}"))
    
    # Execute in parallel if requested
    if execute:
        success = execute_update_commands(update_commands)
        if not success:
            print(f"Warning: Some commands failed during update of D_{stripe}_{block_id}")
    
    # Add to updated blocks set
    updated_blocks.add((stripe, block_id))
    
    # Log the update
    update_entry = {
        "timestamp": timestamp,
        "block": chunk_name,
        "rack": rack_num,
        "ssd_path": ssd_path,
        "components": components
    }
    update_log.append(update_entry)
    
    # 修改日志文件路径
    log_path = os.path.join(OUTPUT_DIR, "update_log.txt")
    with open(log_path, "a") as log:
        log.write(f"{timestamp} - Updated {chunk_name} on {rack_num}:{ssd_path}\n")
        
        # Log affected components
        for comp_type, rack, ssd in components:
            log.write(f"  - Affected {comp_type} on R{rack:02d}:{ssd}\n")
    
    print(f"Updated data block D_{stripe}_{block_id} {'(parallel execution)' if execute else '(virtual update)'}")
    print(f"Update logged to {log_path}")
    
    # Return information about the update
    return {
        "updated_block": chunk_name,
        "timestamp": timestamp,
        "affected_components": components,
        "rack_impact": dict(rack_impact),
        "ssd_impact": dict(ssd_impact)
    }

def generate_random_updates(distribution, count, stripe_range=None):
    """Generate a list of random data blocks to update"""
    # Get all data blocks from distribution
    data_blocks = []
    for (s, block_type, b) in distribution.keys():
        if block_type == 'D':
            if stripe_range is None or (stripe_range[0] <= s <= stripe_range[1]):
                data_blocks.append((s, b))
    
    # Select a random subset of blocks
    if count > len(data_blocks):
        count = len(data_blocks)
        print(f"Warning: Requested more updates than available blocks. Using {count} blocks.")
    
    selected = random.sample(data_blocks, count)
    return selected

def generate_ssh_update_commands(distribution, stripe, block_id, with_descriptions=False):
    """Generate SSH commands to simulate updating a block by deleting and re-transferring"""
    # Get affected components
    components = get_affected_components(distribution, stripe, block_id)
    
    commands = []
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    
    # Generate the data block update command
    data_key = (stripe, 'D', block_id)
    rack_num, ssd_path = distribution[data_key]
    chunk_name = f"D_{stripe}_{block_id}"
    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
    
    # 创建本地目录
    create_local_dir_cmd = f"mkdir -p {WORK_DIR}/test/chunks"
    if with_descriptions:
        commands.append((create_local_dir_cmd, f"Create local directory for chunks"))
    else:
        commands.append(create_local_dir_cmd)
    
    # 本地查询文件大小
    get_size_cmd = f"stat -c%s {local_chunk_path} 2>/dev/null || echo 1048576"
    if with_descriptions:
        commands.append((get_size_cmd, f"Get local file size of {chunk_name}"))
    else:
        commands.append(get_size_cmd)
    
    # 创建更新后的数据块（本地创建）
    create_data_block_cmd = (
        f"FILESIZE=$({get_size_cmd}); "
        f"dd if=/dev/urandom bs=$FILESIZE count=1 2>/dev/null | "
        f"sed \"s/^/Updated_{timestamp}_/\" | head -c $FILESIZE > {local_chunk_path}"
    )
    if with_descriptions:
        commands.append((create_data_block_cmd, f"Create updated content for {chunk_name} (same size)"))
    else:
        commands.append(create_data_block_cmd)
    
    # SCP命令 - 从本地复制到远程节点
    scp_cmd = f"scp {local_chunk_path} {USER_NAME}@node{rack_num:02d}:{ssd_path}/{chunk_name}"
    if with_descriptions:
        commands.append((scp_cmd, f"Copy {chunk_name} to node{rack_num:02d}"))
    else:
        commands.append(scp_cmd)
    
    # Generate commands for updating parity blocks
    for comp_type, comp_rack, comp_ssd in components:
        if comp_type != 'DATA':  # Only process parity blocks
            # Extract the block type and ID from the component type
            if comp_type.startswith('GLOBAL'):
                block_type = 'G'
                block_id_parity = int(comp_type[6:]) - 1  # GLOBAL1 -> 0, GLOBAL2 -> 1
            else:  # LOCAL
                block_type = 'L'
                block_id_parity = block_id // 5  # Group index
                
            parity_chunk_name = f"{block_type}_{stripe}_{block_id_parity}"
            local_parity_path = f"{WORK_DIR}/test/chunks/{parity_chunk_name}"
            
            # 获取本地校验块大小
            get_parity_size_cmd = f"stat -c%s {local_parity_path} 2>/dev/null || echo 1048576"
            if with_descriptions:
                commands.append((get_parity_size_cmd, f"Get local file size of {parity_chunk_name}"))
            else:
                commands.append(get_parity_size_cmd)
                
            # 创建更新后的奇偶校验块（本地创建）
            create_parity_block_cmd = (
                f"FILESIZE=$({get_parity_size_cmd}); "
                f"dd if=/dev/urandom bs=$FILESIZE count=1 2>/dev/null | "
                f"sed \"s/^/UpdatedParity_{timestamp}_/\" | head -c $FILESIZE > {local_parity_path}"
            )
            if with_descriptions:
                commands.append((create_parity_block_cmd, f"Create updated content for {parity_chunk_name} (same size)"))
            else:
                commands.append(create_parity_block_cmd)
            
            # SCP命令 - 将更新的奇偶校验块从本地复制到远程节点
            scp_parity_cmd = f"scp {local_parity_path} {USER_NAME}@node{comp_rack:02d}:{comp_ssd}/{parity_chunk_name}"
            if with_descriptions:
                commands.append((scp_parity_cmd, f"Copy {parity_chunk_name} to node{comp_rack:02d}"))
            else:
                commands.append(scp_parity_cmd)
    
    return commands

def execute_batch_update(distribution, updates, parallel=True):
    """Execute a batch of updates in parallel or sequentially"""
    print(f"Executing batch update of {len(updates)} blocks {'in parallel' if parallel else 'sequentially'}...")
    
    if parallel:
        # Process in smaller batches to prevent flooding the system
        batch_size = MAX_PARALLEL_UPDATES // 4  # Each update affects multiple components
        batches = [updates[i:i+batch_size] for i in range(0, len(updates), batch_size)]
        
        for batch_idx, batch in enumerate(batches, 1):
            print(f"\nProcessing batch {batch_idx}/{len(batches)} ({len(batch)} blocks)...")
            
            # Generate all commands for this batch with descriptions
            all_commands = []
            for stripe, block_id in batch:
                commands = generate_ssh_update_commands(distribution, stripe, block_id, with_descriptions=True)
                all_commands.extend(commands)
            
            # Execute all commands for this batch in parallel
            execute_update_commands(all_commands)
            
            # Short pause between batches if needed
            if batch_idx < len(batches):
                print("Pausing briefly between batches...")
                time.sleep(0.5)
                
        print(f"\nCompleted parallel batch update of {len(updates)} blocks.")
    else:
        # Sequential execution
        for idx, (stripe, block_id) in enumerate(updates, 1):
            print(f"\nProcessing update {idx}/{len(updates)}: D_{stripe}_{block_id}")
            simulate_update(distribution, stripe, block_id, execute=True)
    
    return True

def generate_batch_update_script(distribution, updates, script_name="batch_update.sh", execute=False, parallel=True):
    """Generate a shell script with SSH commands to execute multiple updates"""
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # 添加目录前缀到脚本名称
    script_path = os.path.join(OUTPUT_DIR, script_name)
    
    with open(script_path, 'w') as script:
        script.write("#!/bin/bash\n\n")
        script.write(f"# Batch update script for {len(updates)} blocks\n")
        script.write(f"# Generated on {timestamp}\n\n")
        
        # Create local directory for chunks
        script.write("# Create local directory for test chunks\n")
        script.write(f"mkdir -p {WORK_DIR}/test/chunks\n\n")
        
        # Add function to execute commands in parallel
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
        
        script.write("# Update summary:\n")
        script.write(f"echo 'Starting batch update of {len(updates)} blocks at $(date)'\n\n")
        
        # Track affected racks for statistics
        rack_impacts = defaultdict(int)
        
        # 修改日志文件路径
        log_path = os.path.join(OUTPUT_DIR, "update_log.txt")
        script.write(f"# Ensure log file exists\n")
        script.write(f"touch \"{log_path}\"\n\n")
        
        if parallel:
            # Process updates in batches
            batch_size = MAX_PARALLEL_UPDATES // 4  # Each update affects multiple commands
            update_batches = [updates[i:i+batch_size] for i in range(0, len(updates), batch_size)]
            
            for batch_idx, batch in enumerate(update_batches, 1):
                script.write(f"# Batch {batch_idx}/{len(update_batches)} - Processing {len(batch)} blocks\n")
                script.write(f"echo '[$(date +%H:%M:%S)] Processing batch {batch_idx}/{len(update_batches)} ({len(batch)} blocks)...'\n\n")
                
                all_commands = []
                for stripe, block_id in batch:
                    # Get impact information for comments
                    components = get_affected_components(distribution, stripe, block_id)
                    rack_impact, _ = calculate_wear_impact(components)
                    
                    # Update statistics
                    for rack, count in rack_impact.items():
                        rack_impacts[rack] += count
                    
                    # Log to update file
                    script.write(f"# Log update for D_{stripe}_{block_id}\n")
                    log_cmd = f"echo \"{datetime.datetime.now().strftime('%Y%m%d%H%M%S')} - Updated D_{stripe}_{block_id} on rack {distribution[(stripe, 'D', block_id)][0]}\" >> \"{log_path}\"\n\n"
                    script.write(log_cmd)
                    
                    # Add commands for this update
                    data_key = (stripe, 'D', block_id)
                    rack_num, ssd_path = distribution[data_key]
                    chunk_name = f"D_{stripe}_{block_id}"
                    timestamp_var = f"TIMESTAMP_{stripe}_{block_id}"
                    script.write(f"{timestamp_var}=$(date +%Y%m%d%H%M%S)\n")
                    local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
                    
                    # 本地查询文件大小
                    script.write(f"# Get local file size and create updated content for D_{stripe}_{block_id}\n")
                    script.write(f"FILESIZE_D_{stripe}_{block_id}=$(stat -c%s {local_chunk_path} 2>/dev/null || echo 1048576)\n")
                    
                    # 创建更新的数据块
                    script.write(f"dd if=/dev/urandom bs=$FILESIZE_D_{stripe}_{block_id} count=1 2>/dev/null | sed \"s/^/Updated_${timestamp_var}_/\" | head -c $FILESIZE_D_{stripe}_{block_id} > {local_chunk_path}\n")
                    
                    # 复制更新后的数据块
                    script.write(f"scp {local_chunk_path} {USER_NAME}@node{rack_num:02d}:{ssd_path}/{chunk_name}\n\n")
                    
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
                            
                            # 本地查询奇偶校验块大小
                            script.write(f"# Get local file size and create updated content for {parity_chunk_name}\n")
                            script.write(f"FILESIZE_{block_type}_{stripe}_{block_id_parity}=$(stat -c%s {local_parity_path} 2>/dev/null || echo 1048576)\n")
                            
                            # 创建更新的奇偶校验块
                            script.write(f"dd if=/dev/urandom bs=$FILESIZE_{block_type}_{stripe}_{block_id_parity} count=1 2>/dev/null | sed \"s/^/UpdatedParity_${timestamp_var}_/\" | head -c $FILESIZE_{block_type}_{stripe}_{block_id_parity} > {local_parity_path}\n")
                            
                            # 复制更新后的奇偶校验块
                            script.write(f"scp {local_parity_path} {USER_NAME}@node{comp_rack:02d}:{comp_ssd}/{parity_chunk_name}\n\n")
                
                # Add command list for parallel execution
                if all_commands:
                    script.write("\n# Execute commands in parallel\n")
                    for cmd in all_commands:
                        script.write(f"{cmd}\n")
                
                # Add a pause between batches if needed
                if batch_idx < len(update_batches):
                    script.write("\n# Short pause between batches\n")
                    script.write("sleep 0.5\n")
                script.write("\n")
        
        else:
            # Sequential update logic
            for stripe, block_id in sorted(updates):
                # Get impact information for comments
                components = get_affected_components(distribution, stripe, block_id)
                rack_impact, _ = calculate_wear_impact(components)
                
                # Update statistics
                for rack, count in rack_impact.items():
                    rack_impacts[rack] += count
                    
                # Add detailed command with comments
                script.write(f"# Update block D_{stripe}_{block_id} (impacts {', '.join(rack_impact.keys())})\n")
                script.write(f"echo '[$(date +%H:%M:%S)] Updating D_{stripe}_{block_id}...'\n")
                
                # Get data block details
                data_key = (stripe, 'D', block_id)
                rack_num, ssd_path = distribution[data_key]
                chunk_name = f"D_{stripe}_{block_id}"
                timestamp_var = f"TIMESTAMP_{stripe}_{block_id}"
                script.write(f"{timestamp_var}=$(date +%Y%m%d%H%M%S)\n")
                local_chunk_path = f"{WORK_DIR}/test/chunks/{chunk_name}"
                
                # 本地查询文件大小
                script.write(f"# Get local file size and create updated content for D_{stripe}_{block_id}\n")
                script.write(f"FILESIZE_D_{stripe}_{block_id}=$(stat -c%s {local_chunk_path} 2>/dev/null || echo 1048576)\n")
                
                # 创建更新的数据块
                script.write(f"dd if=/dev/urandom bs=$FILESIZE_D_{stripe}_{block_id} count=1 2>/dev/null | sed \"s/^/Updated_${timestamp_var}_/\" | head -c $FILESIZE_D_{stripe}_{block_id} > {local_chunk_path}\n")
                
                # 复制更新后的数据块
                script.write(f"scp {local_chunk_path} {USER_NAME}@node{rack_num:02d}:{ssd_path}/{chunk_name}\n\n")
                
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
                        
                        # 本地查询奇偶校验块大小
                        script.write(f"# Get local file size and create updated content for {parity_chunk_name}\n")
                        script.write(f"FILESIZE_{block_type}_{stripe}_{block_id_parity}=$(stat -c%s {local_parity_path} 2>/dev/null || echo 1048576)\n")
                        
                        # 创建更新的奇偶校验块
                        script.write(f"dd if=/dev/urandom bs=$FILESIZE_{block_type}_{stripe}_{block_id_parity} count=1 2>/dev/null | sed \"s/^/UpdatedParity_${timestamp_var}_/\" | head -c $FILESIZE_{block_type}_{stripe}_{block_id_parity} > {local_parity_path}\n")
                        
                        # 复制更新后的奇偶校验块
                        script.write(f"scp {local_parity_path} {USER_NAME}@node{comp_rack:02d}:{comp_ssd}/{parity_chunk_name}\n\n")
                
                # Add a sleep to prevent overwhelming the system
                script.write("sleep 0.01\n\n")
                
                # Log the update to our tracking file
                log_cmd = f"echo \"${timestamp_var} - Updated D_{stripe}_{block_id} on rack {distribution[(stripe, 'D', block_id)][0]}\" >> \"{log_path}\"\n\n"
                script.write(log_cmd)
        
        # Add summary statistics at the end
        script.write("# Update complete, print summary\n")
        script.write("echo\n")
        script.write("echo 'Update Summary:'\n")
        script.write("echo '---------------'\n")
        script.write(f"echo 'Total blocks updated: {len(updates)}'\n")
        
        # Add rack impact statistics
        script.write("echo 'Rack write impact:'\n")
        for rack, count in sorted(rack_impacts.items()):
            script.write(f"echo '  {rack}: {count} writes'\n")
            
        script.write("echo\n")
        script.write("echo 'Batch update completed at $(date)'\n")
    
    # Make executable
    os.chmod(script_path, 0o755)
    print(f"Batch update script generated: {script_path}")
    
    # Execute if requested
    if execute:
        print(f"Executing batch update...")
        if os.path.exists(script_path):
            # For shell script execution
            subprocess.run([f"{script_path}"], shell=True)
        else:
            # Direct Python execution
            execute_batch_update(distribution, updates, parallel=parallel)
    
    return script_path

def generate_multi_batch_update_scripts(distribution, num_batches, blocks_per_batch, execute=False, parallel=True):
    """Generate multiple batch update scripts, each updating a specific number of random blocks"""
    timestamp = int(time.time())
    script_names = []
    
    # 修改主脚本文件名
    master_script_name = os.path.join(OUTPUT_DIR, f"master_update_{num_batches}x{blocks_per_batch}_{timestamp}.sh")
    
    print(f"Generating {num_batches} batch update scripts, each updating {blocks_per_batch} blocks {'(with parallel execution)' if parallel else ''}...")
    
    # Generate each batch script
    for batch_idx in range(1, num_batches + 1):
        # Generate random updates for this batch
        updates = generate_random_updates(distribution, blocks_per_batch)
        
        # 创建脚本名称时不包括路径，只有基础文件名
        batch_script_base = f"batch_update_{batch_idx}_of_{num_batches}_{blocks_per_batch}_{timestamp}.sh"
        
        # 生成这个批处理更新脚本，传递基本文件名和并行标志
        generate_batch_update_script(distribution, updates, script_name=batch_script_base, execute=False, parallel=parallel)
        
        # 只保存基本文件名，因为主脚本执行时需要相对路径
        script_names.append(batch_script_base)
        
    # Now create a master script to run all the batch scripts
    with open(master_script_name, 'w') as master:
        master.write("#!/bin/bash\n\n")
        master.write(f"# Master script to run {num_batches} batch update scripts\n")
        master.write(f"# Each batch updates {blocks_per_batch} random blocks\n")
        master.write(f"# Generated on {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        master.write("echo '======================================================'\n")
        master.write(f"echo 'Starting execution of {num_batches} batch updates'\n")
        master.write("echo '======================================================'\n\n")
        
        # 添加两个命令：先切换到正确的目录，然后在相对路径中执行批处理脚本
        master.write(f"# Change to output directory\n")
        master.write(f"cd \"{os.path.abspath(OUTPUT_DIR)}\"\n\n")
        
        # Add each batch script with execution timing
        for idx, script in enumerate(script_names, 1):
            master.write(f"echo\n")
            master.write(f"echo '======================================================'\n")
            master.write(f"echo 'Executing batch {idx}/{num_batches}: {script}'\n")
            master.write(f"echo 'Started at: '$(date)\n")
            master.write(f"echo '======================================================'\n")
            # 执行批处理脚本（已在OUTPUT_DIR目录内）
            master.write(f"\"./{script}\"\n\n")
            
            # Add delay between batches if needed
            if idx < len(script_names):
                master.write("# Short delay between batches\n")
                master.write("sleep 1\n\n")
        
        master.write("echo\n")
        master.write("echo '======================================================'\n")
        master.write("echo 'All batch updates completed successfully!'\n")
        master.write("echo 'Finished at: '$(date)\n")
        master.write("echo '======================================================'\n")
    
    # Make executable
    os.chmod(master_script_name, 0o755)
    print(f"Master execution script generated: {master_script_name}")
    
    # Execute if requested
    if execute:
        print(f"Executing master script...")
        subprocess.run([f"{master_script_name}"], shell=True)
    
    return master_script_name

def direct_parallel_update(distribution, updates):
    """Directly execute updates in parallel using Python threads"""
    print(f"Executing {len(updates)} updates in parallel directly from Python...")
    
    # Execute the updates
    return execute_batch_update(distribution, updates, parallel=True)

def print_help():
    """Print help information about available commands"""
    help_text = """
ECWIDE-SSD Simulator Commands:
------------------------------
report                      - Generate distribution report
commands [exec]             - Generate distribution commands
                              Add "exec" to execute immediately in parallel
update <s> <b> [exec]       - Simulate updating stripe s, block b
                              Add "exec" to execute commands in parallel
batch-update <count> [exec] [seq]
                            - Generate script to update <count> random blocks
                              Add "exec" to execute immediately
                              Add "seq" to generate sequential (non-parallel) script
multi-batch-update <batches> <blocks_per_batch> [exec] [seq]
                            - Generate multiple batch update scripts
                              Each updating the specified number of blocks
                              Add "exec" to execute immediately
                              Add "seq" to generate sequential (non-parallel) scripts
direct-parallel <count>     - Execute updates directly in parallel without scripting
status                      - Show simulation status
list <s> [rack]             - List blocks for stripe s, optional rack filter
help                        - Show this help message
exit                        - Exit the simulator
    """
    print(help_text)

def show_simulation_status(distribution):
    """Show the current status of the simulation"""
    # Count updates by type
    data_count = len(updated_blocks)
    
    # Get update count from log
    update_count = len(update_log)
    
    print("\nSimulation Status:")
    print("-----------------")
    print(f"Updated data blocks: {data_count}/{NUM_STRIPES*NUM_BLOCKS_PER_STRIPE}")
    print(f"Total updates performed: {update_count}")
    
    # Display rack impact statistics
    if update_count > 0:
        rack_impacts = defaultdict(int)
        for entry in update_log:
            for comp_type, rack, ssd in entry["components"]:
                rack_impacts[f"R{rack:02d}"] += 1
        
        print("\nRack Impact Statistics:")
        for rack, count in sorted(rack_impacts.items()):
            print(f"  {rack}: {count} writes")
    print("-----------------")

def list_stripe_blocks(distribution, stripe, rack=None):
    """List all blocks in a given stripe, optionally filtered by rack"""
    print(f"\nBlocks in Stripe {stripe}:")
    print("--------------------------")
    
    # Group blocks by rack
    rack_blocks = defaultdict(list)
    for (s, block_type, block_id), (r, ssd_path) in distribution.items():
        if s == stripe and (rack is None or r == rack):
            rack_blocks[r].append((block_type, block_id, ssd_path))
    
    # Display blocks by rack
    for r in sorted(rack_blocks.keys()):
        print(f"\nRack {r:02d}:")
        for block_type, block_id, ssd_path in sorted(rack_blocks[r]):
            chunk_name = f"{block_type}_{stripe}_{block_id}"
            # Check if the data block has been updated (only for data blocks)
            status = "UPDATED" if block_type == 'D' and (stripe, block_id) in updated_blocks else "NOT UPDATED"
            print(f"  {chunk_name:<12} -> {ssd_path:<15} [{status}]")

def run_interactive_loop(distribution):
    """Run the interactive command loop"""
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
                    
                    # Generate random updates
                    updates = generate_random_updates(distribution, count)
                    
                    # Create script
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
                    
                    # Generate multiple batch update scripts
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
                    
                    # Generate random updates
                    updates = generate_random_updates(distribution, count)
                    
                    # Execute directly in parallel
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
    # Calculate distribution plan once
    print(f"ECWIDE-SSD Simulator (with Parallel Execution Support)")
    print(f"Current Date and Time: 2025-04-15 08:36:18")
    print(f"Current user: liuxynb")
    print(f"Output Directory: {os.path.abspath(OUTPUT_DIR)}")
    print("Calculating distribution plan...")
    distribution = create_distribution_plan()
    
    if len(sys.argv) > 1:
        # Support traditional command-line arguments
        action = sys.argv[1]
        if action == "report":
            execute_distribution_plan(distribution)
        
        elif action == "commands":
            execute = "--exec" in sys.argv
            generate_distribution_commands(distribution, generate_script=True, execute=execute)
            
        elif action == "update":
            if len(sys.argv) < 4:
                print("Usage: python3 stripe_distribution.py update <stripe> <block_id> [--exec]")
            else:
                try:
                    stripe = int(sys.argv[2])
                    block_id = int(sys.argv[3])
                    execute = "--exec" in sys.argv
                    validate_stripe_block(stripe, block_id)
                    simulate_update(distribution, stripe, block_id, execute=execute)
                    
                except ValueError as e:
                    print(f"Error: {str(e)}")
        
        elif action == "batch-update":
            if len(sys.argv) < 3:
                print("Usage: python3 stripe_distribution.py batch-update <count> [--exec] [--seq]")
            else:
                try:
                    count = int(sys.argv[2])
                    execute = "--exec" in sys.argv
                    sequential = "--seq" in sys.argv
                    
                    if count <= 0:
                        print("Count must be a positive number")
                    else:
                        # Generate random updates
                        updates = generate_random_updates(distribution, count)
                        
                        # Create script
                        generate_batch_update_script(
                            distribution, updates, 
                            script_name=f"batch_update_{count}_{int(time.time())}.sh",
                            execute=execute,
                            parallel=not sequential
                        )
                except ValueError as e:
                    print(f"Error: {str(e)}")
        
        elif action == "multi-batch-update":
            if len(sys.argv) < 4:
                print("Usage: python3 stripe_distribution.py multi-batch-update <num_batches> <blocks_per_batch> [--exec] [--seq]")
            else:
                try:
                    num_batches = int(sys.argv[2])
                    blocks_per_batch = int(sys.argv[3])
                    execute = "--exec" in sys.argv
                    sequential = "--seq" in sys.argv
                    
                    if num_batches <= 0 or blocks_per_batch <= 0:
                        print("Both number of batches and blocks per batch must be positive")
                    else:
                        # Generate multiple batch update scripts
                        generate_multi_batch_update_scripts(
                            distribution, num_batches, blocks_per_batch, 
                            execute=execute,
                            parallel=not sequential
                        )
                except ValueError as e:
                    print(f"Error: {str(e)}")
        
        elif action == "direct-parallel":
            if len(sys.argv) < 3:
                print("Usage: python3 stripe_distribution.py direct-parallel <count>")
            else:
                try:
                    count = int(sys.argv[2])
                    
                    if count <= 0:
                        print("Count must be a positive number")
                    else:
                        # Generate random updates
                        updates = generate_random_updates(distribution, count)
                        
                        # Execute directly in parallel
                        direct_parallel_update(distribution, updates)
                        
                except ValueError as e:
                    print(f"Error: {str(e)}")
        else:
            print(f"Unknown action: {action}")
    else:
        # Run in interactive mode
        run_interactive_loop(distribution)