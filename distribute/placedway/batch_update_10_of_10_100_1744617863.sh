#!/bin/bash

# Batch update script for 100 blocks
# Generated on 2025-04-14 08:04:24

# Function to execute commands in parallel with controlled concurrency
function parallel_exec() {
    local max_jobs=$1
    shift
    local cmds=($@)
    local running=0
    local job_pids=()

    for cmd in "${cmds[@]}"; do
        # Wait if we've reached max parallel jobs
        while [[ $running -ge $max_jobs ]]; do
            # Check for completed jobs
            for i in ${!job_pids[@]}; do
                if ! ps -p ${job_pids[$i]} > /dev/null; then
                    unset job_pids[$i]
                    running=$((running - 1))
                fi
            done
            [[ $running -lt $max_jobs ]] || sleep 0.1
        done

        # Run command in background
        eval "$cmd" &
        job_pids+=($!)
        running=$((running + 1))
    done

    # Wait for all remaining jobs to complete
    for pid in ${job_pids[@]}; do
        wait $pid
    done
}

# Update summary:
echo 'Starting batch update of 100 blocks at $(date)'

# Ensure log file exists
touch placedway/update_log.txt

# Batch 1/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 1/50 (2 blocks)...'
# Log update for D_12_12
echo "20250414080424 - Updated D_12_12 on rack 5" >> placedway/update_log.txt
# Log update for D_2_2
echo "20250414080424 - Updated D_2_2 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 1 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme2/D_12_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_12 femu@node05:/mnt/nvme2/D_12_12" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node02 'rm -f /mnt/nvme2/D_2_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_2 femu@node02:/mnt/nvme2/D_2_2" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1"

# Short pause between batches
sleep 0.5

# Batch 2/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 2/50 (2 blocks)...'
# Log update for D_10_14
echo "20250414080424 - Updated D_10_14 on rack 5" >> placedway/update_log.txt
# Log update for D_10_13
echo "20250414080424 - Updated D_10_13 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 2 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme4/D_10_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_14 femu@node05:/mnt/nvme4/D_10_14" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node05 'rm -f /mnt/nvme3/D_10_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_13 femu@node05:/mnt/nvme3/D_10_13" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1"

# Short pause between batches
sleep 0.5

# Batch 3/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 3/50 (2 blocks)...'
# Log update for D_5_14
echo "20250414080424 - Updated D_5_14 on rack 6" >> placedway/update_log.txt
# Log update for D_4_4
echo "20250414080424 - Updated D_4_4 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 3 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_5_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_14 femu@node06:/mnt/nvme4/D_5_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1" \
  "ssh femu@node01 'rm -f /mnt/nvme4/D_4_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_4 femu@node01:/mnt/nvme4/D_4_4" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1"

# Short pause between batches
sleep 0.5

# Batch 4/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 4/50 (2 blocks)...'
# Log update for D_6_14
echo "20250414080424 - Updated D_6_14 on rack 5" >> placedway/update_log.txt
# Log update for D_3_18
echo "20250414080424 - Updated D_3_18 on rack 8" >> placedway/update_log.txt

# Execute commands for batch 4 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme4/D_6_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_14 femu@node05:/mnt/nvme4/D_6_14" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1" \
  "ssh femu@node08 'rm -f /mnt/nvme3/D_3_18'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_18 femu@node08:/mnt/nvme3/D_3_18" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1"

# Short pause between batches
sleep 0.5

# Batch 5/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 5/50 (2 blocks)...'
# Log update for D_3_7
echo "20250414080424 - Updated D_3_7 on rack 4" >> placedway/update_log.txt
# Log update for D_13_19
echo "20250414080424 - Updated D_13_19 on rack 8" >> placedway/update_log.txt

# Execute commands for batch 5 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node04 'rm -f /mnt/nvme2/D_3_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_7 femu@node04:/mnt/nvme2/D_3_7" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1" \
  "ssh femu@node08 'rm -f /mnt/nvme4/D_13_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_19 femu@node08:/mnt/nvme4/D_13_19" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1"

