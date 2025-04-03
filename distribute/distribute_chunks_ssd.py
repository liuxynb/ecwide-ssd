import subprocess  # 导入subprocess模块，用于执行shell命令
import threading  # 导入threading模块，用于创建和管理线程
import sys  # 导入sys模块，用于获取命令行参数
import random  # 导入random模块，用于随机数生成和随机选择

# 全局配置变量
user_name = "femu"  # 用户名
java_path = "${JAVA_HOME}/bin/java"  # Java可执行文件的路径
work_dir = "/home/femu/ecwide-ssd"  # 工作目录
chunks_dir = work_dir + "/test/chunks"  # 数据块目录
data_source = "zero"  # 数据源类型

def create_stripe_distribution(num_racks=8, disks_per_rack=6, num_stripes=20, 
                              data_blocks=20, local_parity_blocks=4, global_parity_blocks=2):
    """
    创建纠删码条带在机架和磁盘上的分布方案。
    
    参数:
        num_racks: 机架数量，默认为8
        disks_per_rack: 每个机架中的磁盘数，默认为6
        num_stripes: 条带数量，默认为20
        data_blocks: 每个条带中的数据块数量，默认为20
        local_parity_blocks: 每个条带中的局部校验块数量，默认为4
        global_parity_blocks: 每个条带中的全局校验块数量，默认为2
    
    返回:
        dict: 映射(rack_id, disk_id)到块列表的字典
    """
    # 初始化分布结构
    distribution = {}
    for rack in range(1, num_racks+1):
        for disk in range(1, disks_per_rack+1):
            distribution[(rack, disk)] = []
    
    # 为每个机架指定一个用于局部校验块的磁盘
    local_parity_disks = {}
    for rack in range(1, num_racks+1):
        local_parity_disks[rack] = random.randint(1, disks_per_rack)
    
    # 为每个条带分配块
    for stripe_id in range(1, num_stripes+1):
        # 分布局部校验块（每个条带4个）
        lp_racks = random.sample(range(1, num_racks+1), local_parity_blocks)
        for i, rack in enumerate(lp_racks):
            disk = local_parity_disks[rack]
            distribution[(rack, disk)].append(f"L_{stripe_id}_{i+1}")
        
        # 分布全局校验块（每个条带2个）
        # 每个磁盘最多有一个全局校验块
        available_slots = []
        for rack in range(1, num_racks+1):
            for disk in range(1, disks_per_rack+1):
                # 跳过已包含局部校验块的磁盘
                if disk == local_parity_disks[rack]:
                    continue
                
                # 检查此磁盘是否已有全局校验块
                has_global = any(block.startswith("G_") for block in distribution[(rack, disk)])
                if not has_global:
                    available_slots.append((rack, disk))
        
        # 确保我们有足够的位置放置全局校验块
        if len(available_slots) < global_parity_blocks:
            raise Exception("没有足够的可用位置放置全局校验块")
            
        # 为全局校验块选择位置
        gp_slots = random.sample(available_slots, global_parity_blocks)
        for i, (rack, disk) in enumerate(gp_slots):
            distribution[(rack, disk)].append(f"G_{stripe_id}_{i+1}")
            available_slots.remove((rack, disk))
        
        # 分布数据块（每个条带20个）
        # 对于每个数据块，找到一个尚未包含此条带块的磁盘
        for i in range(1, data_blocks+1):
            placed = False
            attempts = 0
            max_attempts = 100  # 防止无限循环
            
            while not placed and attempts < max_attempts:
                rack = random.randint(1, num_racks)
                disk = random.randint(1, disks_per_rack)
                
                # 跳过已包含此条带块的磁盘
                has_same_stripe = False
                for block in distribution[(rack, disk)]:
                    if block.startswith(f"L_{stripe_id}_") or block.startswith(f"G_{stripe_id}_") or block.startswith(f"D_{stripe_id}_"):
                        has_same_stripe = True
                        break
                
                if not has_same_stripe:
                    distribution[(rack, disk)].append(f"D_{stripe_id}_{i}")
                    placed = True
                
                attempts += 1
            
            if not placed:
                raise Exception(f"无法放置条带{stripe_id}的数据块{i}")
    
    return distribution

def generate_chunk_files(distribution, output_dir):
    """
    根据分布方案生成区块文件
    
    参数:
        distribution: 分布方案字典
        output_dir: 输出目录路径
    """
    for (rack, disk), blocks in distribution.items():
        # 为每个(rack, disk)对创建一个文件及其块
        with open(f"{output_dir}/{rack}_{disk}_chunks.txt", "w") as f:
            for block in blocks:
                block_type, stripe_id, block_id = block.split("_")
                f.write(f"{block_type},{stripe_id},{block_id}\n")

