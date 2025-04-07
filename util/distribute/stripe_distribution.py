#!/usr/bin/env python3
import math
import os
import subprocess
import sys

# Configuration
USER_NAME = "femu"
WORK_DIR = "/home/femu/ecwide-ssd"
NUM_NODES = 8
NUM_STRIPES = 20
NUM_BLOCKS_PER_STRIPE = 20
NUM_LOCAL_PARITY = 4  # Local parity blocks per stripe
NUM_RACKS = 8  # Each node is considered a rack (node01=rack1, node02=rack2, etc.)

def get_rack_number(stripe, block):
    """
    Determine rack based on the new formula:
    R(s,b) = R_{2k+1} if (s is odd AND b < 3) OR (s is even AND b ≥ 3)
             R_{2k+2} otherwise
    Where k = b/5 (integer division)
    """
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
    """
    Determine SSD based on the formula:
    SSD(b) = (b mod 5) + 1
    """
    return (block % 5) + 1

def get_local_parity_location(stripe, parity_idx):
    """
    Determine local parity block location:
    L(s,b) = R_{2k}.SSD6 if s is odd
             R_{2k-1}.SSD6 if s is even
    Where k = b (local parity block index)
    
    For all stripes s ∈ [1,20] and local parity blocks b ∈ [0,3]
    """
    k = parity_idx + 1  # k = b + 1
    
    if stripe % 2 == 1:  # Odd stripe
        rack = 2*k
    else:  # Even stripe
        rack = 2*k - 1
    
    # Ensure rack is within valid range [1,8]
    rack = max(1, min(NUM_RACKS, rack))
    
    return (rack, 6)  # SSD6 is represented as 6

def create_distribution_plan():
    """
    Create a distribution plan for all stripes and blocks
    Returns a dictionary mapping (stripe, block_type, block_id) -> (node, ssd_path)
    """
    distribution = {}
    
    # Distribute data blocks
    for s in range(1, NUM_STRIPES + 1):
        for b in range(NUM_BLOCKS_PER_STRIPE):
            rack_num = get_rack_number(s, b)
            ssd_num = get_ssd_number(b)
            
            # Convert rack number to node number (1-indexed)
            node_num = rack_num  # Direct mapping in this case (rack1=node01, etc.)
            
            # Convert SSD number to path
            ssd_path = f"/mnt/nvme{ssd_num-1}"  # SSD1 -> nvme0, etc.
            
            # Store the mapping for this data block
            distribution[(s, "D", b)] = (node_num, ssd_path)
        
        # Handle local parity blocks for this stripe
        for b in range(NUM_LOCAL_PARITY):
            rack_num, ssd_num = get_local_parity_location(s, b)
            node_num = rack_num
            ssd_path = f"/mnt/nvme{ssd_num-1}"  # SSD6 -> nvme5
            
            # Store the mapping for this local parity block
            distribution[(s, "L", b)] = (node_num, ssd_path)
    
    return distribution

def execute_distribution_plan(distribution):
    """
    Execute the distribution plan by creating directories and placing files
    """
    # Create a report file
    with open("distribution_report.txt", "w") as report:
        report.write("Stripe Distribution Report\n")
        report.write("==========================\n\n")
        
        # Group by node for efficiency
        node_blocks = {}
        for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
            if node not in node_blocks:
                node_blocks[node] = []
            node_blocks[node].append((stripe, block_type, block_id, ssd_path))
        
        # For each node, create the necessary SSH commands
        for node in sorted(node_blocks.keys()):
            report.write(f"Node {node:02d} distribution:\n")
            for stripe, block_type, block_id, ssd_path in sorted(node_blocks[node]):
                chunk_name = f"{block_type}_{stripe}_{block_id}"
                full_path = f"{ssd_path}/{chunk_name}"
                report.write(f"  {chunk_name} -> {full_path}\n")
            report.write("\n")
    
    print(f"Distribution plan created and saved to distribution_report.txt")

def generate_distribution_commands():
    """
    Generate shell commands to execute the distribution
    """
    distribution = create_distribution_plan()
    
    with open("distribute_commands.sh", "w") as script:
        script.write("#!/bin/bash\n\n")
        script.write(f"# Generated distribution commands for {NUM_NODES} nodes, {NUM_STRIPES} stripes\n\n")
        
        # Group by node for efficiency
        node_blocks = {}
        for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
            if node not in node_blocks:
                node_blocks[node] = []
            node_blocks[node].append((stripe, block_type, block_id, ssd_path))
        
        # For each node, create the necessary SSH commands
        for node in sorted(node_blocks.keys()):
            script.write(f"# Node {node:02d} distribution\n")
            script.write(f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {WORK_DIR}/chunks'\n")
            
            # Group by SSD path for more efficient copying
            ssd_chunks = {}
            for stripe, block_type, block_id, ssd_path in node_blocks[node]:
                if ssd_path not in ssd_chunks:
                    ssd_chunks[ssd_path] = []
                ssd_chunks[ssd_path].append(f"{block_type}_{stripe}_{block_id}")
            
            # Create directories first
            for ssd_path in ssd_chunks.keys():
                script.write(f"ssh {USER_NAME}@node{node:02d} 'mkdir -p {ssd_path}'\n")
            
            # Copy chunks to appropriate locations
            for ssd_path, chunks in ssd_chunks.items():
                for chunk in sorted(chunks):
                    script.write(f"ssh {USER_NAME}@node{node:02d} 'cp {WORK_DIR}/chunks/{chunk} {ssd_path}/{chunk}'\n")
            
            script.write("\n")
    
    # Make the script executable
    os.chmod("distribute_commands.sh", 0o755)
    print(f"Distribution commands generated in distribute_commands.sh")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 stripe_distribution.py [report|execute|commands]")
        return
    
    action = sys.argv[1]
    
    if action == "report":
        # Just create a report without executing commands
        distribution = create_distribution_plan()
        execute_distribution_plan(distribution)
    elif action == "commands":
        # Generate shell commands for execution
        generate_distribution_commands()
    else:
        print(f"Unknown action: {action}")

if __name__ == "__main__":
    main()