# Short pause between batches
sleep 0.5

# Batch 6/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 6/50 (2 blocks)...'
# Log update for D_1_8
echo "20250414080424 - Updated D_1_8 on rack 4" >> placedway/update_log.txt
# Log update for D_16_16
echo "20250414080424 - Updated D_16_16 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 6 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node04 'rm -f /mnt/nvme3/D_1_8'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_8 femu@node04:/mnt/nvme3/D_1_8" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1" \
  "ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1" \
  "ssh femu@node07 'rm -f /mnt/nvme1/D_16_16'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_16 femu@node07:/mnt/nvme1/D_16_16" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1"

# Short pause between batches
sleep 0.5

# Batch 7/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 7/50 (2 blocks)...'
# Log update for D_10_9
echo "20250414080424 - Updated D_10_9 on rack 3" >> placedway/update_log.txt
# Log update for D_6_17
echo "20250414080424 - Updated D_6_17 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 7 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme4/D_10_9'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_9 femu@node03:/mnt/nvme4/D_10_9" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node07 'rm -f /mnt/nvme2/D_6_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_17 femu@node07:/mnt/nvme2/D_6_17" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1"

# Short pause between batches
sleep 0.5

# Batch 8/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 8/50 (2 blocks)...'
# Log update for D_20_13
echo "20250414080424 - Updated D_20_13 on rack 5" >> placedway/update_log.txt
# Log update for D_2_4
echo "20250414080424 - Updated D_2_4 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 8 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme3/D_20_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_13 femu@node05:/mnt/nvme3/D_20_13" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2" \
  "ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0" \
  "ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1" \
  "ssh femu@node01 'rm -f /mnt/nvme4/D_2_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_4 femu@node01:/mnt/nvme4/D_2_4" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1"

# Short pause between batches
sleep 0.5

# Batch 9/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 9/50 (2 blocks)...'
# Log update for D_18_12
echo "20250414080424 - Updated D_18_12 on rack 5" >> placedway/update_log.txt
# Log update for D_12_1
echo "20250414080424 - Updated D_12_1 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 9 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme2/D_18_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_12 femu@node05:/mnt/nvme2/D_18_12" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2" \
  "ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0" \
  "ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1" \
  "ssh femu@node02 'rm -f /mnt/nvme1/D_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_1 femu@node02:/mnt/nvme1/D_12_1" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1"

# Short pause between batches
sleep 0.5

# Batch 10/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 10/50 (2 blocks)...'
# Log update for D_12_11
echo "20250414080424 - Updated D_12_11 on rack 5" >> placedway/update_log.txt
# Log update for D_4_12
echo "20250414080424 - Updated D_4_12 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 10 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme1/D_12_11'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_11 femu@node05:/mnt/nvme1/D_12_11" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node05 'rm -f /mnt/nvme2/D_4_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_12 femu@node05:/mnt/nvme2/D_4_12" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1"

# Short pause between batches
sleep 0.5

# Batch 11/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 11/50 (2 blocks)...'
# Log update for D_19_8
echo "20250414080424 - Updated D_19_8 on rack 4" >> placedway/update_log.txt
# Log update for D_4_10
echo "20250414080424 - Updated D_4_10 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 11 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node04 'rm -f /mnt/nvme3/D_19_8'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_8 femu@node04:/mnt/nvme3/D_19_8" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1" \
  "ssh femu@node05 'rm -f /mnt/nvme0/D_4_10'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_10 femu@node05:/mnt/nvme0/D_4_10" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1"

# Short pause between batches
sleep 0.5

# Batch 12/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 12/50 (2 blocks)...'
# Log update for D_12_5
echo "20250414080424 - Updated D_12_5 on rack 3" >> placedway/update_log.txt
# Log update for D_10_19
echo "20250414080424 - Updated D_10_19 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 12 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme0/D_12_5'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_5 femu@node03:/mnt/nvme0/D_12_5" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node07 'rm -f /mnt/nvme4/D_10_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_19 femu@node07:/mnt/nvme4/D_10_19" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1"

