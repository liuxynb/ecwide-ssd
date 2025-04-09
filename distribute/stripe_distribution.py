#!/usr/bin/env python3
import math
import os
import subprocess
import sys
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
    with open("distribution_report.txt", "w") as report:
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
    
    print("Distribution plan created and saved to distribution_report.txt")

def generate_distribution_commands():
    distribution = create_distribution_plan()
    
    with open("distribute_commands.sh", "w") as script:
        script.write("#!/bin/bash\n\n")
        script.write(f"# Generated distribution commands for {NUM_NODES} nodes, {NUM_STRIPES} stripes\n\n")
        
        node_blocks = defaultdict(list)
        for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
            node_blocks[node].append((stripe, block_type, block_id, ssd_path))
        
        for node in sorted(node_blocks.keys()):
            script.write(f"# Node {node:02d} distribution\n")
            script.write(f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {WORK_DIR}/chunks'\n")
            
            ssd_chunks = defaultdict(list)
            for stripe, block_type, block_id, ssd_path in node_blocks[node]:
                ssd_chunks[ssd_path].append(f"{block_type}_{stripe}_{block_id}")
            
            for ssd_path in ssd_chunks:
                script.write(f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {ssd_path}'\n")
            
            for ssd_path, chunks in ssd_chunks.items():
                for chunk in sorted(chunks):
                    script.write(f"ssh {USER_NAME}@node{node:02d} 'cp {WORK_DIR}/chunks/{chunk} {ssd_path}/{chunk}'\n")
            
            script.write("\n")
    
    os.chmod("distribute_commands.sh", 0o755)
    print("Distribution commands generated in distribute_commands.sh")


def validate_stripe_block(stripe, block_id):
    """参数验证函数"""
    if not 1 <= stripe <= NUM_STRIPES:
        raise ValueError(f"Stripe must be between 1-{NUM_STRIPES}")
    if not 0 <= block_id < NUM_BLOCKS_PER_STRIPE:
        raise ValueError(f"Block ID must be between 0-{NUM_BLOCKS_PER_STRIPE-1}")

def get_affected_components(distribution, stripe, block_id):
    """获取所有受影响的存储组件"""
    components = []
    
    # 数据块
    data_key = (stripe, 'D', block_id)
    if data_key not in distribution:
        raise ValueError(f"Data block D_{stripe}_{block_id} not found")
    components.append(('DATA', *distribution[data_key]))
    
    # 局部校验块
    group_idx = block_id // 5
    local_key = (stripe, 'L', group_idx)
    if local_key not in distribution:
        raise ValueError(f"Local parity L_{stripe}_{group_idx} missing")
    components.append(('LOCAL', *distribution[local_key]))
    
    # 全局校验块
    for g in range(NUM_GLOBAL_PARITY):
        global_key = (stripe, 'G', g)
        if global_key not in distribution:
            raise ValueError(f"Global parity G_{stripe}_{g} missing")
        components.append((f'GLOBAL{g+1}', *distribution[global_key]))
    
    return components

def calculate_wear_impact(components):
    """计算机架和SSD的磨损影响"""
    rack_impact = defaultdict(int)
    ssd_impact = defaultdict(int)
    
    for entry in components:
        _, rack, ssd = entry
        rack_impact[f"R{rack:02d}"] += 1
        ssd_impact[ssd] += 1
    
    return rack_impact, ssd_impact

def generate_update_report(stripe, block_id, components, rack_impact, ssd_impact):
    """生成详细的更新报告"""
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
    """将报告写入文件"""
    filename = f"update_impact_D_{stripe}_{block_id}.txt"
    with open(filename, 'w') as f:
        f.write('\n'.join(report_content))
    print(f"Report generated: {filename}")


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 stripe_distribution.py [report|commands|update]")
        return
    
    action = sys.argv[1]
    
    if action == "report":
        distribution = create_distribution_plan()
        execute_distribution_plan(distribution)
    elif action == "commands":
        generate_distribution_commands()
    elif action == "update":
        if len(sys.argv) != 4:
            print("Usage: update <stripe> <block_id>")
            return
        try:
            stripe = int(sys.argv[2])
            block_id = int(sys.argv[3])
            validate_stripe_block(stripe, block_id)
            
            distribution = create_distribution_plan()
            components = get_affected_components(distribution, stripe, block_id)
            rack_impact, ssd_impact = calculate_wear_impact(components)
            report = generate_update_report(stripe, block_id, components, rack_impact, ssd_impact)
            write_update_report(report, stripe, block_id)
            
        except ValueError as e:
            print(f"Error: {str(e)}")
    else:
        print(f"Unknown action: {action}")

if __name__ == "__main__":
    main()