#!/usr/bin/env python3
import subprocess
import sys
import os
from stripe_distribution import create_distribution_plan, NUM_STRIPES

def prepare_cluster(nodes):
    """Prepare cluster for distribution"""
    # Update configuration and programs
    subprocess.run(f"python3 cluster_manager.py update all {nodes}", shell=True, check=True)
    print("Cluster updated with latest configuration and programs")

def generate_chunks():
    """Generate all needed chunks"""
    subprocess.run("java -Xmx4096m ChunkGenerator zero 20", shell=True, check=True)
    print("Chunks generated")

def distribute_to_nodes(distribution):
    """Distribute chunks to nodes according to the distribution plan"""
    # Group by node for efficiency
    node_chunks = {}
    for (stripe, block_type, block_id), (node, ssd_path) in distribution.items():
        if node not in node_chunks:
            node_chunks[node] = []
        node_chunks[node].append((stripe, block_type, block_id, ssd_path))
    
    # Process each node
    for node in sorted(node_chunks.keys()):
        print(f"Processing node{node:02d}...")
        
        # Group by SSD path for more efficient copying
        ssd_chunks = {}
        for stripe, block_type, block_id, ssd_path in node_chunks[node]:
            if ssd_path not in ssd_chunks:
                ssd_chunks[ssd_path] = []
            chunk_name = f"{block_type}_{stripe}_{block_id}"
            ssd_chunks[ssd_path].append(chunk_name)
        
        # Ensure directories exist
        for ssd_path in ssd_chunks.keys():
            cmd = f"ssh femu@node{node:02d} 'mkdir -p {ssd_path}'"
            subprocess.run(cmd, shell=True, check=True)
        
        # Copy chunks to appropriate locations
        for ssd_path, chunks in ssd_chunks.items():
            # Create a temporary script for this node's operations
            script_path = f"temp_node{node:02d}_copy.sh"
            with open(script_path, "w") as script:
                script.write("#!/bin/bash\n\n")
                for chunk_name in sorted(chunks):
                    script.write(f"cp /home/femu/ecwide-ssd/test/chunks/{chunk_name} {ssd_path}/{chunk_name}\n")
            
            # Make script executable
            os.chmod(script_path, 0o755)
            
            # Copy the script to the node
            subprocess.run(f"scp {script_path} femu@node{node:02d}:~/", shell=True, check=True)
            
            # Execute the script on the node
            subprocess.run(f"ssh femu@node{node:02d} '~/temp_node{node:02d}_copy.sh'", shell=True, check=True)
            
            # Clean up
            subprocess.run(f"ssh femu@node{node:02d} 'rm ~/temp_node{node:02d}_copy.sh'", shell=True, check=True)
            os.remove(script_path)

def main():
    if len(sys.argv) != 2:
        print("Usage: python distribute_stripe_data.py <num_nodes>")
        return
    
    nodes = int(sys.argv[1])
    if nodes != 8:
        print("Warning: The distribution plan is designed for 8 nodes.")
    
    # Step 1: Prepare the cluster
    prepare_cluster(nodes)
    
    # Step 2: Generate chunks
    generate_chunks()
    
    # Step 3: Create distribution plan
    distribution = create_distribution_plan()
    
    # Step 4: Distribute according to plan
    distribute_to_nodes(distribution)
    
    print(f"Successfully distributed {NUM_STRIPES} stripes across {nodes} nodes")

if __name__ == "__main__":
    main()