# Short pause between batches
sleep 0.5

# Batch 13/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 13/50 (2 blocks)...'
# Log update for D_2_14
echo "20250414080424 - Updated D_2_14 on rack 5" >> placedway/update_log.txt
# Log update for D_15_0
echo "20250414080424 - Updated D_15_0 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 13 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme4/D_2_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_14 femu@node05:/mnt/nvme4/D_2_14" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1" \
  "ssh femu@node01 'rm -f /mnt/nvme0/D_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_0 femu@node01:/mnt/nvme0/D_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 14/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 14/50 (2 blocks)...'
# Log update for D_17_7
echo "20250414080424 - Updated D_17_7 on rack 4" >> placedway/update_log.txt
# Log update for D_14_17
echo "20250414080424 - Updated D_14_17 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 14 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node04 'rm -f /mnt/nvme2/D_17_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_7 femu@node04:/mnt/nvme2/D_17_7" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1" \
  "ssh femu@node07 'rm -f /mnt/nvme2/D_14_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_17 femu@node07:/mnt/nvme2/D_14_17" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Short pause between batches
sleep 0.5

# Batch 15/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 15/50 (2 blocks)...'
# Log update for D_16_17
echo "20250414080424 - Updated D_16_17 on rack 7" >> placedway/update_log.txt
# Log update for D_9_14
echo "20250414080424 - Updated D_9_14 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 15 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node07 'rm -f /mnt/nvme2/D_16_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_17 femu@node07:/mnt/nvme2/D_16_17" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1" \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_9_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_14 femu@node06:/mnt/nvme4/D_9_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1"

# Short pause between batches
sleep 0.5

# Batch 16/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 16/50 (2 blocks)...'
# Log update for D_14_3
echo "20250414080424 - Updated D_14_3 on rack 1" >> placedway/update_log.txt
# Log update for D_3_12
echo "20250414080424 - Updated D_3_12 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 16 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node01 'rm -f /mnt/nvme3/D_14_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_3 femu@node01:/mnt/nvme3/D_14_3" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1" \
  "ssh femu@node06 'rm -f /mnt/nvme2/D_3_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_12 femu@node06:/mnt/nvme2/D_3_12" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1"

# Short pause between batches
sleep 0.5

# Batch 17/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 17/50 (2 blocks)...'
# Log update for D_11_14
echo "20250414080424 - Updated D_11_14 on rack 6" >> placedway/update_log.txt
# Log update for D_7_4
echo "20250414080424 - Updated D_7_4 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 17 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_11_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_14 femu@node06:/mnt/nvme4/D_11_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1" \
  "ssh femu@node02 'rm -f /mnt/nvme4/D_7_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_4 femu@node02:/mnt/nvme4/D_7_4" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1"

# Short pause between batches
sleep 0.5

# Batch 18/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 18/50 (2 blocks)...'
# Log update for D_15_13
echo "20250414080424 - Updated D_15_13 on rack 6" >> placedway/update_log.txt
# Log update for D_17_13
echo "20250414080424 - Updated D_17_13 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 18 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme3/D_15_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_13 femu@node06:/mnt/nvme3/D_15_13" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1" \
  "ssh femu@node06 'rm -f /mnt/nvme3/D_17_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_13 femu@node06:/mnt/nvme3/D_17_13" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1"

# Short pause between batches
sleep 0.5

# Batch 19/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 19/50 (2 blocks)...'
# Log update for D_5_11
echo "20250414080424 - Updated D_5_11 on rack 6" >> placedway/update_log.txt
# Log update for D_9_7
echo "20250414080424 - Updated D_9_7 on rack 4" >> placedway/update_log.txt

# Execute commands for batch 19 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme1/D_5_11'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_11 femu@node06:/mnt/nvme1/D_5_11" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1" \
  "ssh femu@node04 'rm -f /mnt/nvme2/D_9_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_7 femu@node04:/mnt/nvme2/D_9_7" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1"