def multithread_work(n, func, *arg):
    """
    并行执行指定函数
    
    参数:
        n: 并行执行的线程数
        func: 要执行的函数
        *arg: 传递给函数的参数
    """
    thread_list = []
    for i in range(1, n + 1):
        t = threading.Thread(target=func, args=(i, *arg))
        t.start()
        thread_list.append(t)
    for t in thread_list:
        t.join()

def send_one(index, flag):
    """
    向单个节点发送文件
    
    参数:
        index: 节点索引
        flag: 发送类型，"program"表示程序文件，"config"表示配置文件，其他表示数据块
    """
    if flag == "program":
        cmd = "scp -r ./classes/ ./lib/ ./util/ {}@node{:0>2d}:{}/".format(user_name, index, work_dir)
    elif flag == "config":
        cmd = "scp ./config/* {}@node{:0>2d}:{}/config/".format(user_name, index, work_dir)
    else:
        out_bytes = subprocess.check_output("ls " + chunks_dir + "/%d_*" % index, shell=True)
        name = out_bytes.decode('utf-8').strip()
        cmd = "scp {} {}@node{:0>2d}:/tmp/stdfile".format(name, user_name, index)
    subprocess.call(cmd, shell=True, stdout=subprocess.DEVNULL)

def update(n, update_type):
    """
    更新节点
    
    参数:
        n: 节点数量
        update_type: 更新类型，"all"表示所有，"config"表示配置，其他表示程序
    """
    if update_type == "all":
        generate_nodes_config(n)
        multithread_work(n, send_one, "config")
        multithread_work(n, send_one, "program")
    else:
        if update_type == "config":
            generate_nodes_config(n)
        multithread_work(n, send_one, update_type)
    print("update %s ok" % update_type)

def start_single_node(index):
    """
    启动单个节点
    
    参数:
        index: 节点索引
    """
    cmd = "ssh {0}@node{1:0>2d} \"source /etc/profile;cd {3};nohup {2} DataNode {1} > output.log 2>&1 &\"".format(user_name, index, java_path, work_dir)
    subprocess.call(cmd, shell=True)

def stop_single_node(index):
    """
    停止单个节点
    
    参数:
        index: 节点索引
    """
    cmd = "ssh {}@node{:0>2d} \"pkill java\"".format(user_name, index)
    subprocess.call(cmd, shell=True)

def start_cluster(n):
    """
    启动集群
    
    参数:
        n: 节点数量
    """
    subprocess.call("nohup java MasterNode > output.log 2>&1 &", shell=True)  # 启动主节点
    multithread_work(n, start_single_node)
    print("start_cluster ok")

def stop_cluster(n):
    """
    停止集群
    
    参数:
        n: 节点数量
    """
    multithread_work(n, stop_single_node)
    subprocess.call("pkill java", shell=True)  # 停止主节点
    print("stop_cluster ok")

def generate_nodes_config(n):
    """
    生成节点配置文件
    
    参数:
        n: 节点数量
    """
    lines = []
    with open("config/nodes_ip.txt", "r") as f:
        lines = f.readlines()
    if lines:
        with open("config/nodes.ini", "w") as wf:
            for i in range(n+1):
                wf.write(lines[i].strip() + "\n")
    print("generate_config ok")

def get_node_chunk_info(n):
    """
    获取节点数据块信息
    
    参数:
        n: 节点数量
    
    返回:
        包含节点块信息的列表
    """
    result = [None] * (n + 1)
    out_bytes = subprocess.check_output(["ls", chunks_dir])
    names = out_bytes.decode('utf-8').split('\n')
    for name in names:
        if not name:
            continue
        s = name.split("_")
        if not s[0].isnumeric():
            continue
        node = int(s[0])
        if node > n:
            continue
        result[node] = (s[1], s[2])
    return result

def call_single_copy(index, num, chunk_type, chunk_id):
    """
    调用单个节点复制命令
    
    参数:
        index: 节点索引
        num: 条带数量
        chunk_type: 块类型
        chunk_id: 块ID
    """
    cmd = "ssh {}@node{:0>2d} \"cd {};bash util/copy_chunks.sh {} {} {}\"".format(user_name, index, work_dir, num, chunk_type, chunk_id)
    subprocess.call(cmd, shell=True)

