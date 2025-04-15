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

# Log update for D_11_2
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_2 on rack 1" >> "placedway/update_log.txt"
FILESIZE_D_11_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_11_2 2>/dev/null || echo 1048576)
FILESIZE_L_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_1 2>/dev/null || echo 1048576)
# Log update for D_11_0
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_0 on rack 1" >> "placedway/update_log.txt"
FILESIZE_D_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_11_0 2>/dev/null || echo 1048576)
FILESIZE_L_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_11_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_11_2 femu@node01:/mnt/nvme2/D_11_2' \
  'dd if=/dev/urandom bs=$FILESIZE_L_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_11_0 femu@node01:/mnt/nvme0/D_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_L_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1'

# Short pause between batches
sleep 0.5

# Batch 2/3 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 2/3 (2 blocks)...'

# Log update for D_5_14
echo "$(date +%Y%m%d%H%M%S) - Updated D_5_14 on rack 6" >> "placedway/update_log.txt"
FILESIZE_D_5_14=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_5_14 2>/dev/null || echo 1048576)
FILESIZE_L_5_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_5_2 2>/dev/null || echo 1048576)
FILESIZE_G_5_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_5_0 2>/dev/null || echo 1048576)
FILESIZE_G_5_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_5_1 2>/dev/null || echo 1048576)
# Log update for D_17_18
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_18 on rack 8" >> "placedway/update_log.txt"
FILESIZE_D_17_18=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_17_18 2>/dev/null || echo 1048576)
FILESIZE_L_17_3=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_17_3 2>/dev/null || echo 1048576)
FILESIZE_G_17_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_17_0 2>/dev/null || echo 1048576)
FILESIZE_G_17_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_17_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_5_14 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_5_14' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_5_14 femu@node06:/mnt/nvme4/D_5_14' \
  'dd if=/dev/urandom bs=$FILESIZE_L_5_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_5_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2' \
  'dd if=/dev/urandom bs=$FILESIZE_G_5_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_5_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_5_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_17_18 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_18' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_17_18 femu@node08:/mnt/nvme3/D_17_18' \
  'dd if=/dev/urandom bs=$FILESIZE_L_17_3 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_3' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3' \
  'dd if=/dev/urandom bs=$FILESIZE_G_17_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_17_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 3/3 - Processing 1 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/3 (1 blocks)...'

# Log update for D_12_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_12 on rack 5" >> "placedway/update_log.txt"
FILESIZE_D_12_12=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_12_12 2>/dev/null || echo 1048576)
FILESIZE_L_12_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_12_2 2>/dev/null || echo 1048576)
FILESIZE_G_12_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_12_0 2>/dev/null || echo 1048576)
FILESIZE_G_12_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_12_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_12_12 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_12' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_12_12 femu@node05:/mnt/nvme2/D_12_12' \
  'dd if=/dev/urandom bs=$FILESIZE_L_12_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2' \
  'dd if=/dev/urandom bs=$FILESIZE_G_12_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_12_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_12_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1'

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 5'
echo 'Rack write impact:'
echo '  R01: 3 writes'
echo '  R02: 3 writes'
echo '  R03: 1 writes'
echo '  R05: 4 writes'
echo '  R06: 2 writes'
echo '  R07: 4 writes'
echo '  R08: 3 writes'
echo
echo 'Batch update completed at $(date)'