# Short pause between batches
sleep 0.5

# Batch 20/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 20/50 (2 blocks)...'
# Log update for D_11_19
echo "20250414080424 - Updated D_11_19 on rack 8" >> placedway/update_log.txt
# Log update for D_19_0
echo "20250414080424 - Updated D_19_0 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 20 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme4/D_11_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_19 femu@node08:/mnt/nvme4/D_11_19" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1" \
  "ssh femu@node01 'rm -f /mnt/nvme0/D_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_0 femu@node01:/mnt/nvme0/D_19_0" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1"

# Short pause between batches
sleep 0.5

# Batch 21/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 21/50 (2 blocks)...'
# Log update for D_11_17
echo "20250414080424 - Updated D_11_17 on rack 8" >> placedway/update_log.txt
# Log update for D_14_4
echo "20250414080424 - Updated D_14_4 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 21 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme2/D_11_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_17 femu@node08:/mnt/nvme2/D_11_17" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1" \
  "ssh femu@node01 'rm -f /mnt/nvme4/D_14_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_4 femu@node01:/mnt/nvme4/D_14_4" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Short pause between batches
sleep 0.5

# Batch 22/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 22/50 (2 blocks)...'
# Log update for D_10_10
echo "20250414080424 - Updated D_10_10 on rack 5" >> placedway/update_log.txt
# Log update for D_14_0
echo "20250414080424 - Updated D_14_0 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 22 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme0/D_10_10'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_10 femu@node05:/mnt/nvme0/D_10_10" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node02 'rm -f /mnt/nvme0/D_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_0 femu@node02:/mnt/nvme0/D_14_0" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Short pause between batches
sleep 0.5

# Batch 23/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 23/50 (2 blocks)...'
# Log update for D_14_8
echo "20250414080424 - Updated D_14_8 on rack 3" >> placedway/update_log.txt
# Log update for D_7_12
echo "20250414080424 - Updated D_7_12 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 23 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme3/D_14_8'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_8 femu@node03:/mnt/nvme3/D_14_8" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1" \
  "ssh femu@node06 'rm -f /mnt/nvme2/D_7_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_12 femu@node06:/mnt/nvme2/D_7_12" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1"

# Short pause between batches
sleep 0.5

# Batch 24/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 24/50 (2 blocks)...'
# Log update for D_5_17
echo "20250414080424 - Updated D_5_17 on rack 8" >> placedway/update_log.txt
# Log update for D_16_5
echo "20250414080424 - Updated D_16_5 on rack 3" >> placedway/update_log.txt

# Execute commands for batch 24 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme2/D_5_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_17 femu@node08:/mnt/nvme2/D_5_17" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1" \
  "ssh femu@node03 'rm -f /mnt/nvme0/D_16_5'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_5 femu@node03:/mnt/nvme0/D_16_5" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1"

# Short pause between batches
sleep 0.5

# Batch 25/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 25/50 (2 blocks)...'
# Log update for D_16_7
echo "20250414080424 - Updated D_16_7 on rack 3" >> placedway/update_log.txt
# Log update for D_15_18
echo "20250414080424 - Updated D_15_18 on rack 8" >> placedway/update_log.txt

# Execute commands for batch 25 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme2/D_16_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_7 femu@node03:/mnt/nvme2/D_16_7" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1" \
  "ssh femu@node08 'rm -f /mnt/nvme3/D_15_18'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_18 femu@node08:/mnt/nvme3/D_15_18" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 26/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 26/50 (2 blocks)...'
# Log update for D_12_0
echo "20250414080424 - Updated D_12_0 on rack 2" >> placedway/update_log.txt
# Log update for D_6_19
echo "20250414080424 - Updated D_6_19 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 26 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node02 'rm -f /mnt/nvme0/D_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_0 femu@node02:/mnt/nvme0/D_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node07 'rm -f /mnt/nvme4/D_6_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_19 femu@node07:/mnt/nvme4/D_6_19" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1"

