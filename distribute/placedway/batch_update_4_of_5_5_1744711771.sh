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

# Log update for D_8_16
echo "$(date +%Y%m%d%H%M%S) - Updated D_8_16 on rack 7" >> "placedway/update_log.txt"
FILESIZE_D_8_16=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_8_16 2>/dev/null || echo 1048576)
FILESIZE_L_8_3=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_8_3 2>/dev/null || echo 1048576)
FILESIZE_G_8_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_8_0 2>/dev/null || echo 1048576)
FILESIZE_G_8_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_8_1 2>/dev/null || echo 1048576)
# Log update for D_14_8
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_8 on rack 3" >> "placedway/update_log.txt"
FILESIZE_D_14_8=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_14_8 2>/dev/null || echo 1048576)
FILESIZE_L_14_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_14_1 2>/dev/null || echo 1048576)
FILESIZE_G_14_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_14_0 2>/dev/null || echo 1048576)
FILESIZE_G_14_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_14_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_8_16 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_8_16' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_8_16 femu@node07:/mnt/nvme1/D_8_16' \
  'dd if=/dev/urandom bs=$FILESIZE_L_8_3 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_8_3' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3' \
  'dd if=/dev/urandom bs=$FILESIZE_G_8_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_8_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_8_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_14_8 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_14_8' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_14_8 femu@node03:/mnt/nvme3/D_14_8' \
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

# Log update for D_4_12
echo "$(date +%Y%m%d%H%M%S) - Updated D_4_12 on rack 5" >> "placedway/update_log.txt"
FILESIZE_D_4_12=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_4_12 2>/dev/null || echo 1048576)
FILESIZE_L_4_2=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_4_2 2>/dev/null || echo 1048576)
FILESIZE_G_4_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_4_0 2>/dev/null || echo 1048576)
FILESIZE_G_4_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_4_1 2>/dev/null || echo 1048576)
# Log update for D_16_4
echo "$(date +%Y%m%d%H%M%S) - Updated D_16_4 on rack 1" >> "placedway/update_log.txt"
FILESIZE_D_16_4=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_16_4 2>/dev/null || echo 1048576)
FILESIZE_L_16_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_16_0 2>/dev/null || echo 1048576)
FILESIZE_G_16_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_16_0 2>/dev/null || echo 1048576)
FILESIZE_G_16_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_16_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_4_12 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_4_12' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_4_12 femu@node05:/mnt/nvme2/D_4_12' \
  'dd if=/dev/urandom bs=$FILESIZE_L_4_2 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_4_2' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2' \
  'dd if=/dev/urandom bs=$FILESIZE_G_4_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_4_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_4_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1' \
  'dd if=/dev/urandom bs=$FILESIZE_D_16_4 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_16_4' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_16_4 femu@node01:/mnt/nvme4/D_16_4' \
  'dd if=/dev/urandom bs=$FILESIZE_L_16_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_16_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_16_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0' \
  'dd if=/dev/urandom bs=$FILESIZE_G_16_1 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/G_16_1' \
  'scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1'

# Short pause between batches
sleep 0.5

# Batch 3/3 - Processing 1 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/3 (1 blocks)...'

# Log update for D_12_3
echo "$(date +%Y%m%d%H%M%S) - Updated D_12_3 on rack 1" >> "placedway/update_log.txt"
FILESIZE_D_12_3=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/D_12_3 2>/dev/null || echo 1048576)
FILESIZE_L_12_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/L_12_0 2>/dev/null || echo 1048576)
FILESIZE_G_12_0=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_12_0 2>/dev/null || echo 1048576)
FILESIZE_G_12_1=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/G_12_1 2>/dev/null || echo 1048576)

# Execute all commands for this batch in parallel
parallel_exec 8 \
  'dd if=/dev/urandom bs=$FILESIZE_D_12_3 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/D_12_3' \
  'scp /home/femu/ecwide-ssd/test/chunks/D_12_3 femu@node01:/mnt/nvme3/D_12_3' \
  'dd if=/dev/urandom bs=$FILESIZE_L_12_0 count=1 2>/dev/null > /home/femu/ecwide-ssd/test/chunks/L_12_0' \
  'scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0' \
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
echo '  R01: 8 writes'
echo '  R03: 2 writes'
echo '  R04: 1 writes'
echo '  R05: 2 writes'
echo '  R06: 1 writes'
echo '  R07: 2 writes'
echo '  R08: 4 writes'
echo
echo 'Batch update completed at $(date)'
