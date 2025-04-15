#!/bin/bash

# Batch update script for 5 blocks
# Generated on 2025-04-15 10:09:31

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
echo 'Starting batch update of 5 blocks at $(date)'

# Ensure log file exists
touch "placedway/update_log.txt"

# Batch 1/3 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 1/3 (2 blocks)...'

# Log update for D_9_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_9_4 on rack 2" >> "placedway/update_log.txt"
FILESIZE_D_9_4=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_9_4 2>/dev/null || echo 1048576)
FILESIZE_L_9_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_9_0 2>/dev/null || echo 1048576)
FILESIZE_G_9_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_9_0 2>/dev/null || echo 1048576)
FILESIZE_G_9_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_9_1 2>/dev/null || echo 1048576)
# Log update for D_14_5
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_5 on rack 3" >> "placedway/update_log.txt"
FILESIZE_D_14_5=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_14_5 2>/dev/null || echo 1048576)
FILESIZE_L_14_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_14_1 2>/dev/null || echo 1048576)
FILESIZE_G_14_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_14_0 2>/dev/null || echo 1048576)
FILESIZE_G_14_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_14_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_9_4 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_9_4' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_9_4 femu@node02:/mnt/nvme4/D_9_4' \
  'dd if=/dev/urandom bs=$FILESIZE_L_9_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_9_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_9_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_9_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_9_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_14_5 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_5' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_14_5 femu@node03:/mnt/nvme0/D_14_5' \
  'dd if=/dev/urandom bs=$FILESIZE_L_14_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_14_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1' \
  'dd if=/dev/urandom bs=$FILESIZE_G_14_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_14_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_14_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1'

# Short pause between batches
sleep 0.5

# Batch 2/3 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 2/3 (2 blocks)...'

# Log update for D_11_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_6 on rack 4" >> "placedway/update_log.txt"
FILESIZE_D_11_6=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_11_6 2>/dev/null || echo 1048576)
FILESIZE_L_11_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_11_1 2>/dev/null || echo 1048576)
FILESIZE_G_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_1 2>/dev/null || echo 1048576)
# Log update for D_2_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_2_0 on rack 2" >> "placedway/update_log.txt"
FILESIZE_D_2_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_2_0 2>/dev/null || echo 1048576)
FILESIZE_L_2_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_2_0 2>/dev/null || echo 1048576)
FILESIZE_G_2_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_2_0 2>/dev/null || echo 1048576)
FILESIZE_G_2_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_2_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_11_6 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_6' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_11_6 femu@node04:/mnt/nvme1/D_11_6' \
  'dd if=/dev/urandom bs=$FILESIZE_L_11_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_2_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_2_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_2_0 femu@node02:/mnt/nvme0/D_2_0' \
  'dd if=/dev/urandom bs=$FILESIZE_L_2_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_2_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_2_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_2_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_2_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1'

# Short pause between batches
sleep 0.5

# Batch 3/3 - Processing 1 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/3 (1 blocks)...'

# Log update for D_15_9
echo "$(date +%Y%m%d%H%M%S) - Updated D_15_9 on rack 4" >> "placedway/update_log.txt"
FILESIZE_D_15_9=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_15_9 2>/dev/null || echo 1048576)
FILESIZE_L_15_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_15_1 2>/dev/null || echo 1048576)
FILESIZE_G_15_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_15_0 2>/dev/null || echo 1048576)
FILESIZE_G_15_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_15_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_15_9 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_15_9' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_15_9 femu@node04:/mnt/nvme4/D_15_9' \
  'dd if=/dev/urandom bs=$FILESIZE_L_15_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_15_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1' \
  'dd if=/dev/urandom bs=$FILESIZE_G_15_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_15_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_15_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1'

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 5'
echo 'Rack write impact:'
echo '  R01: 1 writes'
echo '  R02: 4 writes'
echo '  R03: 3 writes'
echo '  R04: 6 writes'
echo '  R05: 2 writes'
echo '  R06: 2 writes'
echo '  R07: 2 writes'
echo
echo 'Batch update completed at $(date)'