# Short pause between batches
sleep 0.5

# Batch 27/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 27/50 (2 blocks)...'
# Log update for D_6_9
echo "20250414080424 - Updated D_6_9 on rack 3" >> placedway/update_log.txt
# Log update for D_12_16
echo "20250414080424 - Updated D_12_16 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 27 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme4/D_6_9'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_9 femu@node03:/mnt/nvme4/D_6_9" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1" \
  "ssh femu@node07 'rm -f /mnt/nvme1/D_12_16'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_16 femu@node07:/mnt/nvme1/D_12_16" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1"

# Short pause between batches
sleep 0.5

# Batch 28/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 28/50 (2 blocks)...'
# Log update for D_13_4
echo "20250414080424 - Updated D_13_4 on rack 2" >> placedway/update_log.txt
# Log update for D_6_1
echo "20250414080424 - Updated D_6_1 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 28 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node02 'rm -f /mnt/nvme4/D_13_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_4 femu@node02:/mnt/nvme4/D_13_4" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1" \
  "ssh femu@node02 'rm -f /mnt/nvme1/D_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_1 femu@node02:/mnt/nvme1/D_6_1" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1"

# Short pause between batches
sleep 0.5

# Batch 29/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 29/50 (2 blocks)...'
# Log update for D_12_7
echo "20250414080424 - Updated D_12_7 on rack 3" >> placedway/update_log.txt
# Log update for D_15_9
echo "20250414080424 - Updated D_15_9 on rack 4" >> placedway/update_log.txt

# Execute commands for batch 29 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme2/D_12_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_7 femu@node03:/mnt/nvme2/D_12_7" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node04 'rm -f /mnt/nvme4/D_15_9'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_9 femu@node04:/mnt/nvme4/D_15_9" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 30/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 30/50 (2 blocks)...'
# Log update for D_10_7
echo "20250414080424 - Updated D_10_7 on rack 3" >> placedway/update_log.txt
# Log update for D_19_14
echo "20250414080424 - Updated D_19_14 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 30 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme2/D_10_7'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_7 femu@node03:/mnt/nvme2/D_10_7" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_19_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_14 femu@node06:/mnt/nvme4/D_19_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1"

# Short pause between batches
sleep 0.5

# Batch 31/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 31/50 (2 blocks)...'
# Log update for D_19_19
echo "20250414080424 - Updated D_19_19 on rack 8" >> placedway/update_log.txt
# Log update for D_14_16
echo "20250414080424 - Updated D_14_16 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 31 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme4/D_19_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_19 femu@node08:/mnt/nvme4/D_19_19" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1" \
  "ssh femu@node07 'rm -f /mnt/nvme1/D_14_16'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_16 femu@node07:/mnt/nvme1/D_14_16" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Short pause between batches
sleep 0.5

# Batch 32/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 32/50 (2 blocks)...'
# Log update for D_13_14
echo "20250414080424 - Updated D_13_14 on rack 6" >> placedway/update_log.txt
# Log update for D_3_1
echo "20250414080424 - Updated D_3_1 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 32 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_13_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_14 femu@node06:/mnt/nvme4/D_13_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1" \
  "ssh femu@node01 'rm -f /mnt/nvme1/D_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_1 femu@node01:/mnt/nvme1/D_3_1" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1"

# Short pause between batches
sleep 0.5

# Batch 33/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 33/50 (2 blocks)...'
# Log update for D_7_2
echo "20250414080424 - Updated D_7_2 on rack 1" >> placedway/update_log.txt
# Log update for D_7_0
echo "20250414080424 - Updated D_7_0 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 33 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node01 'rm -f /mnt/nvme2/D_7_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_2 femu@node01:/mnt/nvme2/D_7_2" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1" \
  "ssh femu@node01 'rm -f /mnt/nvme0/D_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_0 femu@node01:/mnt/nvme0/D_7_0" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0" \
  "ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1"

