#!/bin/bash

# Batch update script for 5 blocks
# Generated on 2025-04-15 10:05:30

# Create local directory for test chunks
mkdir -p /home/femu/ecwide-ssd/test/chunks

# Ensure log file exists
mkdir -p placedway
touch "placedway/update_log.txt"

# Function to run commands in parallel with variable substitution
function parallel_exec() {
    local max_jobs=$1
    shift
    local tmpdir=$(mktemp -d /tmp/parallel_exec.XXXXXX)
    local commands=()

    while [[ $# -gt 0 ]]; do
        local cmd="$1"
        local file="$tmpdir/cmd_${#commands[@]}.sh"
        echo "#!/bin/bash" > "$file"
        echo "$cmd" >> "$file"
        chmod +x "$file"
        commands+=("$file")
        shift
    done

    printf "%s\n" "${commands[@]}" | xargs -n1 -P "$max_jobs" bash
    rm -rf "$tmpdir"
}

echo "Starting batch update of 5 blocks at $(date)"

########## Batch 1 ##########
echo "[$(date +%H:%M:%S)] Processing batch 1/3 (2 blocks)..."

# Log and file size setup
echo "$(date +%Y%m%d%H%M%S) - Updated D_14_2 on rack 2" >> placedway/update_log.txt
echo "$(date +%Y%m%d%H%M%S) - Updated D_3_16 on rack 8" >> placedway/update_log.txt

# Get file sizes with fallback default
for chunk in D_14_2 L_14_0 G_14_0 G_14_1 D_3_16 L_3_3 G_3_0 G_3_1; do
    eval FILESIZE_${chunk}=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/${chunk} 2>/dev/null || echo 1048576)
done

# Run updates
parallel_exec 8 \
  "dd if=/dev/urandom bs=$FILESIZE_D_14_2 count=1 of=/home/femu/ecwide-ssd/test/chunks/D_14_2 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/D_14_2 femu@node02:/mnt/nvme2/D_14_2" \
  "dd if=/dev/urandom bs=$FILESIZE_L_14_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/L_14_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_14_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_14_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_14_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_14_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1" \
  "dd if=/dev/urandom bs=$FILESIZE_D_3_16 count=1 of=/home/femu/ecwide-ssd/test/chunks/D_3_16 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/D_3_16 femu@node08:/mnt/nvme1/D_3_16" \
  "dd if=/dev/urandom bs=$FILESIZE_L_3_3 count=1 of=/home/femu/ecwide-ssd/test/chunks/L_3_3 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3" \
  "dd if=/dev/urandom bs=$FILESIZE_G_3_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_3_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_3_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_3_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1"

sleep 0.5

########## Batch 2 ##########
echo "[$(date +%H:%M:%S)] Processing batch 2/3 (2 blocks)..."

echo "$(date +%Y%m%d%H%M%S) - Updated D_16_11 on rack 5" >> placedway/update_log.txt
echo "$(date +%Y%m%d%H%M%S) - Updated D_13_9 on rack 4" >> placedway/update_log.txt

for chunk in D_16_11 L_16_2 G_16_0 G_16_1 D_13_9 L_13_1 G_13_0 G_13_1; do
    eval FILESIZE_${chunk}=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/${chunk} 2>/dev/null || echo 1048576)
done

parallel_exec 8 \
  "dd if=/dev/urandom bs=$FILESIZE_D_16_11 count=1 of=/home/femu/ecwide-ssd/test/chunks/D_16_11 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/D_16_11 femu@node05:/mnt/nvme1/D_16_11" \
  "dd if=/dev/urandom bs=$FILESIZE_L_16_2 count=1 of=/home/femu/ecwide-ssd/test/chunks/L_16_2 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2" \
  "dd if=/dev/urandom bs=$FILESIZE_G_16_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_16_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_16_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_16_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1" \
  "dd if=/dev/urandom bs=$FILESIZE_D_13_9 count=1 of=/home/femu/ecwide-ssd/test/chunks/D_13_9 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/D_13_9 femu@node04:/mnt/nvme4/D_13_9" \
  "dd if=/dev/urandom bs=$FILESIZE_L_13_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/L_13_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1" \
  "dd if=/dev/urandom bs=$FILESIZE_G_13_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_13_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_13_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_13_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1"

sleep 0.5

########## Batch 3 ##########
echo "[$(date +%H:%M:%S)] Processing batch 3/3 (1 block)..."

echo "$(date +%Y%m%d%H%M%S) - Updated D_10_5 on rack 3" >> placedway/update_log.txt

for chunk in D_10_5 L_10_1 G_10_0 G_10_1; do
    eval FILESIZE_${chunk}=$(stat -c%s /home/femu/ecwide-ssd/test/chunks/${chunk} 2>/dev/null || echo 1048576)
done

parallel_exec 8 \
  "dd if=/dev/urandom bs=$FILESIZE_D_10_5 count=1 of=/home/femu/ecwide-ssd/test/chunks/D_10_5 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/D_10_5 femu@node03:/mnt/nvme0/D_10_5" \
  "dd if=/dev/urandom bs=$FILESIZE_L_10_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/L_10_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1" \
  "dd if=/dev/urandom bs=$FILESIZE_G_10_0 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_10_0 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "dd if=/dev/urandom bs=$FILESIZE_G_10_1 count=1 of=/home/femu/ecwide-ssd/test/chunks/G_10_1 2>/dev/null" \
  "scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1"

########## Summary ##########
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 5'
echo 'Rack write impact:'
echo '  R01: 2 writes'
echo '  R02: 3 writes'
echo '  R03: 3 writes'
echo '  R04: 4 writes'
echo '  R05: 3 writes'
echo '  R06: 2 writes'
echo '  R08: 3 writes'
echo
echo "Batch update completed at $(date)"