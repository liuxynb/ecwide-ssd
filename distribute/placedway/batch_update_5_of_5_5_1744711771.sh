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

# Log update for D_20_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_20_12 on rack 5" >> "placedway/update_log.txt"
FILESIZE_D_20_12=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_20_12 2>/dev/null || echo 1048576)
FILESIZE_L_20_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_20_2 2>/dev/null || echo 1048576)
FILESIZE_G_20_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_20_0 2>/dev/null || echo 1048576)
FILESIZE_G_20_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_20_1 2>/dev/null || echo 1048576)
# Log update for D_17_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_17_8 on rack 4" >> "placedway/update_log.txt"
FILESIZE_D_17_8=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_17_8 2>/dev/null || echo 1048576)
FILESIZE_L_17_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_17_1 2>/dev/null || echo 1048576)
FILESIZE_G_17_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_17_0 2>/dev/null || echo 1048576)
FILESIZE_G_17_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_17_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_20_12 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_20_12' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_20_12 femu@node05:/mnt/nvme2/D_20_12' \
  'dd if=/dev/urandom bs=$FILESIZE_L_20_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_20_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2' \
  'dd if=/dev/urandom bs=$FILESIZE_G_20_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_20_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_20_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_17_8 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_17_8' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_17_8 femu@node04:/mnt/nvme3/D_17_8' \
  'dd if=/dev/urandom bs=$FILESIZE_L_17_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_17_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1' \
  'dd if=/dev/urandom bs=$FILESIZE_G_17_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_17_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_17_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1'

# Short pause between batches
sleep 0.5

# Batch 2/3 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 2/3 (2 blocks)...'

# Log update for D_1_6
echo "$(date +%Y%m%d%H%M%S) - Updated D_1_6 on rack 4" >> "placedway/update_log.txt"
FILESIZE_D_1_6=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_1_6 2>/dev/null || echo 1048576)
FILESIZE_L_1_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_1_1 2>/dev/null || echo 1048576)
FILESIZE_G_1_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_1_0 2>/dev/null || echo 1048576)
FILESIZE_G_1_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_1_1 2>/dev/null || echo 1048576)
# Log update for D_18_15
echo "$(date +%Y%m%d%H%M%S) - Updated D_18_15 on rack 7" >> "placedway/update_log.txt"
FILESIZE_D_18_15=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_18_15 2>/dev/null || echo 1048576)
FILESIZE_L_18_3=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_18_3 2>/dev/null || echo 1048576)
FILESIZE_G_18_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_18_0 2>/dev/null || echo 1048576)
FILESIZE_G_18_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_18_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_1_6 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_1_6' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_1_6 femu@node04:/mnt/nvme1/D_1_6' \
  'dd if=/dev/urandom bs=$FILESIZE_L_1_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_1_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1' \
  'dd if=/dev/urandom bs=$FILESIZE_G_1_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_1_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_1_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_18_15 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_18_15' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_18_15 femu@node07:/mnt/nvme0/D_18_15' \
  'dd if=/dev/urandom bs=$FILESIZE_L_18_3 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_18_3' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3' \
  'dd if=/dev/urandom bs=$FILESIZE_G_18_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_18_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_18_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1'

# Short pause between batches
sleep 0.5

# Batch 3/3 - Processing 1 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/3 (1 blocks)...'

# Log update for D_11_11
echo "$(date +%Y%m%d%H%M%S) - Updated D_11_11 on rack 6" >> "placedway/update_log.txt"
FILESIZE_D_11_11=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_11_11 2>/dev/null || echo 1048576)
FILESIZE_L_11_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_11_2 2>/dev/null || echo 1048576)
FILESIZE_G_11_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_0 2>/dev/null || echo 1048576)
FILESIZE_G_11_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_11_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_11_11 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_11_11' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_11_11 femu@node06:/mnt/nvme1/D_11_11' \
  'dd if=/dev/urandom bs=$FILESIZE_L_11_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_11_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_11_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_11_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1'

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 5'
echo 'Rack write impact:'
echo '  R01: 2 writes'
echo '  R03: 2 writes'
echo '  R04: 5 writes'
echo '  R05: 3 writes'
echo '  R06: 3 writes'
echo '  R07: 4 writes'
echo '  R08: 1 writes'
echo
echo 'Batch update completed at $(date)'