# Short pause between batches
sleep 0.5

# Batch 34/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 34/50 (2 blocks)...'
# Log update for D_16_19
echo "20250414080424 - Updated D_16_19 on rack 7" >> placedway/update_log.txt
# Log update for D_8_13
echo "20250414080424 - Updated D_8_13 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 34 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node07 'rm -f /mnt/nvme4/D_16_19'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_19 femu@node07:/mnt/nvme4/D_16_19" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1" \
  "ssh femu@node05 'rm -f /mnt/nvme3/D_8_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_13 femu@node05:/mnt/nvme3/D_8_13" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2" \
  "ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0" \
  "ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1"

# Short pause between batches
sleep 0.5

# Batch 35/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 35/50 (2 blocks)...'
# Log update for D_3_13
echo "20250414080424 - Updated D_3_13 on rack 6" >> placedway/update_log.txt
# Log update for D_3_15
echo "20250414080424 - Updated D_3_15 on rack 8" >> placedway/update_log.txt

# Execute commands for batch 35 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node06 'rm -f /mnt/nvme3/D_3_13'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_13 femu@node06:/mnt/nvme3/D_3_13" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1" \
  "ssh femu@node08 'rm -f /mnt/nvme0/D_3_15'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_15 femu@node08:/mnt/nvme0/D_3_15" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1"

# Short pause between batches
sleep 0.5

# Batch 36/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 36/50 (2 blocks)...'
# Log update for D_12_10
echo "20250414080424 - Updated D_12_10 on rack 5" >> placedway/update_log.txt
# Log update for D_10_11
echo "20250414080424 - Updated D_10_11 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 36 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme0/D_12_10'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_10 femu@node05:/mnt/nvme0/D_12_10" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1" \
  "ssh femu@node05 'rm -f /mnt/nvme1/D_10_11'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_11 femu@node05:/mnt/nvme1/D_10_11" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1"

# Short pause between batches
sleep 0.5

# Batch 37/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 37/50 (2 blocks)...'
# Log update for D_9_15
echo "20250414080424 - Updated D_9_15 on rack 8" >> placedway/update_log.txt
# Log update for D_9_9
echo "20250414080424 - Updated D_9_9 on rack 4" >> placedway/update_log.txt

# Execute commands for batch 37 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme0/D_9_15'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_15 femu@node08:/mnt/nvme0/D_9_15" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1" \
  "ssh femu@node04 'rm -f /mnt/nvme4/D_9_9'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_9 femu@node04:/mnt/nvme4/D_9_9" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1"

# Short pause between batches
sleep 0.5

# Batch 38/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 38/50 (2 blocks)...'
# Log update for D_10_12
echo "20250414080424 - Updated D_10_12 on rack 5" >> placedway/update_log.txt
# Log update for D_15_6
echo "20250414080424 - Updated D_15_6 on rack 4" >> placedway/update_log.txt

# Execute commands for batch 38 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme2/D_10_12'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_12 femu@node05:/mnt/nvme2/D_10_12" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node04 'rm -f /mnt/nvme1/D_15_6'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_6 femu@node04:/mnt/nvme1/D_15_6" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 39/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 39/50 (2 blocks)...'
# Log update for D_14_5
echo "20250414080424 - Updated D_14_5 on rack 3" >> placedway/update_log.txt
# Log update for D_15_14
echo "20250414080424 - Updated D_15_14 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 39 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme0/D_14_5'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_5 femu@node03:/mnt/nvme0/D_14_5" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1" \
  "ssh femu@node06 'rm -f /mnt/nvme4/D_15_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_14 femu@node06:/mnt/nvme4/D_15_14" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 40/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 40/50 (2 blocks)...'