def call_single_clean(index):
    """
    清理单个节点的数据块
    
    参数:
        index: 节点索引
    """
    cmd = "ssh {0}@node{1:0>2d} \"mkdir -p {2};rm -f {2}/* \"".format(user_name, index, chunks_dir)
    subprocess.call(cmd, shell=True)

def distribute_chunks(n, num_stripes):
    """
    分发数据块到各节点
    
    参数:
        n: 节点数量
        num_stripes: 条带数量
    """
    cmd = "mkdir -p {0};rm -f {0}/*".format(chunks_dir)
    subprocess.call(cmd, shell=True)
    
    # 创建分布方案 - 8个机架，每个机架6个磁盘
    num_racks = 8
    disks_per_rack = 6
    distribution = create_stripe_distribution(
        num_racks=num_racks, 
        disks_per_rack=disks_per_rack, 
        num_stripes=num_stripes,
        data_blocks=20, 
        local_parity_blocks=4, 
        global_parity_blocks=2
    )
    
    # 根据分布方案生成数据块文件
    generate_chunk_files(distribution, chunks_dir)
    
    # 按常规流程处理
    subprocess.call("java -Xmx8192m ChunkGenerator {} toy".format(data_source), shell=True)  # 生成块
    update(n, "std_chunks")
    info = get_node_chunk_info(n)
    multithread_work(n, call_single_clean)
    
    # 调用复制
    thread_list = []
    for i in range(1, n + 1):
        cur_info = info[i]
        t = threading.Thread(target=call_single_copy, args=(i, num_stripes, *cur_info))
        t.start()
        thread_list.append(t)
    for t in thread_list:
        t.join()
    print("distribute_chunks ok")

def print_distribution_stats(distribution):
    """
    打印分布统计信息用于验证
    
    参数:
        distribution: 分布方案字典
    """
    # 计算每个磁盘的块数
    blocks_per_disk = {}
    for (rack, disk), blocks in distribution.items():
        blocks_per_disk[(rack, disk)] = len(blocks)
    
    # 计算块类型数量
    block_types = {"L": 0, "G": 0, "D": 0}
    for _, blocks in distribution.items():
        for block in blocks:
            block_type = block.split("_")[0]
            block_types[block_type] += 1
    
    print("块分布统计信息:")
    print(f"数据块总数: {block_types['D']}")
    print(f"局部校验块总数: {block_types['L']}")
    print(f"全局校验块总数: {block_types['G']}")
    
    # 验证约束条件是否满足
    for (rack, disk), blocks in distribution.items():
        stripe_blocks = {}
        global_parity_count = 0
        local_parity_count = 0
        
        for block in blocks:
            block_type, stripe_id, _ = block.split("_")
            if block_type == "G":
                global_parity_count += 1
            elif block_type == "L":
                local_parity_count += 1
                
            # 跟踪每个条带的块
            if stripe_id not in stripe_blocks:
                stripe_blocks[stripe_id] = 0
            stripe_blocks[stripe_id] += 1
        
        # 检查约束条件
        for stripe_id, count in stripe_blocks.items():
            if count > 1:
                print(f"警告: 机架 {rack}, 磁盘 {disk} 有 {count} 个来自条带 {stripe_id} 的块")
        
        if global_parity_count > 1:
            print(f"警告: 机架 {rack}, 磁盘 {disk} 有 {global_parity_count} 个全局校验块")

if __name__ == "__main__":
    """主程序入口"""
    if len(sys.argv) == 3 and sys.argv[1] == "nodes_config":
        # 生成节点配置
        generate_nodes_config(int(sys.argv[2]))
    elif len(sys.argv) == 4 and sys.argv[1] == "update":
        # 更新节点
        update(int(sys.argv[3]), sys.argv[2])
    elif len(sys.argv) == 3 and sys.argv[1] == "start":
        # 启动集群
        start_cluster(int(sys.argv[2]))
    elif len(sys.argv) == 3 and sys.argv[1] == "stop":
        # 停止集群
        stop_cluster(int(sys.argv[2]))
    elif len(sys.argv) == 4 and sys.argv[1] == "distribute_chunks":
        # 分发数据块
        distribute_chunks(int(sys.argv[2]), int(sys.argv[3]))
    else:
        # 打印使用说明
        print("用法: start  n")
        print("   或: stop  n")
        print("   或: update  [all/config/program]  n")
        print("   或: distribute_chunks  n  stripe_num")
        print("   或: nodes_config  n")