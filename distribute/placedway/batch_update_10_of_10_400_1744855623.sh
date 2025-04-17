#!/bin/bash

# Batch update script for 400 blocks
# Generated on 2025-04-17 02:07:03

# Create local directory for test chunks
mkdir -p /home/femu/ecwide-ssd/test/chunks

# Function to execute commands in parallel with controlled concurrency
function parallel_exec() {
    local max_jobs=$1
    shift
    
    # Create a temporary directory for command files
    local tmpdir=$(mktemp -d /tmp/parallel_exec.XXXXXX)
    
    # Write each command to a separate file
    local count=0
    while [[ $# -gt 0 ]]; do
        echo "#!/bin/bash" > "$tmpdir/cmd_$count.sh"
        echo "$1" >> "$tmpdir/cmd_$count.sh"
        chmod +x "$tmpdir/cmd_$count.sh"
        shift
        count=$((count + 1))
    done
    
    # Execute commands with controlled parallelism
    local total=$count
    count=0
    local running=0
    local pids=()
    
    while [[ $count -lt $total ]]; do
        # Launch up to max_jobs processes
        while [[ $running -lt $max_jobs && $count -lt $total ]]; do
            "$tmpdir/cmd_$count.sh" &
            pids+=($!)
            running=$((running + 1))
            count=$((count + 1))
        done
        
        # Wait for any child to exit
        wait -n 2>/dev/null || true
        running=$((running - 1))
    done
    
    # Wait for all remaining children
    wait
    
    # Clean up
    rm -rf "$tmpdir"
}

# Update summary:
echo 'Starting batch update of 400 blocks at $(date)'

# Ensure log file exists
touch "placedway/update_log.txt"

# Batch 1/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 1/200 (2 blocks)...'

# Log update for D_2_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_18 on rack 7" >> "placedway/update_log.txt"
# Log update for D_2_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_16 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_18 femu@node07:/mnt/nvme3/D_2_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_16 femu@node07:/mnt/nvme1/D_2_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 2/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 2/200 (2 blocks)...'

# Log update for D_6_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_9_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_9 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_7 femu@node03:/mnt/nvme2/D_6_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_9 femu@node04:/mnt/nvme4/D_9_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 3/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/200 (2 blocks)...'

# Log update for D_8_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_10 on rack 5" >> "placedway/update_log.txt"
# Log update for D_5_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_3 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_10 femu@node05:/mnt/nvme0/D_8_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_3 femu@node02:/mnt/nvme3/D_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 4/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 4/200 (2 blocks)...'

# Log update for D_4_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_7_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_19 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_2 femu@node02:/mnt/nvme2/D_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_19 femu@node08:/mnt/nvme4/D_7_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 5/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 5/200 (2 blocks)...'

# Log update for D_11_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_16 on rack 8" >> "placedway/update_log.txt"
# Log update for D_19_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_16 femu@node08:/mnt/nvme1/D_11_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_4 femu@node02:/mnt/nvme4/D_19_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 6/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 6/200 (2 blocks)...'

# Log update for D_4_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_8_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_4 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_12 femu@node05:/mnt/nvme2/D_4_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_4 femu@node01:/mnt/nvme4/D_8_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 7/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 7/200 (2 blocks)...'

# Log update for D_6_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_20_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_12 femu@node05:/mnt/nvme2/D_6_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_13 femu@node05:/mnt/nvme3/D_20_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 8/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 8/200 (2 blocks)...'

# Log update for D_1_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_0 on rack 1" >> "placedway/update_log.txt"
# Log update for D_7_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_16 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_0 femu@node01:/mnt/nvme0/D_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_16 femu@node08:/mnt/nvme1/D_7_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 9/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 9/200 (2 blocks)...'

# Log update for D_2_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_20_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_6 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_12 femu@node05:/mnt/nvme2/D_2_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_6 femu@node03:/mnt/nvme1/D_20_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 10/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 10/200 (2 blocks)...'

# Log update for D_12_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_6_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_14 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_6 femu@node03:/mnt/nvme1/D_12_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_14 femu@node05:/mnt/nvme4/D_6_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 11/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 11/200 (2 blocks)...'

# Log update for D_13_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_19_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_6 femu@node04:/mnt/nvme1/D_13_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_2 femu@node01:/mnt/nvme2/D_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 12/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 12/200 (2 blocks)...'

# Log update for D_2_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_5_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_16 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_14 femu@node05:/mnt/nvme4/D_2_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_16 femu@node08:/mnt/nvme1/D_5_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 13/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 13/200 (2 blocks)...'

# Log update for D_3_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_16 on rack 8" >> "placedway/update_log.txt"
# Log update for D_20_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_15 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_16 femu@node08:/mnt/nvme1/D_3_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_15 femu@node07:/mnt/nvme0/D_20_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 14/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 14/200 (2 blocks)...'

# Log update for D_18_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_3 on rack 1" >> "placedway/update_log.txt"
# Log update for D_2_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_9 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_3 femu@node01:/mnt/nvme3/D_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_9 femu@node03:/mnt/nvme4/D_2_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 15/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 15/200 (2 blocks)...'

# Log update for D_11_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_7 on rack 4" >> "placedway/update_log.txt"
# Log update for D_18_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_7 femu@node04:/mnt/nvme2/D_11_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_5 femu@node03:/mnt/nvme0/D_18_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 16/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 16/200 (2 blocks)...'

# Log update for D_9_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_14 on rack 6" >> "placedway/update_log.txt"
# Log update for D_5_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_10 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_14 femu@node06:/mnt/nvme4/D_9_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_10 femu@node06:/mnt/nvme0/D_5_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 17/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 17/200 (2 blocks)...'

# Log update for D_10_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_14_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_17 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_6 femu@node03:/mnt/nvme1/D_10_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_17 femu@node07:/mnt/nvme2/D_14_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 18/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 18/200 (2 blocks)...'

# Log update for D_14_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_9_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_6 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_9 femu@node03:/mnt/nvme4/D_14_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_6 femu@node04:/mnt/nvme1/D_9_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 19/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 19/200 (2 blocks)...'

# Log update for D_20_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_8 on rack 3" >> "placedway/update_log.txt"
# Log update for D_19_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_6 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_8 femu@node03:/mnt/nvme3/D_20_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_6 femu@node04:/mnt/nvme1/D_19_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 20/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 20/200 (2 blocks)...'

# Log update for D_13_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_17_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_12 femu@node06:/mnt/nvme2/D_13_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_15 femu@node08:/mnt/nvme0/D_17_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 21/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 21/200 (2 blocks)...'

# Log update for D_1_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_3 on rack 2" >> "placedway/update_log.txt"
# Log update for D_6_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_3 femu@node02:/mnt/nvme3/D_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_19 femu@node07:/mnt/nvme4/D_6_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 22/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 22/200 (2 blocks)...'

# Log update for D_15_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_18_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_18 femu@node08:/mnt/nvme3/D_15_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_18 femu@node07:/mnt/nvme3/D_18_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 23/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 23/200 (2 blocks)...'

# Log update for D_6_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_11_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_6 femu@node03:/mnt/nvme1/D_6_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_5 femu@node04:/mnt/nvme0/D_11_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 24/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 24/200 (2 blocks)...'

# Log update for D_17_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_3_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_9 femu@node04:/mnt/nvme4/D_17_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_15 femu@node08:/mnt/nvme0/D_3_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 25/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 25/200 (2 blocks)...'

# Log update for D_15_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_3 on rack 2" >> "placedway/update_log.txt"
# Log update for D_15_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_3 femu@node02:/mnt/nvme3/D_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_15 femu@node08:/mnt/nvme0/D_15_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 26/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 26/200 (2 blocks)...'

# Log update for D_10_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_7_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_8 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_7 femu@node03:/mnt/nvme2/D_10_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_8 femu@node04:/mnt/nvme3/D_7_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 27/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 27/200 (2 blocks)...'

# Log update for D_10_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_8 on rack 3" >> "placedway/update_log.txt"
# Log update for D_5_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_8 femu@node03:/mnt/nvme3/D_10_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_13 femu@node06:/mnt/nvme3/D_5_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 28/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 28/200 (2 blocks)...'

# Log update for D_13_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_17_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_3 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_8 femu@node04:/mnt/nvme3/D_13_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_3 femu@node02:/mnt/nvme3/D_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 29/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 29/200 (2 blocks)...'

# Log update for D_1_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_11 on rack 6" >> "placedway/update_log.txt"
# Log update for D_5_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_11 femu@node06:/mnt/nvme1/D_1_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_4 femu@node02:/mnt/nvme4/D_5_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 30/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 30/200 (2 blocks)...'

# Log update for D_5_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_6_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_6 femu@node04:/mnt/nvme1/D_5_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_1 femu@node02:/mnt/nvme1/D_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 31/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 31/200 (2 blocks)...'

# Log update for D_19_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_11 on rack 6" >> "placedway/update_log.txt"
# Log update for D_12_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_11 femu@node06:/mnt/nvme1/D_19_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_5 femu@node03:/mnt/nvme0/D_12_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 32/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 32/200 (2 blocks)...'

# Log update for D_13_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_2 on rack 1" >> "placedway/update_log.txt"
# Log update for D_14_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_2 femu@node01:/mnt/nvme2/D_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_19 femu@node07:/mnt/nvme4/D_14_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 33/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 33/200 (2 blocks)...'

# Log update for D_15_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_14 on rack 6" >> "placedway/update_log.txt"
# Log update for D_14_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_14 femu@node06:/mnt/nvme4/D_15_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_1 femu@node02:/mnt/nvme1/D_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 34/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 34/200 (2 blocks)...'

# Log update for D_7_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_3 on rack 2" >> "placedway/update_log.txt"
# Log update for D_3_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_3 femu@node02:/mnt/nvme3/D_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_7 femu@node04:/mnt/nvme2/D_3_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 35/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 35/200 (2 blocks)...'

# Log update for D_8_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_6_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_4 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_0 femu@node02:/mnt/nvme0/D_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_4 femu@node01:/mnt/nvme4/D_6_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 36/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 36/200 (2 blocks)...'

# Log update for D_8_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_18_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_6 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_17 femu@node07:/mnt/nvme2/D_8_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_6 femu@node03:/mnt/nvme1/D_18_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 37/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 37/200 (2 blocks)...'

# Log update for D_1_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_16_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_0 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_6 femu@node04:/mnt/nvme1/D_1_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_0 femu@node02:/mnt/nvme0/D_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 38/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 38/200 (2 blocks)...'

# Log update for D_3_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_2 on rack 1" >> "placedway/update_log.txt"
# Log update for D_16_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_2 femu@node01:/mnt/nvme2/D_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_11 femu@node05:/mnt/nvme1/D_16_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 39/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 39/200 (2 blocks)...'

# Log update for D_15_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_4_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_12 femu@node06:/mnt/nvme2/D_15_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_3 femu@node01:/mnt/nvme3/D_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 40/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 40/200 (2 blocks)...'

# Log update for D_14_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_5_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_12 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_2 femu@node02:/mnt/nvme2/D_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_12 femu@node06:/mnt/nvme2/D_5_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 41/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 41/200 (2 blocks)...'

# Log update for D_17_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_4 on rack 2" >> "placedway/update_log.txt"
# Log update for D_16_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_10 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_4 femu@node02:/mnt/nvme4/D_17_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_10 femu@node05:/mnt/nvme0/D_16_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 42/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 42/200 (2 blocks)...'

# Log update for D_6_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_11 on rack 5" >> "placedway/update_log.txt"
# Log update for D_11_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_11 femu@node05:/mnt/nvme1/D_6_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_2 femu@node01:/mnt/nvme2/D_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 43/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 43/200 (2 blocks)...'

# Log update for D_8_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_1_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_17 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_9 femu@node03:/mnt/nvme4/D_8_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_17 femu@node08:/mnt/nvme2/D_1_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 44/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 44/200 (2 blocks)...'

# Log update for D_5_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_1 on rack 1" >> "placedway/update_log.txt"
# Log update for D_4_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_8 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_1 femu@node01:/mnt/nvme1/D_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_8 femu@node03:/mnt/nvme3/D_4_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 45/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 45/200 (2 blocks)...'

# Log update for D_10_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_13 on rack 5" >> "placedway/update_log.txt"
# Log update for D_20_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_17 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_13 femu@node05:/mnt/nvme3/D_10_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_17 femu@node07:/mnt/nvme2/D_20_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 46/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 46/200 (2 blocks)...'

# Log update for D_11_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_12_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_6 femu@node04:/mnt/nvme1/D_11_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_11 femu@node05:/mnt/nvme1/D_12_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 47/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 47/200 (2 blocks)...'

# Log update for D_6_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_5_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_9 femu@node03:/mnt/nvme4/D_6_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_15 femu@node08:/mnt/nvme0/D_5_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 48/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 48/200 (2 blocks)...'

# Log update for D_13_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_15 on rack 8" >> "placedway/update_log.txt"
# Log update for D_19_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_15 femu@node08:/mnt/nvme0/D_13_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_13 femu@node06:/mnt/nvme3/D_19_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 49/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 49/200 (2 blocks)...'

# Log update for D_19_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_1_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_17 femu@node08:/mnt/nvme2/D_19_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_15 femu@node08:/mnt/nvme0/D_1_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 50/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 50/200 (2 blocks)...'

# Log update for D_5_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_10_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_18 femu@node08:/mnt/nvme3/D_5_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_5 femu@node03:/mnt/nvme0/D_10_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 51/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 51/200 (2 blocks)...'

# Log update for D_4_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_17_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_15 femu@node07:/mnt/nvme0/D_4_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_7 femu@node04:/mnt/nvme2/D_17_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 52/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 52/200 (2 blocks)...'

# Log update for D_19_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_3 on rack 2" >> "placedway/update_log.txt"
# Log update for D_17_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_14 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_3 femu@node02:/mnt/nvme3/D_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_14 femu@node06:/mnt/nvme4/D_17_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 53/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 53/200 (2 blocks)...'

# Log update for D_18_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_4 on rack 1" >> "placedway/update_log.txt"
# Log update for D_16_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_4 femu@node01:/mnt/nvme4/D_18_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_13 femu@node05:/mnt/nvme3/D_16_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 54/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 54/200 (2 blocks)...'

# Log update for D_11_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_13 on rack 6" >> "placedway/update_log.txt"
# Log update for D_14_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_10 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_13 femu@node06:/mnt/nvme3/D_11_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_10 femu@node05:/mnt/nvme0/D_14_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 55/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 55/200 (2 blocks)...'

# Log update for D_13_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_16 on rack 8" >> "placedway/update_log.txt"
# Log update for D_18_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_16 femu@node08:/mnt/nvme1/D_13_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_13 femu@node05:/mnt/nvme3/D_18_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 56/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 56/200 (2 blocks)...'

# Log update for D_13_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_19 on rack 8" >> "placedway/update_log.txt"
# Log update for D_17_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_19 femu@node08:/mnt/nvme4/D_13_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_0 femu@node01:/mnt/nvme0/D_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 57/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 57/200 (2 blocks)...'

# Log update for D_12_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_16 on rack 7" >> "placedway/update_log.txt"
# Log update for D_2_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_16 femu@node07:/mnt/nvme1/D_12_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_11 femu@node05:/mnt/nvme1/D_2_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 58/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 58/200 (2 blocks)...'

# Log update for D_5_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_13_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_17 femu@node08:/mnt/nvme2/D_5_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_7 femu@node04:/mnt/nvme2/D_13_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 59/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 59/200 (2 blocks)...'

# Log update for D_4_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_10 on rack 5" >> "placedway/update_log.txt"
# Log update for D_8_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_15 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_10 femu@node05:/mnt/nvme0/D_4_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_15 femu@node07:/mnt/nvme0/D_8_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 60/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 60/200 (2 blocks)...'

# Log update for D_3_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_20_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_18 femu@node08:/mnt/nvme3/D_3_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_3 femu@node01:/mnt/nvme3/D_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 61/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 61/200 (2 blocks)...'

# Log update for D_11_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_9_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_9 femu@node04:/mnt/nvme4/D_11_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_7 femu@node04:/mnt/nvme2/D_9_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 62/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 62/200 (2 blocks)...'

# Log update for D_18_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_3_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_9 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_17 femu@node07:/mnt/nvme2/D_18_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_9 femu@node04:/mnt/nvme4/D_3_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 63/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 63/200 (2 blocks)...'

# Log update for D_4_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_10_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_9 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_17 femu@node07:/mnt/nvme2/D_4_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_9 femu@node03:/mnt/nvme4/D_10_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 64/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 64/200 (2 blocks)...'

# Log update for D_15_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_5_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_14 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_10 femu@node06:/mnt/nvme0/D_15_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_14 femu@node06:/mnt/nvme4/D_5_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 65/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 65/200 (2 blocks)...'

# Log update for D_3_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_3_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_14 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_12 femu@node06:/mnt/nvme2/D_3_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_14 femu@node06:/mnt/nvme4/D_3_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 66/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 66/200 (2 blocks)...'

# Log update for D_6_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_13 on rack 5" >> "placedway/update_log.txt"
# Log update for D_15_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_13 femu@node05:/mnt/nvme3/D_6_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_1 femu@node01:/mnt/nvme1/D_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 67/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 67/200 (2 blocks)...'

# Log update for D_9_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_0 on rack 1" >> "placedway/update_log.txt"
# Log update for D_8_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_0 femu@node01:/mnt/nvme0/D_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_5 femu@node03:/mnt/nvme0/D_8_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 68/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 68/200 (2 blocks)...'

# Log update for D_11_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_4 on rack 2" >> "placedway/update_log.txt"
# Log update for D_12_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_2 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_4 femu@node02:/mnt/nvme4/D_11_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_2 femu@node02:/mnt/nvme2/D_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 69/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 69/200 (2 blocks)...'

# Log update for D_13_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_1_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_17 femu@node08:/mnt/nvme2/D_13_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_7 femu@node04:/mnt/nvme2/D_1_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 70/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 70/200 (2 blocks)...'

# Log update for D_13_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_13 on rack 6" >> "placedway/update_log.txt"
# Log update for D_15_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_13 femu@node06:/mnt/nvme3/D_13_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_7 femu@node04:/mnt/nvme2/D_15_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 71/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 71/200 (2 blocks)...'

# Log update for D_15_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_2_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_8 femu@node04:/mnt/nvme3/D_15_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_19 femu@node07:/mnt/nvme4/D_2_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 72/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 72/200 (2 blocks)...'

# Log update for D_19_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_11_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_8 femu@node04:/mnt/nvme3/D_19_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_15 femu@node08:/mnt/nvme0/D_11_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 73/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 73/200 (2 blocks)...'

# Log update for D_17_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_1 on rack 1" >> "placedway/update_log.txt"
# Log update for D_7_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_1 femu@node01:/mnt/nvme1/D_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_2 femu@node01:/mnt/nvme2/D_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 74/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 74/200 (2 blocks)...'

# Log update for D_19_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_4_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_4 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_12 femu@node06:/mnt/nvme2/D_19_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_4 femu@node01:/mnt/nvme4/D_4_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 75/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 75/200 (2 blocks)...'

# Log update for D_4_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_18 on rack 7" >> "placedway/update_log.txt"
# Log update for D_16_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_16 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_18 femu@node07:/mnt/nvme3/D_4_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_16 femu@node07:/mnt/nvme1/D_16_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 76/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 76/200 (2 blocks)...'

# Log update for D_16_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_5 on rack 3" >> "placedway/update_log.txt"
# Log update for D_11_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_14 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_5 femu@node03:/mnt/nvme0/D_16_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_14 femu@node06:/mnt/nvme4/D_11_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 77/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 77/200 (2 blocks)...'

# Log update for D_4_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_13 on rack 5" >> "placedway/update_log.txt"
# Log update for D_18_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_10 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_13 femu@node05:/mnt/nvme3/D_4_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_10 femu@node05:/mnt/nvme0/D_18_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 78/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 78/200 (2 blocks)...'

# Log update for D_12_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_4 on rack 1" >> "placedway/update_log.txt"
# Log update for D_13_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_4 femu@node01:/mnt/nvme4/D_12_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_4 femu@node02:/mnt/nvme4/D_13_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 79/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 79/200 (2 blocks)...'

# Log update for D_17_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_14_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_10 femu@node06:/mnt/nvme0/D_17_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_18 femu@node07:/mnt/nvme3/D_14_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 80/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 80/200 (2 blocks)...'

# Log update for D_7_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_20_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_7 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_10 femu@node06:/mnt/nvme0/D_7_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_7 femu@node03:/mnt/nvme2/D_20_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 81/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 81/200 (2 blocks)...'

# Log update for D_3_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_11 on rack 6" >> "placedway/update_log.txt"
# Log update for D_14_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_11 femu@node06:/mnt/nvme1/D_3_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_11 femu@node05:/mnt/nvme1/D_14_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 82/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 82/200 (2 blocks)...'

# Log update for D_11_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_19 on rack 8" >> "placedway/update_log.txt"
# Log update for D_15_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_16 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_19 femu@node08:/mnt/nvme4/D_11_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_16 femu@node08:/mnt/nvme1/D_15_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 83/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 83/200 (2 blocks)...'

# Log update for D_13_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_20_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_9 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_9 femu@node04:/mnt/nvme4/D_13_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_9 femu@node03:/mnt/nvme4/D_20_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 84/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 84/200 (2 blocks)...'

# Log update for D_9_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_15 on rack 8" >> "placedway/update_log.txt"
# Log update for D_10_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_15 femu@node08:/mnt/nvme0/D_9_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_19 femu@node07:/mnt/nvme4/D_10_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 85/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 85/200 (2 blocks)...'

# Log update for D_16_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_3_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_17 femu@node07:/mnt/nvme2/D_16_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_13 femu@node06:/mnt/nvme3/D_3_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 86/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 86/200 (2 blocks)...'

# Log update for D_3_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_19 on rack 8" >> "placedway/update_log.txt"
# Log update for D_17_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_19 femu@node08:/mnt/nvme4/D_3_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_5 femu@node04:/mnt/nvme0/D_17_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 87/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 87/200 (2 blocks)...'

# Log update for D_20_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_11 on rack 5" >> "placedway/update_log.txt"
# Log update for D_16_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_8 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_11 femu@node05:/mnt/nvme1/D_20_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_8 femu@node03:/mnt/nvme3/D_16_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 88/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 88/200 (2 blocks)...'

# Log update for D_18_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_20_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_10 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_12 femu@node05:/mnt/nvme2/D_18_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_10 femu@node05:/mnt/nvme0/D_20_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 89/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 89/200 (2 blocks)...'

# Log update for D_10_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_10 on rack 5" >> "placedway/update_log.txt"
# Log update for D_13_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_11 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_10 femu@node05:/mnt/nvme0/D_10_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_11 femu@node06:/mnt/nvme1/D_13_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 90/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 90/200 (2 blocks)...'

# Log update for D_16_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_4_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_7 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_6 femu@node03:/mnt/nvme1/D_16_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_7 femu@node03:/mnt/nvme2/D_4_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 91/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 91/200 (2 blocks)...'

# Log update for D_15_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_2 on rack 1" >> "placedway/update_log.txt"
# Log update for D_11_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_17 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_2 femu@node01:/mnt/nvme2/D_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_17 femu@node08:/mnt/nvme2/D_11_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 92/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 92/200 (2 blocks)...'

# Log update for D_15_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_13_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_10 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_17 femu@node08:/mnt/nvme2/D_15_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_10 femu@node06:/mnt/nvme0/D_13_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 93/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 93/200 (2 blocks)...'

# Log update for D_2_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_15_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_6 femu@node03:/mnt/nvme1/D_2_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_0 femu@node01:/mnt/nvme0/D_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 94/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 94/200 (2 blocks)...'

# Log update for D_1_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_4 on rack 2" >> "placedway/update_log.txt"
# Log update for D_16_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_14 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_4 femu@node02:/mnt/nvme4/D_1_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_14 femu@node05:/mnt/nvme4/D_16_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 95/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 95/200 (2 blocks)...'

# Log update for D_11_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_8_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_8 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_12 femu@node06:/mnt/nvme2/D_11_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_8 femu@node03:/mnt/nvme3/D_8_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 96/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 96/200 (2 blocks)...'

# Log update for D_1_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_1_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_9 femu@node04:/mnt/nvme4/D_1_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_13 femu@node06:/mnt/nvme3/D_1_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 97/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 97/200 (2 blocks)...'

# Log update for D_14_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_7_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_15 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_0 femu@node02:/mnt/nvme0/D_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_15 femu@node08:/mnt/nvme0/D_7_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 98/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 98/200 (2 blocks)...'

# Log update for D_15_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_12_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_9 femu@node04:/mnt/nvme4/D_15_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_1 femu@node02:/mnt/nvme1/D_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 99/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 99/200 (2 blocks)...'

# Log update for D_11_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_3 on rack 2" >> "placedway/update_log.txt"
# Log update for D_1_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_19 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_3 femu@node02:/mnt/nvme3/D_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_19 femu@node08:/mnt/nvme4/D_1_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 100/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 100/200 (2 blocks)...'

# Log update for D_16_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_7_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_15 femu@node07:/mnt/nvme0/D_16_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_13 femu@node06:/mnt/nvme3/D_7_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 101/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 101/200 (2 blocks)...'

# Log update for D_7_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_5_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_12 femu@node06:/mnt/nvme2/D_7_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_7 femu@node04:/mnt/nvme2/D_5_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 102/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 102/200 (2 blocks)...'

# Log update for D_7_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_7 on rack 4" >> "placedway/update_log.txt"
# Log update for D_1_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_7 femu@node04:/mnt/nvme2/D_7_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_5 femu@node04:/mnt/nvme0/D_1_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 103/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 103/200 (2 blocks)...'

# Log update for D_2_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_10 on rack 5" >> "placedway/update_log.txt"
# Log update for D_9_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_8 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_10 femu@node05:/mnt/nvme0/D_2_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_8 femu@node04:/mnt/nvme3/D_9_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 104/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 104/200 (2 blocks)...'

# Log update for D_20_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_11_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_10 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_0 femu@node02:/mnt/nvme0/D_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_10 femu@node06:/mnt/nvme0/D_11_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 105/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 105/200 (2 blocks)...'

# Log update for D_13_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_3_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_3 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_18 femu@node08:/mnt/nvme3/D_13_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_3 femu@node02:/mnt/nvme3/D_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 106/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 106/200 (2 blocks)...'

# Log update for D_1_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_12_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_10 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_8 femu@node04:/mnt/nvme3/D_1_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_10 femu@node05:/mnt/nvme0/D_12_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 107/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 107/200 (2 blocks)...'

# Log update for D_17_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_6_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_15 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_6 femu@node04:/mnt/nvme1/D_17_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_15 femu@node07:/mnt/nvme0/D_6_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 108/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 108/200 (2 blocks)...'

# Log update for D_12_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_5_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_9 femu@node03:/mnt/nvme4/D_12_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_0 femu@node01:/mnt/nvme0/D_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 109/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 109/200 (2 blocks)...'

# Log update for D_2_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_4 on rack 1" >> "placedway/update_log.txt"
# Log update for D_8_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_4 femu@node01:/mnt/nvme4/D_2_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_18 femu@node07:/mnt/nvme3/D_8_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 110/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 110/200 (2 blocks)...'

# Log update for D_19_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_14 on rack 6" >> "placedway/update_log.txt"
# Log update for D_3_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_14 femu@node06:/mnt/nvme4/D_19_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_1 femu@node01:/mnt/nvme1/D_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 111/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 111/200 (2 blocks)...'

# Log update for D_16_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_17_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_11 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_12 femu@node05:/mnt/nvme2/D_16_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_11 femu@node06:/mnt/nvme1/D_17_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 112/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 112/200 (2 blocks)...'

# Log update for D_17_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_16 on rack 8" >> "placedway/update_log.txt"
# Log update for D_5_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_9 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_16 femu@node08:/mnt/nvme1/D_17_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_9 femu@node04:/mnt/nvme4/D_5_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 113/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 113/200 (2 blocks)...'

# Log update for D_15_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_13 on rack 6" >> "placedway/update_log.txt"
# Log update for D_8_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_16 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_13 femu@node06:/mnt/nvme3/D_15_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_16 femu@node07:/mnt/nvme1/D_8_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 114/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 114/200 (2 blocks)...'

# Log update for D_16_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_3 on rack 1" >> "placedway/update_log.txt"
# Log update for D_6_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_3 femu@node01:/mnt/nvme3/D_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_5 femu@node03:/mnt/nvme0/D_6_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 115/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 115/200 (2 blocks)...'

# Log update for D_16_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_7_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_9 femu@node03:/mnt/nvme4/D_16_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_5 femu@node04:/mnt/nvme0/D_7_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 116/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 116/200 (2 blocks)...'

# Log update for D_18_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_9 on rack 3" >> "placedway/update_log.txt"
# Log update for D_20_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_9 femu@node03:/mnt/nvme4/D_18_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_1 femu@node02:/mnt/nvme1/D_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 117/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 117/200 (2 blocks)...'

# Log update for D_10_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_16 on rack 7" >> "placedway/update_log.txt"
# Log update for D_9_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_17 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_16 femu@node07:/mnt/nvme1/D_10_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_17 femu@node08:/mnt/nvme2/D_9_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 118/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 118/200 (2 blocks)...'

# Log update for D_17_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_20_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_18 femu@node08:/mnt/nvme3/D_17_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_18 femu@node07:/mnt/nvme3/D_20_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 119/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 119/200 (2 blocks)...'

# Log update for D_4_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_1 on rack 2" >> "placedway/update_log.txt"
# Log update for D_5_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_1 femu@node02:/mnt/nvme1/D_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_2 femu@node01:/mnt/nvme2/D_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 120/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 120/200 (2 blocks)...'

# Log update for D_19_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_9_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_12 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_10 femu@node06:/mnt/nvme0/D_19_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_12 femu@node06:/mnt/nvme2/D_9_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 121/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 121/200 (2 blocks)...'

# Log update for D_12_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_20_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_12 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_12 femu@node05:/mnt/nvme2/D_12_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_12 femu@node05:/mnt/nvme2/D_20_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 122/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 122/200 (2 blocks)...'

# Log update for D_5_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_5 on rack 4" >> "placedway/update_log.txt"
# Log update for D_20_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_4 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_5 femu@node04:/mnt/nvme0/D_5_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_4 femu@node01:/mnt/nvme4/D_20_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 123/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 123/200 (2 blocks)...'

# Log update for D_7_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_1 on rack 1" >> "placedway/update_log.txt"
# Log update for D_17_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_19 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_1 femu@node01:/mnt/nvme1/D_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_19 femu@node08:/mnt/nvme4/D_17_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 124/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 124/200 (2 blocks)...'

# Log update for D_1_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_1 on rack 1" >> "placedway/update_log.txt"
# Log update for D_18_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_1 femu@node01:/mnt/nvme1/D_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_11 femu@node05:/mnt/nvme1/D_18_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 125/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 125/200 (2 blocks)...'

# Log update for D_4_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_11 on rack 5" >> "placedway/update_log.txt"
# Log update for D_7_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_9 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_11 femu@node05:/mnt/nvme1/D_4_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_9 femu@node04:/mnt/nvme4/D_7_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 126/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 126/200 (2 blocks)...'

# Log update for D_10_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_18_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_2 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_14 femu@node05:/mnt/nvme4/D_10_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_2 femu@node02:/mnt/nvme2/D_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 127/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 127/200 (2 blocks)...'

# Log update for D_6_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_8 on rack 3" >> "placedway/update_log.txt"
# Log update for D_15_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_8 femu@node03:/mnt/nvme3/D_6_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_4 femu@node02:/mnt/nvme4/D_15_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 128/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 128/200 (2 blocks)...'

# Log update for D_18_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_8 on rack 3" >> "placedway/update_log.txt"
# Log update for D_10_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_11 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_8 femu@node03:/mnt/nvme3/D_18_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_11 femu@node05:/mnt/nvme1/D_10_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 129/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 129/200 (2 blocks)...'

# Log update for D_10_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_1 on rack 2" >> "placedway/update_log.txt"
# Log update for D_15_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_11 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_1 femu@node02:/mnt/nvme1/D_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_11 femu@node06:/mnt/nvme1/D_15_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 130/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 130/200 (2 blocks)...'

# Log update for D_12_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_3 on rack 1" >> "placedway/update_log.txt"
# Log update for D_20_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_16 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_3 femu@node01:/mnt/nvme3/D_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_16 femu@node07:/mnt/nvme1/D_20_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 131/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 131/200 (2 blocks)...'

# Log update for D_6_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_15_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_0 femu@node02:/mnt/nvme0/D_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_5 femu@node04:/mnt/nvme0/D_15_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1'

# Short pause between batches
sleep 0.5

# Batch 132/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 132/200 (2 blocks)...'

# Log update for D_7_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_4_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_18 femu@node08:/mnt/nvme3/D_7_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_5 femu@node03:/mnt/nvme0/D_4_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 133/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 133/200 (2 blocks)...'

# Log update for D_12_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_10_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_17 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_0 femu@node02:/mnt/nvme0/D_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_17 femu@node07:/mnt/nvme2/D_10_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 134/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 134/200 (2 blocks)...'

# Log update for D_14_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_5 on rack 3" >> "placedway/update_log.txt"
# Log update for D_9_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_5 femu@node03:/mnt/nvme0/D_14_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_4 femu@node02:/mnt/nvme4/D_9_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 135/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 135/200 (2 blocks)...'

# Log update for D_5_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_5_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_19 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_8 femu@node04:/mnt/nvme3/D_5_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_19 femu@node08:/mnt/nvme4/D_5_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 136/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 136/200 (2 blocks)...'

# Log update for D_18_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_2_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_7 femu@node03:/mnt/nvme2/D_18_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_5 femu@node03:/mnt/nvme0/D_2_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 137/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 137/200 (2 blocks)...'

# Log update for D_8_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_13_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_12 femu@node05:/mnt/nvme2/D_8_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_1 femu@node01:/mnt/nvme1/D_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 138/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 138/200 (2 blocks)...'

# Log update for D_16_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_19 on rack 7" >> "placedway/update_log.txt"
# Log update for D_13_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_19 femu@node07:/mnt/nvme4/D_16_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_5 femu@node04:/mnt/nvme0/D_13_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 139/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 139/200 (2 blocks)...'

# Log update for D_14_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_6_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_7 femu@node03:/mnt/nvme2/D_14_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_18 femu@node07:/mnt/nvme3/D_6_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 140/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 140/200 (2 blocks)...'

# Log update for D_8_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_19_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_14 femu@node05:/mnt/nvme4/D_8_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_1 femu@node01:/mnt/nvme1/D_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 141/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 141/200 (2 blocks)...'

# Log update for D_8_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_11 on rack 5" >> "placedway/update_log.txt"
# Log update for D_7_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_6 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_11 femu@node05:/mnt/nvme1/D_8_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_6 femu@node04:/mnt/nvme1/D_7_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 142/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 142/200 (2 blocks)...'

# Log update for D_12_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_17_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_12 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_17 femu@node07:/mnt/nvme2/D_12_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_12 femu@node06:/mnt/nvme2/D_17_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 143/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 143/200 (2 blocks)...'

# Log update for D_17_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_7_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_11 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_17 femu@node08:/mnt/nvme2/D_17_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_11 femu@node06:/mnt/nvme1/D_7_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 144/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 144/200 (2 blocks)...'

# Log update for D_12_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_11_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_18 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_14 femu@node05:/mnt/nvme4/D_12_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_18 femu@node08:/mnt/nvme3/D_11_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 145/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 145/200 (2 blocks)...'

# Log update for D_19_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_16 on rack 8" >> "placedway/update_log.txt"
# Log update for D_3_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_16 femu@node08:/mnt/nvme1/D_19_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_5 femu@node04:/mnt/nvme0/D_3_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 146/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 146/200 (2 blocks)...'

# Log update for D_12_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_12_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_8 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_15 femu@node07:/mnt/nvme0/D_12_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_8 femu@node03:/mnt/nvme3/D_12_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 147/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 147/200 (2 blocks)...'

# Log update for D_10_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_14_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_6 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_2 femu@node02:/mnt/nvme2/D_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_6 femu@node03:/mnt/nvme1/D_14_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 148/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 148/200 (2 blocks)...'

# Log update for D_8_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_18_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_0 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_6 femu@node03:/mnt/nvme1/D_8_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_0 femu@node02:/mnt/nvme0/D_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 149/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 149/200 (2 blocks)...'

# Log update for D_14_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_5_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_11 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_15 femu@node07:/mnt/nvme0/D_14_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_5_11 femu@node06:/mnt/nvme1/D_5_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node02:/mnt/nvme2/G_5_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node03:/mnt/nvme0/G_5_1'

# Short pause between batches
sleep 0.5

# Batch 150/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 150/200 (2 blocks)...'

# Log update for D_4_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_1_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_14 femu@node05:/mnt/nvme4/D_4_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_2 femu@node01:/mnt/nvme2/D_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 151/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 151/200 (2 blocks)...'

# Log update for D_6_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_3 on rack 1" >> "placedway/update_log.txt"
# Log update for D_9_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_5 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_3 femu@node01:/mnt/nvme3/D_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_5 femu@node04:/mnt/nvme0/D_9_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 152/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 152/200 (2 blocks)...'

# Log update for D_7_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_4 on rack 2" >> "placedway/update_log.txt"
# Log update for D_11_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_4 femu@node02:/mnt/nvme4/D_7_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_1 femu@node01:/mnt/nvme1/D_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 153/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 153/200 (2 blocks)...'

# Log update for D_9_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_11 on rack 6" >> "placedway/update_log.txt"
# Log update for D_2_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_11 femu@node06:/mnt/nvme1/D_9_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_1 femu@node02:/mnt/nvme1/D_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 154/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 154/200 (2 blocks)...'

# Log update for D_15_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_19 on rack 8" >> "placedway/update_log.txt"
# Log update for D_6_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_16 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_19 femu@node08:/mnt/nvme4/D_15_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_16 femu@node07:/mnt/nvme1/D_6_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1'

# Short pause between batches
sleep 0.5

# Batch 155/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 155/200 (2 blocks)...'

# Log update for D_3_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_0 on rack 1" >> "placedway/update_log.txt"
# Log update for D_18_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_0 femu@node01:/mnt/nvme0/D_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_1 femu@node02:/mnt/nvme1/D_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 156/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 156/200 (2 blocks)...'

# Log update for D_17_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_2 on rack 1" >> "placedway/update_log.txt"
# Log update for D_12_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_2 femu@node01:/mnt/nvme2/D_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_13 femu@node05:/mnt/nvme3/D_12_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 157/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 157/200 (2 blocks)...'

# Log update for D_17_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_13 on rack 6" >> "placedway/update_log.txt"
# Log update for D_8_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_13 femu@node06:/mnt/nvme3/D_17_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_3 femu@node01:/mnt/nvme3/D_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 158/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 158/200 (2 blocks)...'

# Log update for D_6_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_1_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_16 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_2 femu@node02:/mnt/nvme2/D_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_16 femu@node08:/mnt/nvme1/D_1_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 159/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 159/200 (2 blocks)...'

# Log update for D_19_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_9 on rack 4" >> "placedway/update_log.txt"
# Log update for D_20_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_14 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_9 femu@node04:/mnt/nvme4/D_19_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_14 femu@node05:/mnt/nvme4/D_20_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 160/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 160/200 (2 blocks)...'

# Log update for D_2_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_3_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_6 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_0 femu@node02:/mnt/nvme0/D_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_6 femu@node04:/mnt/nvme1/D_3_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 161/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 161/200 (2 blocks)...'

# Log update for D_19_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_15 on rack 8" >> "placedway/update_log.txt"
# Log update for D_14_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_15 femu@node08:/mnt/nvme0/D_19_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_3 femu@node01:/mnt/nvme3/D_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 162/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 162/200 (2 blocks)...'

# Log update for D_14_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_4 on rack 1" >> "placedway/update_log.txt"
# Log update for D_2_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_8 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_4 femu@node01:/mnt/nvme4/D_14_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_8 femu@node03:/mnt/nvme3/D_2_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 163/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 163/200 (2 blocks)...'

# Log update for D_14_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_9_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_18 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_12 femu@node05:/mnt/nvme2/D_14_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_18 femu@node08:/mnt/nvme3/D_9_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 164/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 164/200 (2 blocks)...'

# Log update for D_1_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_12 on rack 6" >> "placedway/update_log.txt"
# Log update for D_2_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_7 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_12 femu@node06:/mnt/nvme2/D_1_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_7 femu@node03:/mnt/nvme2/D_2_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 165/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 165/200 (2 blocks)...'

# Log update for D_16_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_18 on rack 7" >> "placedway/update_log.txt"
# Log update for D_9_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_16 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_18 femu@node07:/mnt/nvme3/D_16_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_16 femu@node08:/mnt/nvme1/D_9_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 166/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 166/200 (2 blocks)...'

# Log update for D_1_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_9_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_3 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_18 femu@node08:/mnt/nvme3/D_1_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_3 femu@node02:/mnt/nvme3/D_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 167/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 167/200 (2 blocks)...'

# Log update for D_6_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_10 on rack 5" >> "placedway/update_log.txt"
# Log update for D_4_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_10 femu@node05:/mnt/nvme0/D_6_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_19 femu@node07:/mnt/nvme4/D_4_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 168/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 168/200 (2 blocks)...'

# Log update for D_4_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_16 on rack 7" >> "placedway/update_log.txt"
# Log update for D_1_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_10 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_16 femu@node07:/mnt/nvme1/D_4_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_10 femu@node06:/mnt/nvme0/D_1_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1'

# Short pause between batches
sleep 0.5

# Batch 169/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 169/200 (2 blocks)...'

# Log update for D_18_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_9_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_2 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_14 femu@node05:/mnt/nvme4/D_18_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_2 femu@node01:/mnt/nvme2/D_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 170/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 170/200 (2 blocks)...'

# Log update for D_9_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_2_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_15 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_10 femu@node06:/mnt/nvme0/D_9_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_15 femu@node07:/mnt/nvme0/D_2_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 171/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 171/200 (2 blocks)...'

# Log update for D_18_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_16_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_15 femu@node07:/mnt/nvme0/D_18_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_1 femu@node02:/mnt/nvme1/D_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 172/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 172/200 (2 blocks)...'

# Log update for D_14_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_8 on rack 3" >> "placedway/update_log.txt"
# Log update for D_9_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_1 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_8 femu@node03:/mnt/nvme3/D_14_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_1 femu@node01:/mnt/nvme1/D_9_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 173/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 173/200 (2 blocks)...'

# Log update for D_17_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_8 on rack 4" >> "placedway/update_log.txt"
# Log update for D_2_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_17_8 femu@node04:/mnt/nvme3/D_17_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme1/G_17_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node07:/mnt/nvme2/G_17_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_3 femu@node01:/mnt/nvme3/D_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 174/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 174/200 (2 blocks)...'

# Log update for D_6_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_6_17 on rack 7" >> "placedway/update_log.txt"
# Log update for D_9_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_19 on rack 8" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_6_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_6_17 femu@node07:/mnt/nvme2/D_6_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_6_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node02:/mnt/nvme4/G_6_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_6_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node04:/mnt/nvme0/G_6_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_19 femu@node08:/mnt/nvme4/D_9_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 175/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 175/200 (2 blocks)...'

# Log update for D_14_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_14 on rack 5" >> "placedway/update_log.txt"
# Log update for D_4_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_0 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_14 femu@node05:/mnt/nvme4/D_14_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_0 femu@node02:/mnt/nvme0/D_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 176/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 176/200 (2 blocks)...'

# Log update for D_3_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_19_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_7 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_17 femu@node08:/mnt/nvme2/D_3_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_7 femu@node04:/mnt/nvme2/D_19_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 177/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 177/200 (2 blocks)...'

# Log update for D_4_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_6 on rack 3" >> "placedway/update_log.txt"
# Log update for D_20_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_2 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_6 femu@node03:/mnt/nvme1/D_4_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_2 femu@node02:/mnt/nvme2/D_20_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 178/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 178/200 (2 blocks)...'

# Log update for D_19_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_5 on rack 4" >> "placedway/update_log.txt"
# Log update for D_2_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_5 femu@node04:/mnt/nvme0/D_19_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_13 femu@node05:/mnt/nvme3/D_2_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 179/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 179/200 (2 blocks)...'

# Log update for D_10_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_15 on rack 7" >> "placedway/update_log.txt"
# Log update for D_7_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_15 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_15 femu@node07:/mnt/nvme0/D_10_15' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_0 femu@node01:/mnt/nvme0/D_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 180/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 180/200 (2 blocks)...'

# Log update for D_19_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_19 on rack 8" >> "placedway/update_log.txt"
# Log update for D_11_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_8 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_19 femu@node08:/mnt/nvme4/D_19_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_8 femu@node04:/mnt/nvme3/D_11_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 181/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 181/200 (2 blocks)...'

# Log update for D_12_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_20_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_5 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_7 femu@node03:/mnt/nvme2/D_12_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_5 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_5 femu@node03:/mnt/nvme0/D_20_5' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 182/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 182/200 (2 blocks)...'

# Log update for D_15_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_6 on rack 4" >> "placedway/update_log.txt"
# Log update for D_13_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_3 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_6 && scp -C /home/femu/ecwide-ssd/test/chunks/D_15_6 femu@node04:/mnt/nvme1/D_15_6' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node07:/mnt/nvme0/G_15_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_3 femu@node02:/mnt/nvme3/D_13_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 183/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 183/200 (2 blocks)...'

# Log update for D_7_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_17 on rack 8" >> "placedway/update_log.txt"
# Log update for D_3_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_8 on rack 4" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_17 femu@node08:/mnt/nvme2/D_7_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_8 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_8 femu@node04:/mnt/nvme3/D_3_8' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 184/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 184/200 (2 blocks)...'

# Log update for D_14_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_16 on rack 7" >> "placedway/update_log.txt"
# Log update for D_2_17
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_17 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_16 femu@node07:/mnt/nvme1/D_14_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_17 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_17 femu@node07:/mnt/nvme2/D_2_17' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 185/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 185/200 (2 blocks)...'

# Log update for D_11_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_11 on rack 6" >> "placedway/update_log.txt"
# Log update for D_12_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_11 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_11 femu@node06:/mnt/nvme1/D_11_11' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_19 femu@node07:/mnt/nvme4/D_12_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1'

# Short pause between batches
sleep 0.5

# Batch 186/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 186/200 (2 blocks)...'

# Log update for D_2_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_20_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_2_2 femu@node02:/mnt/nvme2/D_2_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node01:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node01:/mnt/nvme1/G_2_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_20_19 femu@node07:/mnt/nvme4/D_20_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme3/G_20_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node08:/mnt/nvme4/G_20_1'

# Short pause between batches
sleep 0.5

# Batch 187/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 187/200 (2 blocks)...'

# Log update for D_19_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_18 on rack 8" >> "placedway/update_log.txt"
# Log update for D_19_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_19_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_18 femu@node08:/mnt/nvme3/D_19_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_19_0 femu@node01:/mnt/nvme0/D_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node07:/mnt/nvme3/G_19_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_19_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1'

# Short pause between batches
sleep 0.5

# Batch 188/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 188/200 (2 blocks)...'

# Log update for D_3_10
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_10 on rack 6" >> "placedway/update_log.txt"
# Log update for D_8_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_19 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_10 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_10 femu@node06:/mnt/nvme0/D_3_10' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_19 femu@node07:/mnt/nvme4/D_8_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 189/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 189/200 (2 blocks)...'

# Log update for D_12_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_18 on rack 7" >> "placedway/update_log.txt"
# Log update for D_3_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_4 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_12_18 femu@node07:/mnt/nvme3/D_12_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node06:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node06:/mnt/nvme1/G_12_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_3_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_3_4 femu@node02:/mnt/nvme4/D_3_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme0/G_3_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_3_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node02:/mnt/nvme1/G_3_1'

# Short pause between batches
sleep 0.5

# Batch 190/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 190/200 (2 blocks)...'

# Log update for D_18_19
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_19 on rack 7" >> "placedway/update_log.txt"
# Log update for D_10_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_3 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_19 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_19 femu@node07:/mnt/nvme4/D_18_19' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_3 femu@node01:/mnt/nvme3/D_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 191/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 191/200 (2 blocks)...'

# Log update for D_16_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_4 on rack 1" >> "placedway/update_log.txt"
# Log update for D_7_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_7_14 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_4 femu@node01:/mnt/nvme4/D_16_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_7_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_7_14 femu@node06:/mnt/nvme4/D_7_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_7_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme1/G_7_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_7_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node03:/mnt/nvme2/G_7_1'

# Short pause between batches
sleep 0.5

# Batch 192/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 192/200 (2 blocks)...'

# Log update for D_13_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_14 on rack 6" >> "placedway/update_log.txt"
# Log update for D_9_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_13 on rack 6" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_14 femu@node06:/mnt/nvme4/D_13_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_9_13 femu@node06:/mnt/nvme3/D_9_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node03:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1'

# Short pause between batches
sleep 0.5

# Batch 193/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 193/200 (2 blocks)...'

# Log update for D_16_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_7 on rack 3" >> "placedway/update_log.txt"
# Log update for D_10_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_4 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_7 femu@node03:/mnt/nvme2/D_16_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_4 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_4 femu@node01:/mnt/nvme4/D_10_4' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 194/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 194/200 (2 blocks)...'

# Log update for D_16_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_2 on rack 2" >> "placedway/update_log.txt"
# Log update for D_14_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_13 on rack 5" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_16_2 femu@node02:/mnt/nvme2/D_16_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node06:/mnt/nvme4/G_16_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node08:/mnt/nvme0/G_16_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_14_13 femu@node05:/mnt/nvme3/D_14_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node06:/mnt/nvme2/G_14_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme3/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 195/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 195/200 (2 blocks)...'

# Log update for D_8_13
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_13 on rack 5" >> "placedway/update_log.txt"
# Log update for D_10_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_18 on rack 7" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_13 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_13 femu@node05:/mnt/nvme3/D_8_13' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_18 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_18 femu@node07:/mnt/nvme3/D_10_18' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1'

# Short pause between batches
sleep 0.5

# Batch 196/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 196/200 (2 blocks)...'

# Log update for D_10_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_0 on rack 2" >> "placedway/update_log.txt"
# Log update for D_13_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_0 on rack 1" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_0 femu@node02:/mnt/nvme0/D_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_13_0 femu@node01:/mnt/nvme0/D_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node05:/mnt/nvme2/G_13_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_13_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node05:/mnt/nvme3/G_13_1'

# Short pause between batches
sleep 0.5

# Batch 197/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 197/200 (2 blocks)...'

# Log update for D_11_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_0 on rack 1" >> "placedway/update_log.txt"
# Log update for D_4_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_9 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/D_11_0 femu@node01:/mnt/nvme0/D_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme0/G_11_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node05:/mnt/nvme1/G_11_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_9 && scp -C /home/femu/ecwide-ssd/test/chunks/D_4_9 femu@node03:/mnt/nvme4/D_4_9' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node01:/mnt/nvme2/G_4_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node02:/mnt/nvme3/G_4_1'

# Short pause between batches
sleep 0.5

# Batch 198/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 198/200 (2 blocks)...'

# Log update for D_10_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_10_12 on rack 5" >> "placedway/update_log.txt"
# Log update for D_8_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_2 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_10_12 && scp -C /home/femu/ecwide-ssd/test/chunks/D_10_12 femu@node05:/mnt/nvme2/D_10_12' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_10_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme3/G_10_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_10_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node04:/mnt/nvme4/G_10_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_2 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_2 femu@node02:/mnt/nvme2/D_8_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 199/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 199/200 (2 blocks)...'

# Log update for D_1_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_14 on rack 6" >> "placedway/update_log.txt"
# Log update for D_8_1
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_1 on rack 2" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_14 && scp -C /home/femu/ecwide-ssd/test/chunks/D_1_14 femu@node06:/mnt/nvme4/D_1_14' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_2 && scp -C /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node01:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_1 femu@node02:/mnt/nvme1/D_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Short pause between batches
sleep 0.5

# Batch 200/200 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 200/200 (2 blocks)...'

# Log update for D_18_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_16 on rack 7" >> "placedway/update_log.txt"
# Log update for D_8_7
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_7 on rack 3" >> "placedway/update_log.txt"

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_16 && scp -C /home/femu/ecwide-ssd/test/chunks/D_18_16 femu@node07:/mnt/nvme1/D_18_16' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3 && scp -C /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node08:/mnt/nvme1/G_18_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node08:/mnt/nvme2/G_18_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_7 && scp -C /home/femu/ecwide-ssd/test/chunks/D_8_7 femu@node03:/mnt/nvme2/D_8_7' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node04:/mnt/nvme1/G_8_0' \
  'dd if=/dev/urandom bs=67108864 count=1 iflag=fullblock status=progress 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1 && scp -C /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node04:/mnt/nvme2/G_8_1'

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 400'
echo 'Rack write impact:'
echo '  R01: 200 writes'
echo '  R02: 200 writes'
echo '  R03: 200 writes'
echo '  R04: 200 writes'
echo '  R05: 200 writes'
echo '  R06: 200 writes'
echo '  R07: 200 writes'
echo '  R08: 200 writes'
echo
echo 'Batch update completed at $(date)'