# Log update for D_8_4
echo "20250414080424 - Updated D_8_4 on rack 1" >> placedway/update_log.txt
# Log update for D_18_2
echo "20250414080424 - Updated D_18_2 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 40 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node01 'rm -f /mnt/nvme4/D_8_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_4 femu@node01:/mnt/nvme4/D_8_4" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0" \
  "ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0" \
  "ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1" \
  "ssh femu@node02 'rm -f /mnt/nvme2/D_18_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_2 femu@node02:/mnt/nvme2/D_18_2" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0" \
  "ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0" \
  "ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1"

# Short pause between batches
sleep 0.5

# Batch 41/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 41/50 (2 blocks)...'
# Log update for D_20_2
echo "20250414080424 - Updated D_20_2 on rack 2" >> placedway/update_log.txt
# Log update for D_10_3
echo "20250414080424 - Updated D_10_3 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 41 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node02 'rm -f /mnt/nvme2/D_20_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_2 femu@node02:/mnt/nvme2/D_20_2" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0" \
  "ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0" \
  "ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1" \
  "ssh femu@node01 'rm -f /mnt/nvme3/D_10_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_3 femu@node01:/mnt/nvme3/D_10_3" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1"

# Short pause between batches
sleep 0.5

# Batch 42/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 42/50 (2 blocks)...'
# Log update for D_16_15
echo "20250414080424 - Updated D_16_15 on rack 7" >> placedway/update_log.txt
# Log update for D_6_18
echo "20250414080424 - Updated D_6_18 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 42 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node07 'rm -f /mnt/nvme0/D_16_15'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_15 femu@node07:/mnt/nvme0/D_16_15" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3" \
  "ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0" \
  "ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1" \
  "ssh femu@node07 'rm -f /mnt/nvme3/D_6_18'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_18 femu@node07:/mnt/nvme3/D_6_18" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1"

# Short pause between batches
sleep 0.5

# Batch 43/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 43/50 (2 blocks)...'
# Log update for D_8_5
echo "20250414080424 - Updated D_8_5 on rack 3" >> placedway/update_log.txt
# Log update for D_8_9
echo "20250414080424 - Updated D_8_9 on rack 3" >> placedway/update_log.txt

# Execute commands for batch 43 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme0/D_8_5'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_5 femu@node03:/mnt/nvme0/D_8_5" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1" \
  "ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0" \
  "ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1" \
  "ssh femu@node03 'rm -f /mnt/nvme4/D_8_9'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_9 femu@node03:/mnt/nvme4/D_8_9" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1" \
  "ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0" \
  "ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1"

# Short pause between batches
sleep 0.5

# Batch 44/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 44/50 (2 blocks)...'
# Log update for D_10_2
echo "20250414080424 - Updated D_10_2 on rack 2" >> placedway/update_log.txt
# Log update for D_9_2
echo "20250414080424 - Updated D_9_2 on rack 1" >> placedway/update_log.txt

# Execute commands for batch 44 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node02 'rm -f /mnt/nvme2/D_10_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_2 femu@node02:/mnt/nvme2/D_10_2" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0" \
  "ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0" \
  "ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1" \
  "ssh femu@node01 'rm -f /mnt/nvme2/D_9_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_2 femu@node01:/mnt/nvme2/D_9_2" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1"

# Short pause between batches
sleep 0.5

# Batch 45/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 45/50 (2 blocks)...'
# Log update for D_18_5
echo "20250414080424 - Updated D_18_5 on rack 3" >> placedway/update_log.txt
# Log update for D_14_11
echo "20250414080424 - Updated D_14_11 on rack 5" >> placedway/update_log.txt

# Execute commands for batch 45 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme0/D_18_5'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_5 femu@node03:/mnt/nvme0/D_18_5" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1" \
  "ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0" \
  "ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1" \
  "ssh femu@node05 'rm -f /mnt/nvme1/D_14_11'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_11 femu@node05:/mnt/nvme1/D_14_11" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Short pause between batches
sleep 0.5

# Batch 46/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 46/50 (2 blocks)...'
# Log update for D_9_18
echo "20250414080424 - Updated D_9_18 on rack 8" >> placedway/update_log.txt
# Log update for D_17_11
echo "20250414080424 - Updated D_17_11 on rack 6" >> placedway/update_log.txt

# Execute commands for batch 46 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node08 'rm -f /mnt/nvme3/D_9_18'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_18 femu@node08:/mnt/nvme3/D_9_18" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1" \
  "ssh femu@node06 'rm -f /mnt/nvme1/D_17_11'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_11 femu@node06:/mnt/nvme1/D_17_11" \
  "ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1"

# Short pause between batches
sleep 0.5

# Batch 47/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 47/50 (2 blocks)...'
# Log update for D_11_2
echo "20250414080424 - Updated D_11_2 on rack 1" >> placedway/update_log.txt
# Log update for D_17_4
echo "20250414080424 - Updated D_17_4 on rack 2" >> placedway/update_log.txt

# Execute commands for batch 47 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node01 'rm -f /mnt/nvme2/D_11_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_2 femu@node01:/mnt/nvme2/D_11_2" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0" \
  "ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0" \
  "ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1" \
  "ssh femu@node02 'rm -f /mnt/nvme4/D_17_4'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_4 femu@node02:/mnt/nvme4/D_17_4" \
  "ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0" \
  "ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1"

# Short pause between batches
sleep 0.5

# Batch 48/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 48/50 (2 blocks)...'
# Log update for D_20_14
echo "20250414080424 - Updated D_20_14 on rack 5" >> placedway/update_log.txt
# Log update for D_1_17
echo "20250414080424 - Updated D_1_17 on rack 8" >> placedway/update_log.txt

# Execute commands for batch 48 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node05 'rm -f /mnt/nvme4/D_20_14'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_14 femu@node05:/mnt/nvme4/D_20_14" \
  "ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2" \
  "ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0" \
  "ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1" \
  "ssh femu@node08 'rm -f /mnt/nvme2/D_1_17'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_17 femu@node08:/mnt/nvme2/D_1_17" \
  "ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3" \
  "ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0" \
  "ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1"

# Short pause between batches
sleep 0.5

# Batch 49/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 49/50 (2 blocks)...'
# Log update for D_2_0
echo "20250414080424 - Updated D_2_0 on rack 2" >> placedway/update_log.txt
# Log update for D_15_8
echo "20250414080424 - Updated D_15_8 on rack 4" >> placedway/update_log.txt

# Execute commands for batch 49 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node02 'rm -f /mnt/nvme0/D_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_0 femu@node02:/mnt/nvme0/D_2_0" \
  "ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1" \
  "ssh femu@node04 'rm -f /mnt/nvme3/D_15_8'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_8 femu@node04:/mnt/nvme3/D_15_8" \
  "ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1" \
  "ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0" \
  "ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1"

# Short pause between batches
sleep 0.5

# Batch 50/50 - Processing 2 blocks
echo '[$(date +%H:%M:%S)] Processing batch 50/50 (2 blocks)...'
# Log update for D_14_6
echo "20250414080424 - Updated D_14_6 on rack 3" >> placedway/update_log.txt
# Log update for D_14_15
echo "20250414080424 - Updated D_14_15 on rack 7" >> placedway/update_log.txt

# Execute commands for batch 50 in parallel (max 8 jobs)
parallel_exec 8 \
  "ssh femu@node03 'rm -f /mnt/nvme1/D_14_6'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_6 femu@node03:/mnt/nvme1/D_14_6" \
  "ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1" \
  "ssh femu@node07 'rm -f /mnt/nvme0/D_14_15'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_15 femu@node07:/mnt/nvme0/D_14_15" \
  "ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3" \
  "ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0" \
  "ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'" \
  "rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1"

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 100'
echo 'Rack write impact:'
echo '  R01: 54 writes'
echo '  R02: 41 writes'
echo '  R03: 45 writes'
echo '  R04: 51 writes'
echo '  R05: 59 writes'
echo '  R06: 59 writes'
echo '  R07: 45 writes'
echo '  R08: 46 writes'
echo
echo 'Batch update completed at $(date)'
