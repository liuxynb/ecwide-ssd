#!/bin/bash

# Batch update script for 400 blocks
# Generated on 2025-04-14 02:41:38

# Update summary:
echo 'Starting batch update of 400 blocks at $(date)'

# Update block D_1_0 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_0
ssh femu@node01 'rm -f /mnt/nvme0/D_1_0'
scp /home/femu/ecwide-ssd/test/chunks/D_1_0 femu@node01:/mnt/nvme0/D_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_0
ssh femu@node02 'rm -f /mnt/nvme5/L_1_0'
scp /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_0 on rack 1" >> placedway/update_log.txt

# Update block D_1_1 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_1
ssh femu@node01 'rm -f /mnt/nvme1/D_1_1'
scp /home/femu/ecwide-ssd/test/chunks/D_1_1 femu@node01:/mnt/nvme1/D_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_0
ssh femu@node02 'rm -f /mnt/nvme5/L_1_0'
scp /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_1 on rack 1" >> placedway/update_log.txt

# Update block D_1_2 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_2
ssh femu@node01 'rm -f /mnt/nvme2/D_1_2'
scp /home/femu/ecwide-ssd/test/chunks/D_1_2 femu@node01:/mnt/nvme2/D_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_0
ssh femu@node02 'rm -f /mnt/nvme5/L_1_0'
scp /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_2 on rack 1" >> placedway/update_log.txt

# Update block D_1_3 (impacts R02, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_3
ssh femu@node02 'rm -f /mnt/nvme3/D_1_3'
scp /home/femu/ecwide-ssd/test/chunks/D_1_3 femu@node02:/mnt/nvme3/D_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_0
ssh femu@node02 'rm -f /mnt/nvme5/L_1_0'
scp /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_3 on rack 2" >> placedway/update_log.txt

# Update block D_1_4 (impacts R02, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_4
ssh femu@node02 'rm -f /mnt/nvme4/D_1_4'
scp /home/femu/ecwide-ssd/test/chunks/D_1_4 femu@node02:/mnt/nvme4/D_1_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_0
ssh femu@node02 'rm -f /mnt/nvme5/L_1_0'
scp /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_4 on rack 2" >> placedway/update_log.txt

# Update block D_1_5 (impacts R04, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_5
ssh femu@node04 'rm -f /mnt/nvme0/D_1_5'
scp /home/femu/ecwide-ssd/test/chunks/D_1_5 femu@node04:/mnt/nvme0/D_1_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_1
ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'
scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_5 on rack 4" >> placedway/update_log.txt

# Update block D_1_6 (impacts R04, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_6
ssh femu@node04 'rm -f /mnt/nvme1/D_1_6'
scp /home/femu/ecwide-ssd/test/chunks/D_1_6 femu@node04:/mnt/nvme1/D_1_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_1
ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'
scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_6 on rack 4" >> placedway/update_log.txt

# Update block D_1_7 (impacts R04, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_7
ssh femu@node04 'rm -f /mnt/nvme2/D_1_7'
scp /home/femu/ecwide-ssd/test/chunks/D_1_7 femu@node04:/mnt/nvme2/D_1_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_1
ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'
scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_7 on rack 4" >> placedway/update_log.txt

# Update block D_1_8 (impacts R04, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_8
ssh femu@node04 'rm -f /mnt/nvme3/D_1_8'
scp /home/femu/ecwide-ssd/test/chunks/D_1_8 femu@node04:/mnt/nvme3/D_1_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_1
ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'
scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_8 on rack 4" >> placedway/update_log.txt

# Update block D_1_9 (impacts R04, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_9
ssh femu@node04 'rm -f /mnt/nvme4/D_1_9'
scp /home/femu/ecwide-ssd/test/chunks/D_1_9 femu@node04:/mnt/nvme4/D_1_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_1
ssh femu@node04 'rm -f /mnt/nvme5/L_1_1'
scp /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_9 on rack 4" >> placedway/update_log.txt

# Update block D_1_10 (impacts R06, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_10
ssh femu@node06 'rm -f /mnt/nvme0/D_1_10'
scp /home/femu/ecwide-ssd/test/chunks/D_1_10 femu@node06:/mnt/nvme0/D_1_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_2
ssh femu@node06 'rm -f /mnt/nvme5/L_1_2'
scp /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_10 on rack 6" >> placedway/update_log.txt

# Update block D_1_11 (impacts R06, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_11
ssh femu@node06 'rm -f /mnt/nvme1/D_1_11'
scp /home/femu/ecwide-ssd/test/chunks/D_1_11 femu@node06:/mnt/nvme1/D_1_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_2
ssh femu@node06 'rm -f /mnt/nvme5/L_1_2'
scp /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_11 on rack 6" >> placedway/update_log.txt

# Update block D_1_12 (impacts R06, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_12
ssh femu@node06 'rm -f /mnt/nvme2/D_1_12'
scp /home/femu/ecwide-ssd/test/chunks/D_1_12 femu@node06:/mnt/nvme2/D_1_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_2
ssh femu@node06 'rm -f /mnt/nvme5/L_1_2'
scp /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_12 on rack 6" >> placedway/update_log.txt

# Update block D_1_13 (impacts R06, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_13
ssh femu@node06 'rm -f /mnt/nvme3/D_1_13'
scp /home/femu/ecwide-ssd/test/chunks/D_1_13 femu@node06:/mnt/nvme3/D_1_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_2
ssh femu@node06 'rm -f /mnt/nvme5/L_1_2'
scp /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_13 on rack 6" >> placedway/update_log.txt

# Update block D_1_14 (impacts R06, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_14
ssh femu@node06 'rm -f /mnt/nvme4/D_1_14'
scp /home/femu/ecwide-ssd/test/chunks/D_1_14 femu@node06:/mnt/nvme4/D_1_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_2
ssh femu@node06 'rm -f /mnt/nvme5/L_1_2'
scp /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_14 on rack 6" >> placedway/update_log.txt

# Update block D_1_15 (impacts R08, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_15
ssh femu@node08 'rm -f /mnt/nvme0/D_1_15'
scp /home/femu/ecwide-ssd/test/chunks/D_1_15 femu@node08:/mnt/nvme0/D_1_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_3
ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'
scp /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_15 on rack 8" >> placedway/update_log.txt

# Update block D_1_16 (impacts R08, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_16
ssh femu@node08 'rm -f /mnt/nvme1/D_1_16'
scp /home/femu/ecwide-ssd/test/chunks/D_1_16 femu@node08:/mnt/nvme1/D_1_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_3
ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'
scp /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_16 on rack 8" >> placedway/update_log.txt

# Update block D_1_17 (impacts R08, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_17
ssh femu@node08 'rm -f /mnt/nvme2/D_1_17'
scp /home/femu/ecwide-ssd/test/chunks/D_1_17 femu@node08:/mnt/nvme2/D_1_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_3
ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'
scp /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_17 on rack 8" >> placedway/update_log.txt

# Update block D_1_18 (impacts R08, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_18
ssh femu@node08 'rm -f /mnt/nvme3/D_1_18'
scp /home/femu/ecwide-ssd/test/chunks/D_1_18 femu@node08:/mnt/nvme3/D_1_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_3
ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'
scp /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_18 on rack 8" >> placedway/update_log.txt

# Update block D_1_19 (impacts R08, R01, R03)
echo '[$(date +%H:%M:%S)] Updating D_1_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_1_19
ssh femu@node08 'rm -f /mnt/nvme4/D_1_19'
scp /home/femu/ecwide-ssd/test/chunks/D_1_19 femu@node08:/mnt/nvme4/D_1_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_1_3
ssh femu@node08 'rm -f /mnt/nvme5/L_1_3'
scp /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_0
ssh femu@node01 'rm -f /mnt/nvme3/G_1_0'
scp /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_1_1
ssh femu@node03 'rm -f /mnt/nvme4/G_1_1'
scp /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
sleep 0.01

echo "20250414024138 - Updated D_1_19 on rack 8" >> placedway/update_log.txt

# Update block D_2_0 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_0
ssh femu@node02 'rm -f /mnt/nvme0/D_2_0'
scp /home/femu/ecwide-ssd/test/chunks/D_2_0 femu@node02:/mnt/nvme0/D_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_0
ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'
scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_0 on rack 2" >> placedway/update_log.txt

# Update block D_2_1 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_1
ssh femu@node02 'rm -f /mnt/nvme1/D_2_1'
scp /home/femu/ecwide-ssd/test/chunks/D_2_1 femu@node02:/mnt/nvme1/D_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_0
ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'
scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_1 on rack 2" >> placedway/update_log.txt

# Update block D_2_2 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_2
ssh femu@node02 'rm -f /mnt/nvme2/D_2_2'
scp /home/femu/ecwide-ssd/test/chunks/D_2_2 femu@node02:/mnt/nvme2/D_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_0
ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'
scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_2 on rack 2" >> placedway/update_log.txt

# Update block D_2_3 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_3
ssh femu@node01 'rm -f /mnt/nvme3/D_2_3'
scp /home/femu/ecwide-ssd/test/chunks/D_2_3 femu@node01:/mnt/nvme3/D_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_0
ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'
scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_3 on rack 1" >> placedway/update_log.txt

# Update block D_2_4 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_4
ssh femu@node01 'rm -f /mnt/nvme4/D_2_4'
scp /home/femu/ecwide-ssd/test/chunks/D_2_4 femu@node01:/mnt/nvme4/D_2_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_0
ssh femu@node01 'rm -f /mnt/nvme5/L_2_0'
scp /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_4 on rack 1" >> placedway/update_log.txt

# Update block D_2_5 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_5
ssh femu@node03 'rm -f /mnt/nvme0/D_2_5'
scp /home/femu/ecwide-ssd/test/chunks/D_2_5 femu@node03:/mnt/nvme0/D_2_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_1
ssh femu@node03 'rm -f /mnt/nvme5/L_2_1'
scp /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_5 on rack 3" >> placedway/update_log.txt

# Update block D_2_6 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_6
ssh femu@node03 'rm -f /mnt/nvme1/D_2_6'
scp /home/femu/ecwide-ssd/test/chunks/D_2_6 femu@node03:/mnt/nvme1/D_2_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_1
ssh femu@node03 'rm -f /mnt/nvme5/L_2_1'
scp /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_6 on rack 3" >> placedway/update_log.txt

# Update block D_2_7 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_7
ssh femu@node03 'rm -f /mnt/nvme2/D_2_7'
scp /home/femu/ecwide-ssd/test/chunks/D_2_7 femu@node03:/mnt/nvme2/D_2_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_1
ssh femu@node03 'rm -f /mnt/nvme5/L_2_1'
scp /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_7 on rack 3" >> placedway/update_log.txt

# Update block D_2_8 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_8
ssh femu@node03 'rm -f /mnt/nvme3/D_2_8'
scp /home/femu/ecwide-ssd/test/chunks/D_2_8 femu@node03:/mnt/nvme3/D_2_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_1
ssh femu@node03 'rm -f /mnt/nvme5/L_2_1'
scp /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_8 on rack 3" >> placedway/update_log.txt

# Update block D_2_9 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_9
ssh femu@node03 'rm -f /mnt/nvme4/D_2_9'
scp /home/femu/ecwide-ssd/test/chunks/D_2_9 femu@node03:/mnt/nvme4/D_2_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_1
ssh femu@node03 'rm -f /mnt/nvme5/L_2_1'
scp /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_9 on rack 3" >> placedway/update_log.txt

# Update block D_2_10 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_10
ssh femu@node05 'rm -f /mnt/nvme0/D_2_10'
scp /home/femu/ecwide-ssd/test/chunks/D_2_10 femu@node05:/mnt/nvme0/D_2_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_2
ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'
scp /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_10 on rack 5" >> placedway/update_log.txt

# Update block D_2_11 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_11
ssh femu@node05 'rm -f /mnt/nvme1/D_2_11'
scp /home/femu/ecwide-ssd/test/chunks/D_2_11 femu@node05:/mnt/nvme1/D_2_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_2
ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'
scp /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_11 on rack 5" >> placedway/update_log.txt

# Update block D_2_12 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_12
ssh femu@node05 'rm -f /mnt/nvme2/D_2_12'
scp /home/femu/ecwide-ssd/test/chunks/D_2_12 femu@node05:/mnt/nvme2/D_2_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_2
ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'
scp /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_12 on rack 5" >> placedway/update_log.txt

# Update block D_2_13 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_13
ssh femu@node05 'rm -f /mnt/nvme3/D_2_13'
scp /home/femu/ecwide-ssd/test/chunks/D_2_13 femu@node05:/mnt/nvme3/D_2_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_2
ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'
scp /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_13 on rack 5" >> placedway/update_log.txt

# Update block D_2_14 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_14
ssh femu@node05 'rm -f /mnt/nvme4/D_2_14'
scp /home/femu/ecwide-ssd/test/chunks/D_2_14 femu@node05:/mnt/nvme4/D_2_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_2
ssh femu@node05 'rm -f /mnt/nvme5/L_2_2'
scp /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_14 on rack 5" >> placedway/update_log.txt

# Update block D_2_15 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_15
ssh femu@node07 'rm -f /mnt/nvme0/D_2_15'
scp /home/femu/ecwide-ssd/test/chunks/D_2_15 femu@node07:/mnt/nvme0/D_2_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_3
ssh femu@node07 'rm -f /mnt/nvme5/L_2_3'
scp /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_15 on rack 7" >> placedway/update_log.txt

# Update block D_2_16 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_16
ssh femu@node07 'rm -f /mnt/nvme1/D_2_16'
scp /home/femu/ecwide-ssd/test/chunks/D_2_16 femu@node07:/mnt/nvme1/D_2_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_3
ssh femu@node07 'rm -f /mnt/nvme5/L_2_3'
scp /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_16 on rack 7" >> placedway/update_log.txt

# Update block D_2_17 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_17
ssh femu@node07 'rm -f /mnt/nvme2/D_2_17'
scp /home/femu/ecwide-ssd/test/chunks/D_2_17 femu@node07:/mnt/nvme2/D_2_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_3
ssh femu@node07 'rm -f /mnt/nvme5/L_2_3'
scp /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_17 on rack 7" >> placedway/update_log.txt

# Update block D_2_18 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_18
ssh femu@node07 'rm -f /mnt/nvme3/D_2_18'
scp /home/femu/ecwide-ssd/test/chunks/D_2_18 femu@node07:/mnt/nvme3/D_2_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_3
ssh femu@node07 'rm -f /mnt/nvme5/L_2_3'
scp /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_18 on rack 7" >> placedway/update_log.txt

# Update block D_2_19 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_2_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_2_19
ssh femu@node07 'rm -f /mnt/nvme4/D_2_19'
scp /home/femu/ecwide-ssd/test/chunks/D_2_19 femu@node07:/mnt/nvme4/D_2_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_2_3
ssh femu@node07 'rm -f /mnt/nvme5/L_2_3'
scp /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_0
ssh femu@node04 'rm -f /mnt/nvme0/G_2_0'
scp /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_2_1
ssh femu@node06 'rm -f /mnt/nvme1/G_2_1'
scp /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
sleep 0.01

echo "20250414024138 - Updated D_2_19 on rack 7" >> placedway/update_log.txt

# Update block D_3_0 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_0
ssh femu@node01 'rm -f /mnt/nvme0/D_3_0'
scp /home/femu/ecwide-ssd/test/chunks/D_3_0 femu@node01:/mnt/nvme0/D_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_0
ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'
scp /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_0 on rack 1" >> placedway/update_log.txt

# Update block D_3_1 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_1
ssh femu@node01 'rm -f /mnt/nvme1/D_3_1'
scp /home/femu/ecwide-ssd/test/chunks/D_3_1 femu@node01:/mnt/nvme1/D_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_0
ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'
scp /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_1 on rack 1" >> placedway/update_log.txt

# Update block D_3_2 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_2
ssh femu@node01 'rm -f /mnt/nvme2/D_3_2'
scp /home/femu/ecwide-ssd/test/chunks/D_3_2 femu@node01:/mnt/nvme2/D_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_0
ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'
scp /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_2 on rack 1" >> placedway/update_log.txt

# Update block D_3_3 (impacts R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_3
ssh femu@node02 'rm -f /mnt/nvme3/D_3_3'
scp /home/femu/ecwide-ssd/test/chunks/D_3_3 femu@node02:/mnt/nvme3/D_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_0
ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'
scp /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_3 on rack 2" >> placedway/update_log.txt

# Update block D_3_4 (impacts R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_4
ssh femu@node02 'rm -f /mnt/nvme4/D_3_4'
scp /home/femu/ecwide-ssd/test/chunks/D_3_4 femu@node02:/mnt/nvme4/D_3_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_0
ssh femu@node02 'rm -f /mnt/nvme5/L_3_0'
scp /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_4 on rack 2" >> placedway/update_log.txt

# Update block D_3_5 (impacts R04, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_5
ssh femu@node04 'rm -f /mnt/nvme0/D_3_5'
scp /home/femu/ecwide-ssd/test/chunks/D_3_5 femu@node04:/mnt/nvme0/D_3_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_1
ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'
scp /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_5 on rack 4" >> placedway/update_log.txt

# Update block D_3_6 (impacts R04, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_6
ssh femu@node04 'rm -f /mnt/nvme1/D_3_6'
scp /home/femu/ecwide-ssd/test/chunks/D_3_6 femu@node04:/mnt/nvme1/D_3_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_1
ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'
scp /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_6 on rack 4" >> placedway/update_log.txt

# Update block D_3_7 (impacts R04, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_7
ssh femu@node04 'rm -f /mnt/nvme2/D_3_7'
scp /home/femu/ecwide-ssd/test/chunks/D_3_7 femu@node04:/mnt/nvme2/D_3_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_1
ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'
scp /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_7 on rack 4" >> placedway/update_log.txt

# Update block D_3_8 (impacts R04, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_8
ssh femu@node04 'rm -f /mnt/nvme3/D_3_8'
scp /home/femu/ecwide-ssd/test/chunks/D_3_8 femu@node04:/mnt/nvme3/D_3_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_1
ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'
scp /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_8 on rack 4" >> placedway/update_log.txt

# Update block D_3_9 (impacts R04, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_9
ssh femu@node04 'rm -f /mnt/nvme4/D_3_9'
scp /home/femu/ecwide-ssd/test/chunks/D_3_9 femu@node04:/mnt/nvme4/D_3_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_1
ssh femu@node04 'rm -f /mnt/nvme5/L_3_1'
scp /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_9 on rack 4" >> placedway/update_log.txt

# Update block D_3_10 (impacts R06, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_10
ssh femu@node06 'rm -f /mnt/nvme0/D_3_10'
scp /home/femu/ecwide-ssd/test/chunks/D_3_10 femu@node06:/mnt/nvme0/D_3_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_2
ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'
scp /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_10 on rack 6" >> placedway/update_log.txt

# Update block D_3_11 (impacts R06, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_11
ssh femu@node06 'rm -f /mnt/nvme1/D_3_11'
scp /home/femu/ecwide-ssd/test/chunks/D_3_11 femu@node06:/mnt/nvme1/D_3_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_2
ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'
scp /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_11 on rack 6" >> placedway/update_log.txt

# Update block D_3_12 (impacts R06, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_12
ssh femu@node06 'rm -f /mnt/nvme2/D_3_12'
scp /home/femu/ecwide-ssd/test/chunks/D_3_12 femu@node06:/mnt/nvme2/D_3_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_2
ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'
scp /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_12 on rack 6" >> placedway/update_log.txt

# Update block D_3_13 (impacts R06, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_13
ssh femu@node06 'rm -f /mnt/nvme3/D_3_13'
scp /home/femu/ecwide-ssd/test/chunks/D_3_13 femu@node06:/mnt/nvme3/D_3_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_2
ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'
scp /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_13 on rack 6" >> placedway/update_log.txt

# Update block D_3_14 (impacts R06, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_14
ssh femu@node06 'rm -f /mnt/nvme4/D_3_14'
scp /home/femu/ecwide-ssd/test/chunks/D_3_14 femu@node06:/mnt/nvme4/D_3_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_2
ssh femu@node06 'rm -f /mnt/nvme5/L_3_2'
scp /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_14 on rack 6" >> placedway/update_log.txt

# Update block D_3_15 (impacts R08, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_15
ssh femu@node08 'rm -f /mnt/nvme0/D_3_15'
scp /home/femu/ecwide-ssd/test/chunks/D_3_15 femu@node08:/mnt/nvme0/D_3_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_3
ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'
scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_15 on rack 8" >> placedway/update_log.txt

# Update block D_3_16 (impacts R08, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_16
ssh femu@node08 'rm -f /mnt/nvme1/D_3_16'
scp /home/femu/ecwide-ssd/test/chunks/D_3_16 femu@node08:/mnt/nvme1/D_3_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_3
ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'
scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_16 on rack 8" >> placedway/update_log.txt

# Update block D_3_17 (impacts R08, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_17
ssh femu@node08 'rm -f /mnt/nvme2/D_3_17'
scp /home/femu/ecwide-ssd/test/chunks/D_3_17 femu@node08:/mnt/nvme2/D_3_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_3
ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'
scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_17 on rack 8" >> placedway/update_log.txt

# Update block D_3_18 (impacts R08, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_18
ssh femu@node08 'rm -f /mnt/nvme3/D_3_18'
scp /home/femu/ecwide-ssd/test/chunks/D_3_18 femu@node08:/mnt/nvme3/D_3_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_3
ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'
scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_18 on rack 8" >> placedway/update_log.txt

# Update block D_3_19 (impacts R08, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_3_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_3_19
ssh femu@node08 'rm -f /mnt/nvme4/D_3_19'
scp /home/femu/ecwide-ssd/test/chunks/D_3_19 femu@node08:/mnt/nvme4/D_3_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_3_3
ssh femu@node08 'rm -f /mnt/nvme5/L_3_3'
scp /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_0
ssh femu@node02 'rm -f /mnt/nvme2/G_3_0'
scp /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_3_1
ssh femu@node05 'rm -f /mnt/nvme3/G_3_1'
scp /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
sleep 0.01

echo "20250414024138 - Updated D_3_19 on rack 8" >> placedway/update_log.txt

# Update block D_4_0 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_4_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_0
ssh femu@node02 'rm -f /mnt/nvme0/D_4_0'
scp /home/femu/ecwide-ssd/test/chunks/D_4_0 femu@node02:/mnt/nvme0/D_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_0
ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'
scp /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_0 on rack 2" >> placedway/update_log.txt

# Update block D_4_1 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_4_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_1
ssh femu@node02 'rm -f /mnt/nvme1/D_4_1'
scp /home/femu/ecwide-ssd/test/chunks/D_4_1 femu@node02:/mnt/nvme1/D_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_0
ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'
scp /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_1 on rack 2" >> placedway/update_log.txt

# Update block D_4_2 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_4_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_2
ssh femu@node02 'rm -f /mnt/nvme2/D_4_2'
scp /home/femu/ecwide-ssd/test/chunks/D_4_2 femu@node02:/mnt/nvme2/D_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_0
ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'
scp /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_2 on rack 2" >> placedway/update_log.txt

# Update block D_4_3 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_4_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_3
ssh femu@node01 'rm -f /mnt/nvme3/D_4_3'
scp /home/femu/ecwide-ssd/test/chunks/D_4_3 femu@node01:/mnt/nvme3/D_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_0
ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'
scp /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_3 on rack 1" >> placedway/update_log.txt

# Update block D_4_4 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_4_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_4
ssh femu@node01 'rm -f /mnt/nvme4/D_4_4'
scp /home/femu/ecwide-ssd/test/chunks/D_4_4 femu@node01:/mnt/nvme4/D_4_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_0
ssh femu@node01 'rm -f /mnt/nvme5/L_4_0'
scp /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_4 on rack 1" >> placedway/update_log.txt

# Update block D_4_5 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_5
ssh femu@node03 'rm -f /mnt/nvme0/D_4_5'
scp /home/femu/ecwide-ssd/test/chunks/D_4_5 femu@node03:/mnt/nvme0/D_4_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_1
ssh femu@node03 'rm -f /mnt/nvme5/L_4_1'
scp /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_5 on rack 3" >> placedway/update_log.txt

# Update block D_4_6 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_6
ssh femu@node03 'rm -f /mnt/nvme1/D_4_6'
scp /home/femu/ecwide-ssd/test/chunks/D_4_6 femu@node03:/mnt/nvme1/D_4_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_1
ssh femu@node03 'rm -f /mnt/nvme5/L_4_1'
scp /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_6 on rack 3" >> placedway/update_log.txt

# Update block D_4_7 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_7
ssh femu@node03 'rm -f /mnt/nvme2/D_4_7'
scp /home/femu/ecwide-ssd/test/chunks/D_4_7 femu@node03:/mnt/nvme2/D_4_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_1
ssh femu@node03 'rm -f /mnt/nvme5/L_4_1'
scp /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_7 on rack 3" >> placedway/update_log.txt

# Update block D_4_8 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_8
ssh femu@node03 'rm -f /mnt/nvme3/D_4_8'
scp /home/femu/ecwide-ssd/test/chunks/D_4_8 femu@node03:/mnt/nvme3/D_4_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_1
ssh femu@node03 'rm -f /mnt/nvme5/L_4_1'
scp /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_8 on rack 3" >> placedway/update_log.txt

# Update block D_4_9 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_9
ssh femu@node03 'rm -f /mnt/nvme4/D_4_9'
scp /home/femu/ecwide-ssd/test/chunks/D_4_9 femu@node03:/mnt/nvme4/D_4_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_1
ssh femu@node03 'rm -f /mnt/nvme5/L_4_1'
scp /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_9 on rack 3" >> placedway/update_log.txt

# Update block D_4_10 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_10
ssh femu@node05 'rm -f /mnt/nvme0/D_4_10'
scp /home/femu/ecwide-ssd/test/chunks/D_4_10 femu@node05:/mnt/nvme0/D_4_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_2
ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'
scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_10 on rack 5" >> placedway/update_log.txt

# Update block D_4_11 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_11
ssh femu@node05 'rm -f /mnt/nvme1/D_4_11'
scp /home/femu/ecwide-ssd/test/chunks/D_4_11 femu@node05:/mnt/nvme1/D_4_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_2
ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'
scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_11 on rack 5" >> placedway/update_log.txt

# Update block D_4_12 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_12
ssh femu@node05 'rm -f /mnt/nvme2/D_4_12'
scp /home/femu/ecwide-ssd/test/chunks/D_4_12 femu@node05:/mnt/nvme2/D_4_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_2
ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'
scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_12 on rack 5" >> placedway/update_log.txt

# Update block D_4_13 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_13
ssh femu@node05 'rm -f /mnt/nvme3/D_4_13'
scp /home/femu/ecwide-ssd/test/chunks/D_4_13 femu@node05:/mnt/nvme3/D_4_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_2
ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'
scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_13 on rack 5" >> placedway/update_log.txt

# Update block D_4_14 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_14
ssh femu@node05 'rm -f /mnt/nvme4/D_4_14'
scp /home/femu/ecwide-ssd/test/chunks/D_4_14 femu@node05:/mnt/nvme4/D_4_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_2
ssh femu@node05 'rm -f /mnt/nvme5/L_4_2'
scp /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_14 on rack 5" >> placedway/update_log.txt

# Update block D_4_15 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_15
ssh femu@node07 'rm -f /mnt/nvme0/D_4_15'
scp /home/femu/ecwide-ssd/test/chunks/D_4_15 femu@node07:/mnt/nvme0/D_4_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_3
ssh femu@node07 'rm -f /mnt/nvme5/L_4_3'
scp /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_15 on rack 7" >> placedway/update_log.txt

# Update block D_4_16 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_16
ssh femu@node07 'rm -f /mnt/nvme1/D_4_16'
scp /home/femu/ecwide-ssd/test/chunks/D_4_16 femu@node07:/mnt/nvme1/D_4_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_3
ssh femu@node07 'rm -f /mnt/nvme5/L_4_3'
scp /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_16 on rack 7" >> placedway/update_log.txt

# Update block D_4_17 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_17
ssh femu@node07 'rm -f /mnt/nvme2/D_4_17'
scp /home/femu/ecwide-ssd/test/chunks/D_4_17 femu@node07:/mnt/nvme2/D_4_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_3
ssh femu@node07 'rm -f /mnt/nvme5/L_4_3'
scp /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_17 on rack 7" >> placedway/update_log.txt

# Update block D_4_18 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_18
ssh femu@node07 'rm -f /mnt/nvme3/D_4_18'
scp /home/femu/ecwide-ssd/test/chunks/D_4_18 femu@node07:/mnt/nvme3/D_4_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_3
ssh femu@node07 'rm -f /mnt/nvme5/L_4_3'
scp /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_18 on rack 7" >> placedway/update_log.txt

# Update block D_4_19 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_4_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_4_19
ssh femu@node07 'rm -f /mnt/nvme4/D_4_19'
scp /home/femu/ecwide-ssd/test/chunks/D_4_19 femu@node07:/mnt/nvme4/D_4_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_4_3
ssh femu@node07 'rm -f /mnt/nvme5/L_4_3'
scp /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_0
ssh femu@node08 'rm -f /mnt/nvme0/G_4_0'
scp /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_4_1
ssh femu@node01 'rm -f /mnt/nvme1/G_4_1'
scp /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
sleep 0.01

echo "20250414024138 - Updated D_4_19 on rack 7" >> placedway/update_log.txt

# Update block D_5_0 (impacts R01, R02, R07)
echo '[$(date +%H:%M:%S)] Updating D_5_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_0
ssh femu@node01 'rm -f /mnt/nvme0/D_5_0'
scp /home/femu/ecwide-ssd/test/chunks/D_5_0 femu@node01:/mnt/nvme0/D_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_0
ssh femu@node02 'rm -f /mnt/nvme5/L_5_0'
scp /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_0 on rack 1" >> placedway/update_log.txt

# Update block D_5_1 (impacts R01, R02, R07)
echo '[$(date +%H:%M:%S)] Updating D_5_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_1
ssh femu@node01 'rm -f /mnt/nvme1/D_5_1'
scp /home/femu/ecwide-ssd/test/chunks/D_5_1 femu@node01:/mnt/nvme1/D_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_0
ssh femu@node02 'rm -f /mnt/nvme5/L_5_0'
scp /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_1 on rack 1" >> placedway/update_log.txt

# Update block D_5_2 (impacts R01, R02, R07)
echo '[$(date +%H:%M:%S)] Updating D_5_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_2
ssh femu@node01 'rm -f /mnt/nvme2/D_5_2'
scp /home/femu/ecwide-ssd/test/chunks/D_5_2 femu@node01:/mnt/nvme2/D_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_0
ssh femu@node02 'rm -f /mnt/nvme5/L_5_0'
scp /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_2 on rack 1" >> placedway/update_log.txt

# Update block D_5_3 (impacts R02, R07)
echo '[$(date +%H:%M:%S)] Updating D_5_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_3
ssh femu@node02 'rm -f /mnt/nvme3/D_5_3'
scp /home/femu/ecwide-ssd/test/chunks/D_5_3 femu@node02:/mnt/nvme3/D_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_0
ssh femu@node02 'rm -f /mnt/nvme5/L_5_0'
scp /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_3 on rack 2" >> placedway/update_log.txt

# Update block D_5_4 (impacts R02, R07)
echo '[$(date +%H:%M:%S)] Updating D_5_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_4
ssh femu@node02 'rm -f /mnt/nvme4/D_5_4'
scp /home/femu/ecwide-ssd/test/chunks/D_5_4 femu@node02:/mnt/nvme4/D_5_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_0
ssh femu@node02 'rm -f /mnt/nvme5/L_5_0'
scp /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_4 on rack 2" >> placedway/update_log.txt

# Update block D_5_5 (impacts R04, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_5
ssh femu@node04 'rm -f /mnt/nvme0/D_5_5'
scp /home/femu/ecwide-ssd/test/chunks/D_5_5 femu@node04:/mnt/nvme0/D_5_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_1
ssh femu@node04 'rm -f /mnt/nvme5/L_5_1'
scp /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_5 on rack 4" >> placedway/update_log.txt

# Update block D_5_6 (impacts R04, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_6
ssh femu@node04 'rm -f /mnt/nvme1/D_5_6'
scp /home/femu/ecwide-ssd/test/chunks/D_5_6 femu@node04:/mnt/nvme1/D_5_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_1
ssh femu@node04 'rm -f /mnt/nvme5/L_5_1'
scp /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_6 on rack 4" >> placedway/update_log.txt

# Update block D_5_7 (impacts R04, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_7
ssh femu@node04 'rm -f /mnt/nvme2/D_5_7'
scp /home/femu/ecwide-ssd/test/chunks/D_5_7 femu@node04:/mnt/nvme2/D_5_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_1
ssh femu@node04 'rm -f /mnt/nvme5/L_5_1'
scp /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_7 on rack 4" >> placedway/update_log.txt

# Update block D_5_8 (impacts R04, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_8
ssh femu@node04 'rm -f /mnt/nvme3/D_5_8'
scp /home/femu/ecwide-ssd/test/chunks/D_5_8 femu@node04:/mnt/nvme3/D_5_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_1
ssh femu@node04 'rm -f /mnt/nvme5/L_5_1'
scp /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_8 on rack 4" >> placedway/update_log.txt

# Update block D_5_9 (impacts R04, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_9
ssh femu@node04 'rm -f /mnt/nvme4/D_5_9'
scp /home/femu/ecwide-ssd/test/chunks/D_5_9 femu@node04:/mnt/nvme4/D_5_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_1
ssh femu@node04 'rm -f /mnt/nvme5/L_5_1'
scp /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_9 on rack 4" >> placedway/update_log.txt

# Update block D_5_10 (impacts R06, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_10
ssh femu@node06 'rm -f /mnt/nvme0/D_5_10'
scp /home/femu/ecwide-ssd/test/chunks/D_5_10 femu@node06:/mnt/nvme0/D_5_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_2
ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'
scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_10 on rack 6" >> placedway/update_log.txt

# Update block D_5_11 (impacts R06, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_11
ssh femu@node06 'rm -f /mnt/nvme1/D_5_11'
scp /home/femu/ecwide-ssd/test/chunks/D_5_11 femu@node06:/mnt/nvme1/D_5_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_2
ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'
scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_11 on rack 6" >> placedway/update_log.txt

# Update block D_5_12 (impacts R06, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_12
ssh femu@node06 'rm -f /mnt/nvme2/D_5_12'
scp /home/femu/ecwide-ssd/test/chunks/D_5_12 femu@node06:/mnt/nvme2/D_5_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_2
ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'
scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_12 on rack 6" >> placedway/update_log.txt

# Update block D_5_13 (impacts R06, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_13
ssh femu@node06 'rm -f /mnt/nvme3/D_5_13'
scp /home/femu/ecwide-ssd/test/chunks/D_5_13 femu@node06:/mnt/nvme3/D_5_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_2
ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'
scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_13 on rack 6" >> placedway/update_log.txt

# Update block D_5_14 (impacts R06, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_14
ssh femu@node06 'rm -f /mnt/nvme4/D_5_14'
scp /home/femu/ecwide-ssd/test/chunks/D_5_14 femu@node06:/mnt/nvme4/D_5_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_2
ssh femu@node06 'rm -f /mnt/nvme5/L_5_2'
scp /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_14 on rack 6" >> placedway/update_log.txt

# Update block D_5_15 (impacts R08, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_15
ssh femu@node08 'rm -f /mnt/nvme0/D_5_15'
scp /home/femu/ecwide-ssd/test/chunks/D_5_15 femu@node08:/mnt/nvme0/D_5_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_3
ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'
scp /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_15 on rack 8" >> placedway/update_log.txt

# Update block D_5_16 (impacts R08, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_16
ssh femu@node08 'rm -f /mnt/nvme1/D_5_16'
scp /home/femu/ecwide-ssd/test/chunks/D_5_16 femu@node08:/mnt/nvme1/D_5_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_3
ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'
scp /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_16 on rack 8" >> placedway/update_log.txt

# Update block D_5_17 (impacts R08, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_17
ssh femu@node08 'rm -f /mnt/nvme2/D_5_17'
scp /home/femu/ecwide-ssd/test/chunks/D_5_17 femu@node08:/mnt/nvme2/D_5_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_3
ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'
scp /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_17 on rack 8" >> placedway/update_log.txt

# Update block D_5_18 (impacts R08, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_18
ssh femu@node08 'rm -f /mnt/nvme3/D_5_18'
scp /home/femu/ecwide-ssd/test/chunks/D_5_18 femu@node08:/mnt/nvme3/D_5_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_3
ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'
scp /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_18 on rack 8" >> placedway/update_log.txt

# Update block D_5_19 (impacts R08, R07, R02)
echo '[$(date +%H:%M:%S)] Updating D_5_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_5_19
ssh femu@node08 'rm -f /mnt/nvme4/D_5_19'
scp /home/femu/ecwide-ssd/test/chunks/D_5_19 femu@node08:/mnt/nvme4/D_5_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_5_3
ssh femu@node08 'rm -f /mnt/nvme5/L_5_3'
scp /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_0
ssh femu@node07 'rm -f /mnt/nvme4/G_5_0'
scp /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_5_1
ssh femu@node02 'rm -f /mnt/nvme2/G_5_1'
scp /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1
sleep 0.01

echo "20250414024138 - Updated D_5_19 on rack 8" >> placedway/update_log.txt

# Update block D_6_0 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_0
ssh femu@node02 'rm -f /mnt/nvme0/D_6_0'
scp /home/femu/ecwide-ssd/test/chunks/D_6_0 femu@node02:/mnt/nvme0/D_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_0
ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'
scp /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_0 on rack 2" >> placedway/update_log.txt

# Update block D_6_1 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_1
ssh femu@node02 'rm -f /mnt/nvme1/D_6_1'
scp /home/femu/ecwide-ssd/test/chunks/D_6_1 femu@node02:/mnt/nvme1/D_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_0
ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'
scp /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_1 on rack 2" >> placedway/update_log.txt

# Update block D_6_2 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_2
ssh femu@node02 'rm -f /mnt/nvme2/D_6_2'
scp /home/femu/ecwide-ssd/test/chunks/D_6_2 femu@node02:/mnt/nvme2/D_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_0
ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'
scp /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_2 on rack 2" >> placedway/update_log.txt

# Update block D_6_3 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_3
ssh femu@node01 'rm -f /mnt/nvme3/D_6_3'
scp /home/femu/ecwide-ssd/test/chunks/D_6_3 femu@node01:/mnt/nvme3/D_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_0
ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'
scp /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_3 on rack 1" >> placedway/update_log.txt

# Update block D_6_4 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_4
ssh femu@node01 'rm -f /mnt/nvme4/D_6_4'
scp /home/femu/ecwide-ssd/test/chunks/D_6_4 femu@node01:/mnt/nvme4/D_6_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_0
ssh femu@node01 'rm -f /mnt/nvme5/L_6_0'
scp /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_4 on rack 1" >> placedway/update_log.txt

# Update block D_6_5 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_5
ssh femu@node03 'rm -f /mnt/nvme0/D_6_5'
scp /home/femu/ecwide-ssd/test/chunks/D_6_5 femu@node03:/mnt/nvme0/D_6_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_1
ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'
scp /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_5 on rack 3" >> placedway/update_log.txt

# Update block D_6_6 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_6
ssh femu@node03 'rm -f /mnt/nvme1/D_6_6'
scp /home/femu/ecwide-ssd/test/chunks/D_6_6 femu@node03:/mnt/nvme1/D_6_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_1
ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'
scp /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_6 on rack 3" >> placedway/update_log.txt

# Update block D_6_7 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_7
ssh femu@node03 'rm -f /mnt/nvme2/D_6_7'
scp /home/femu/ecwide-ssd/test/chunks/D_6_7 femu@node03:/mnt/nvme2/D_6_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_1
ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'
scp /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_7 on rack 3" >> placedway/update_log.txt

# Update block D_6_8 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_8
ssh femu@node03 'rm -f /mnt/nvme3/D_6_8'
scp /home/femu/ecwide-ssd/test/chunks/D_6_8 femu@node03:/mnt/nvme3/D_6_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_1
ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'
scp /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_8 on rack 3" >> placedway/update_log.txt

# Update block D_6_9 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_9
ssh femu@node03 'rm -f /mnt/nvme4/D_6_9'
scp /home/femu/ecwide-ssd/test/chunks/D_6_9 femu@node03:/mnt/nvme4/D_6_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_1
ssh femu@node03 'rm -f /mnt/nvme5/L_6_1'
scp /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_9 on rack 3" >> placedway/update_log.txt

# Update block D_6_10 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_10
ssh femu@node05 'rm -f /mnt/nvme0/D_6_10'
scp /home/femu/ecwide-ssd/test/chunks/D_6_10 femu@node05:/mnt/nvme0/D_6_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_2
ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'
scp /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_10 on rack 5" >> placedway/update_log.txt

# Update block D_6_11 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_11
ssh femu@node05 'rm -f /mnt/nvme1/D_6_11'
scp /home/femu/ecwide-ssd/test/chunks/D_6_11 femu@node05:/mnt/nvme1/D_6_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_2
ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'
scp /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_11 on rack 5" >> placedway/update_log.txt

# Update block D_6_12 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_12
ssh femu@node05 'rm -f /mnt/nvme2/D_6_12'
scp /home/femu/ecwide-ssd/test/chunks/D_6_12 femu@node05:/mnt/nvme2/D_6_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_2
ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'
scp /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_12 on rack 5" >> placedway/update_log.txt

# Update block D_6_13 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_13
ssh femu@node05 'rm -f /mnt/nvme3/D_6_13'
scp /home/femu/ecwide-ssd/test/chunks/D_6_13 femu@node05:/mnt/nvme3/D_6_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_2
ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'
scp /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_13 on rack 5" >> placedway/update_log.txt

# Update block D_6_14 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_14
ssh femu@node05 'rm -f /mnt/nvme4/D_6_14'
scp /home/femu/ecwide-ssd/test/chunks/D_6_14 femu@node05:/mnt/nvme4/D_6_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_2
ssh femu@node05 'rm -f /mnt/nvme5/L_6_2'
scp /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_14 on rack 5" >> placedway/update_log.txt

# Update block D_6_15 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_15
ssh femu@node07 'rm -f /mnt/nvme0/D_6_15'
scp /home/femu/ecwide-ssd/test/chunks/D_6_15 femu@node07:/mnt/nvme0/D_6_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_3
ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'
scp /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_15 on rack 7" >> placedway/update_log.txt

# Update block D_6_16 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_16
ssh femu@node07 'rm -f /mnt/nvme1/D_6_16'
scp /home/femu/ecwide-ssd/test/chunks/D_6_16 femu@node07:/mnt/nvme1/D_6_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_3
ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'
scp /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_16 on rack 7" >> placedway/update_log.txt

# Update block D_6_17 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_17
ssh femu@node07 'rm -f /mnt/nvme2/D_6_17'
scp /home/femu/ecwide-ssd/test/chunks/D_6_17 femu@node07:/mnt/nvme2/D_6_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_3
ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'
scp /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_17 on rack 7" >> placedway/update_log.txt

# Update block D_6_18 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_18
ssh femu@node07 'rm -f /mnt/nvme3/D_6_18'
scp /home/femu/ecwide-ssd/test/chunks/D_6_18 femu@node07:/mnt/nvme3/D_6_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_3
ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'
scp /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_18 on rack 7" >> placedway/update_log.txt

# Update block D_6_19 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_6_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_6_19
ssh femu@node07 'rm -f /mnt/nvme4/D_6_19'
scp /home/femu/ecwide-ssd/test/chunks/D_6_19 femu@node07:/mnt/nvme4/D_6_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_6_3
ssh femu@node07 'rm -f /mnt/nvme5/L_6_3'
scp /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_0
ssh femu@node04 'rm -f /mnt/nvme0/G_6_0'
scp /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_6_1
ssh femu@node06 'rm -f /mnt/nvme1/G_6_1'
scp /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
sleep 0.01

echo "20250414024138 - Updated D_6_19 on rack 7" >> placedway/update_log.txt

# Update block D_7_0 (impacts R01, R02, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_0
ssh femu@node01 'rm -f /mnt/nvme0/D_7_0'
scp /home/femu/ecwide-ssd/test/chunks/D_7_0 femu@node01:/mnt/nvme0/D_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_0
ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'
scp /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_0 on rack 1" >> placedway/update_log.txt

# Update block D_7_1 (impacts R01, R02, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_1
ssh femu@node01 'rm -f /mnt/nvme1/D_7_1'
scp /home/femu/ecwide-ssd/test/chunks/D_7_1 femu@node01:/mnt/nvme1/D_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_0
ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'
scp /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_1 on rack 1" >> placedway/update_log.txt

# Update block D_7_2 (impacts R01, R02, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_2
ssh femu@node01 'rm -f /mnt/nvme2/D_7_2'
scp /home/femu/ecwide-ssd/test/chunks/D_7_2 femu@node01:/mnt/nvme2/D_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_0
ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'
scp /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_2 on rack 1" >> placedway/update_log.txt

# Update block D_7_3 (impacts R02, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_3
ssh femu@node02 'rm -f /mnt/nvme3/D_7_3'
scp /home/femu/ecwide-ssd/test/chunks/D_7_3 femu@node02:/mnt/nvme3/D_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_0
ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'
scp /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_3 on rack 2" >> placedway/update_log.txt

# Update block D_7_4 (impacts R02, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_4
ssh femu@node02 'rm -f /mnt/nvme4/D_7_4'
scp /home/femu/ecwide-ssd/test/chunks/D_7_4 femu@node02:/mnt/nvme4/D_7_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_0
ssh femu@node02 'rm -f /mnt/nvme5/L_7_0'
scp /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_4 on rack 2" >> placedway/update_log.txt

# Update block D_7_5 (impacts R04, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_5
ssh femu@node04 'rm -f /mnt/nvme0/D_7_5'
scp /home/femu/ecwide-ssd/test/chunks/D_7_5 femu@node04:/mnt/nvme0/D_7_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_1
ssh femu@node04 'rm -f /mnt/nvme5/L_7_1'
scp /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_5 on rack 4" >> placedway/update_log.txt

# Update block D_7_6 (impacts R04, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_6
ssh femu@node04 'rm -f /mnt/nvme1/D_7_6'
scp /home/femu/ecwide-ssd/test/chunks/D_7_6 femu@node04:/mnt/nvme1/D_7_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_1
ssh femu@node04 'rm -f /mnt/nvme5/L_7_1'
scp /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_6 on rack 4" >> placedway/update_log.txt

# Update block D_7_7 (impacts R04, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_7
ssh femu@node04 'rm -f /mnt/nvme2/D_7_7'
scp /home/femu/ecwide-ssd/test/chunks/D_7_7 femu@node04:/mnt/nvme2/D_7_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_1
ssh femu@node04 'rm -f /mnt/nvme5/L_7_1'
scp /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_7 on rack 4" >> placedway/update_log.txt

# Update block D_7_8 (impacts R04, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_8
ssh femu@node04 'rm -f /mnt/nvme3/D_7_8'
scp /home/femu/ecwide-ssd/test/chunks/D_7_8 femu@node04:/mnt/nvme3/D_7_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_1
ssh femu@node04 'rm -f /mnt/nvme5/L_7_1'
scp /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_8 on rack 4" >> placedway/update_log.txt

# Update block D_7_9 (impacts R04, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_9
ssh femu@node04 'rm -f /mnt/nvme4/D_7_9'
scp /home/femu/ecwide-ssd/test/chunks/D_7_9 femu@node04:/mnt/nvme4/D_7_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_1
ssh femu@node04 'rm -f /mnt/nvme5/L_7_1'
scp /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_9 on rack 4" >> placedway/update_log.txt

# Update block D_7_10 (impacts R06, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_10
ssh femu@node06 'rm -f /mnt/nvme0/D_7_10'
scp /home/femu/ecwide-ssd/test/chunks/D_7_10 femu@node06:/mnt/nvme0/D_7_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_2
ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'
scp /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_10 on rack 6" >> placedway/update_log.txt

# Update block D_7_11 (impacts R06, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_11
ssh femu@node06 'rm -f /mnt/nvme1/D_7_11'
scp /home/femu/ecwide-ssd/test/chunks/D_7_11 femu@node06:/mnt/nvme1/D_7_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_2
ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'
scp /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_11 on rack 6" >> placedway/update_log.txt

# Update block D_7_12 (impacts R06, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_12
ssh femu@node06 'rm -f /mnt/nvme2/D_7_12'
scp /home/femu/ecwide-ssd/test/chunks/D_7_12 femu@node06:/mnt/nvme2/D_7_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_2
ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'
scp /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_12 on rack 6" >> placedway/update_log.txt

# Update block D_7_13 (impacts R06, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_13
ssh femu@node06 'rm -f /mnt/nvme3/D_7_13'
scp /home/femu/ecwide-ssd/test/chunks/D_7_13 femu@node06:/mnt/nvme3/D_7_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_2
ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'
scp /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_13 on rack 6" >> placedway/update_log.txt

# Update block D_7_14 (impacts R06, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_14
ssh femu@node06 'rm -f /mnt/nvme4/D_7_14'
scp /home/femu/ecwide-ssd/test/chunks/D_7_14 femu@node06:/mnt/nvme4/D_7_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_2
ssh femu@node06 'rm -f /mnt/nvme5/L_7_2'
scp /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_14 on rack 6" >> placedway/update_log.txt

# Update block D_7_15 (impacts R08, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_15
ssh femu@node08 'rm -f /mnt/nvme0/D_7_15'
scp /home/femu/ecwide-ssd/test/chunks/D_7_15 femu@node08:/mnt/nvme0/D_7_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_3
ssh femu@node08 'rm -f /mnt/nvme5/L_7_3'
scp /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_15 on rack 8" >> placedway/update_log.txt

# Update block D_7_16 (impacts R08, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_16
ssh femu@node08 'rm -f /mnt/nvme1/D_7_16'
scp /home/femu/ecwide-ssd/test/chunks/D_7_16 femu@node08:/mnt/nvme1/D_7_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_3
ssh femu@node08 'rm -f /mnt/nvme5/L_7_3'
scp /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_16 on rack 8" >> placedway/update_log.txt

# Update block D_7_17 (impacts R08, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_17
ssh femu@node08 'rm -f /mnt/nvme2/D_7_17'
scp /home/femu/ecwide-ssd/test/chunks/D_7_17 femu@node08:/mnt/nvme2/D_7_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_3
ssh femu@node08 'rm -f /mnt/nvme5/L_7_3'
scp /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_17 on rack 8" >> placedway/update_log.txt

# Update block D_7_18 (impacts R08, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_18
ssh femu@node08 'rm -f /mnt/nvme3/D_7_18'
scp /home/femu/ecwide-ssd/test/chunks/D_7_18 femu@node08:/mnt/nvme3/D_7_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_3
ssh femu@node08 'rm -f /mnt/nvme5/L_7_3'
scp /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_18 on rack 8" >> placedway/update_log.txt

# Update block D_7_19 (impacts R08, R03, R05)
echo '[$(date +%H:%M:%S)] Updating D_7_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_7_19
ssh femu@node08 'rm -f /mnt/nvme4/D_7_19'
scp /home/femu/ecwide-ssd/test/chunks/D_7_19 femu@node08:/mnt/nvme4/D_7_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_7_3
ssh femu@node08 'rm -f /mnt/nvme5/L_7_3'
scp /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_0
ssh femu@node03 'rm -f /mnt/nvme3/G_7_0'
scp /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_7_1
ssh femu@node05 'rm -f /mnt/nvme4/G_7_1'
scp /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
sleep 0.01

echo "20250414024138 - Updated D_7_19 on rack 8" >> placedway/update_log.txt

# Update block D_8_0 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_8_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_0
ssh femu@node02 'rm -f /mnt/nvme0/D_8_0'
scp /home/femu/ecwide-ssd/test/chunks/D_8_0 femu@node02:/mnt/nvme0/D_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_0
ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'
scp /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_0 on rack 2" >> placedway/update_log.txt

# Update block D_8_1 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_8_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_1
ssh femu@node02 'rm -f /mnt/nvme1/D_8_1'
scp /home/femu/ecwide-ssd/test/chunks/D_8_1 femu@node02:/mnt/nvme1/D_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_0
ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'
scp /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_1 on rack 2" >> placedway/update_log.txt

# Update block D_8_2 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_8_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_2
ssh femu@node02 'rm -f /mnt/nvme2/D_8_2'
scp /home/femu/ecwide-ssd/test/chunks/D_8_2 femu@node02:/mnt/nvme2/D_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_0
ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'
scp /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_2 on rack 2" >> placedway/update_log.txt

# Update block D_8_3 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_8_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_3
ssh femu@node01 'rm -f /mnt/nvme3/D_8_3'
scp /home/femu/ecwide-ssd/test/chunks/D_8_3 femu@node01:/mnt/nvme3/D_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_0
ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'
scp /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_3 on rack 1" >> placedway/update_log.txt

# Update block D_8_4 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_8_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_4
ssh femu@node01 'rm -f /mnt/nvme4/D_8_4'
scp /home/femu/ecwide-ssd/test/chunks/D_8_4 femu@node01:/mnt/nvme4/D_8_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_0
ssh femu@node01 'rm -f /mnt/nvme5/L_8_0'
scp /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_4 on rack 1" >> placedway/update_log.txt

# Update block D_8_5 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_5
ssh femu@node03 'rm -f /mnt/nvme0/D_8_5'
scp /home/femu/ecwide-ssd/test/chunks/D_8_5 femu@node03:/mnt/nvme0/D_8_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_1
ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'
scp /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_5 on rack 3" >> placedway/update_log.txt

# Update block D_8_6 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_6
ssh femu@node03 'rm -f /mnt/nvme1/D_8_6'
scp /home/femu/ecwide-ssd/test/chunks/D_8_6 femu@node03:/mnt/nvme1/D_8_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_1
ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'
scp /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_6 on rack 3" >> placedway/update_log.txt

# Update block D_8_7 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_7
ssh femu@node03 'rm -f /mnt/nvme2/D_8_7'
scp /home/femu/ecwide-ssd/test/chunks/D_8_7 femu@node03:/mnt/nvme2/D_8_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_1
ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'
scp /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_7 on rack 3" >> placedway/update_log.txt

# Update block D_8_8 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_8
ssh femu@node03 'rm -f /mnt/nvme3/D_8_8'
scp /home/femu/ecwide-ssd/test/chunks/D_8_8 femu@node03:/mnt/nvme3/D_8_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_1
ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'
scp /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_8 on rack 3" >> placedway/update_log.txt

# Update block D_8_9 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_9
ssh femu@node03 'rm -f /mnt/nvme4/D_8_9'
scp /home/femu/ecwide-ssd/test/chunks/D_8_9 femu@node03:/mnt/nvme4/D_8_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_1
ssh femu@node03 'rm -f /mnt/nvme5/L_8_1'
scp /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_9 on rack 3" >> placedway/update_log.txt

# Update block D_8_10 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_10
ssh femu@node05 'rm -f /mnt/nvme0/D_8_10'
scp /home/femu/ecwide-ssd/test/chunks/D_8_10 femu@node05:/mnt/nvme0/D_8_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_2
ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'
scp /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_10 on rack 5" >> placedway/update_log.txt

# Update block D_8_11 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_11
ssh femu@node05 'rm -f /mnt/nvme1/D_8_11'
scp /home/femu/ecwide-ssd/test/chunks/D_8_11 femu@node05:/mnt/nvme1/D_8_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_2
ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'
scp /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_11 on rack 5" >> placedway/update_log.txt

# Update block D_8_12 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_12
ssh femu@node05 'rm -f /mnt/nvme2/D_8_12'
scp /home/femu/ecwide-ssd/test/chunks/D_8_12 femu@node05:/mnt/nvme2/D_8_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_2
ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'
scp /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_12 on rack 5" >> placedway/update_log.txt

# Update block D_8_13 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_13
ssh femu@node05 'rm -f /mnt/nvme3/D_8_13'
scp /home/femu/ecwide-ssd/test/chunks/D_8_13 femu@node05:/mnt/nvme3/D_8_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_2
ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'
scp /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_13 on rack 5" >> placedway/update_log.txt

# Update block D_8_14 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_14
ssh femu@node05 'rm -f /mnt/nvme4/D_8_14'
scp /home/femu/ecwide-ssd/test/chunks/D_8_14 femu@node05:/mnt/nvme4/D_8_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_2
ssh femu@node05 'rm -f /mnt/nvme5/L_8_2'
scp /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_14 on rack 5" >> placedway/update_log.txt

# Update block D_8_15 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_15
ssh femu@node07 'rm -f /mnt/nvme0/D_8_15'
scp /home/femu/ecwide-ssd/test/chunks/D_8_15 femu@node07:/mnt/nvme0/D_8_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_3
ssh femu@node07 'rm -f /mnt/nvme5/L_8_3'
scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_15 on rack 7" >> placedway/update_log.txt

# Update block D_8_16 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_16
ssh femu@node07 'rm -f /mnt/nvme1/D_8_16'
scp /home/femu/ecwide-ssd/test/chunks/D_8_16 femu@node07:/mnt/nvme1/D_8_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_3
ssh femu@node07 'rm -f /mnt/nvme5/L_8_3'
scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_16 on rack 7" >> placedway/update_log.txt

# Update block D_8_17 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_17
ssh femu@node07 'rm -f /mnt/nvme2/D_8_17'
scp /home/femu/ecwide-ssd/test/chunks/D_8_17 femu@node07:/mnt/nvme2/D_8_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_3
ssh femu@node07 'rm -f /mnt/nvme5/L_8_3'
scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_17 on rack 7" >> placedway/update_log.txt

# Update block D_8_18 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_18
ssh femu@node07 'rm -f /mnt/nvme3/D_8_18'
scp /home/femu/ecwide-ssd/test/chunks/D_8_18 femu@node07:/mnt/nvme3/D_8_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_3
ssh femu@node07 'rm -f /mnt/nvme5/L_8_3'
scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_18 on rack 7" >> placedway/update_log.txt

# Update block D_8_19 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_8_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_8_19
ssh femu@node07 'rm -f /mnt/nvme4/D_8_19'
scp /home/femu/ecwide-ssd/test/chunks/D_8_19 femu@node07:/mnt/nvme4/D_8_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_8_3
ssh femu@node07 'rm -f /mnt/nvme5/L_8_3'
scp /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_0
ssh femu@node08 'rm -f /mnt/nvme2/G_8_0'
scp /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_8_1
ssh femu@node01 'rm -f /mnt/nvme0/G_8_1'
scp /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
sleep 0.01

echo "20250414024138 - Updated D_8_19 on rack 7" >> placedway/update_log.txt

# Update block D_9_0 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_0
ssh femu@node01 'rm -f /mnt/nvme0/D_9_0'
scp /home/femu/ecwide-ssd/test/chunks/D_9_0 femu@node01:/mnt/nvme0/D_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_0
ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'
scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_0 on rack 1" >> placedway/update_log.txt

# Update block D_9_1 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_1
ssh femu@node01 'rm -f /mnt/nvme1/D_9_1'
scp /home/femu/ecwide-ssd/test/chunks/D_9_1 femu@node01:/mnt/nvme1/D_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_0
ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'
scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_1 on rack 1" >> placedway/update_log.txt

# Update block D_9_2 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_2
ssh femu@node01 'rm -f /mnt/nvme2/D_9_2'
scp /home/femu/ecwide-ssd/test/chunks/D_9_2 femu@node01:/mnt/nvme2/D_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_0
ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'
scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_2 on rack 1" >> placedway/update_log.txt

# Update block D_9_3 (impacts R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_3
ssh femu@node02 'rm -f /mnt/nvme3/D_9_3'
scp /home/femu/ecwide-ssd/test/chunks/D_9_3 femu@node02:/mnt/nvme3/D_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_0
ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'
scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_3 on rack 2" >> placedway/update_log.txt

# Update block D_9_4 (impacts R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_4
ssh femu@node02 'rm -f /mnt/nvme4/D_9_4'
scp /home/femu/ecwide-ssd/test/chunks/D_9_4 femu@node02:/mnt/nvme4/D_9_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_0
ssh femu@node02 'rm -f /mnt/nvme5/L_9_0'
scp /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_4 on rack 2" >> placedway/update_log.txt

# Update block D_9_5 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_5
ssh femu@node04 'rm -f /mnt/nvme0/D_9_5'
scp /home/femu/ecwide-ssd/test/chunks/D_9_5 femu@node04:/mnt/nvme0/D_9_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_1
ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'
scp /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_5 on rack 4" >> placedway/update_log.txt

# Update block D_9_6 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_6
ssh femu@node04 'rm -f /mnt/nvme1/D_9_6'
scp /home/femu/ecwide-ssd/test/chunks/D_9_6 femu@node04:/mnt/nvme1/D_9_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_1
ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'
scp /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_6 on rack 4" >> placedway/update_log.txt

# Update block D_9_7 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_7
ssh femu@node04 'rm -f /mnt/nvme2/D_9_7'
scp /home/femu/ecwide-ssd/test/chunks/D_9_7 femu@node04:/mnt/nvme2/D_9_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_1
ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'
scp /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_7 on rack 4" >> placedway/update_log.txt

# Update block D_9_8 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_8
ssh femu@node04 'rm -f /mnt/nvme3/D_9_8'
scp /home/femu/ecwide-ssd/test/chunks/D_9_8 femu@node04:/mnt/nvme3/D_9_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_1
ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'
scp /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_8 on rack 4" >> placedway/update_log.txt

# Update block D_9_9 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_9
ssh femu@node04 'rm -f /mnt/nvme4/D_9_9'
scp /home/femu/ecwide-ssd/test/chunks/D_9_9 femu@node04:/mnt/nvme4/D_9_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_1
ssh femu@node04 'rm -f /mnt/nvme5/L_9_1'
scp /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_9 on rack 4" >> placedway/update_log.txt

# Update block D_9_10 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_10
ssh femu@node06 'rm -f /mnt/nvme0/D_9_10'
scp /home/femu/ecwide-ssd/test/chunks/D_9_10 femu@node06:/mnt/nvme0/D_9_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_2
ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'
scp /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_10 on rack 6" >> placedway/update_log.txt

# Update block D_9_11 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_11
ssh femu@node06 'rm -f /mnt/nvme1/D_9_11'
scp /home/femu/ecwide-ssd/test/chunks/D_9_11 femu@node06:/mnt/nvme1/D_9_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_2
ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'
scp /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_11 on rack 6" >> placedway/update_log.txt

# Update block D_9_12 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_12
ssh femu@node06 'rm -f /mnt/nvme2/D_9_12'
scp /home/femu/ecwide-ssd/test/chunks/D_9_12 femu@node06:/mnt/nvme2/D_9_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_2
ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'
scp /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_12 on rack 6" >> placedway/update_log.txt

# Update block D_9_13 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_13
ssh femu@node06 'rm -f /mnt/nvme3/D_9_13'
scp /home/femu/ecwide-ssd/test/chunks/D_9_13 femu@node06:/mnt/nvme3/D_9_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_2
ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'
scp /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_13 on rack 6" >> placedway/update_log.txt

# Update block D_9_14 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_14
ssh femu@node06 'rm -f /mnt/nvme4/D_9_14'
scp /home/femu/ecwide-ssd/test/chunks/D_9_14 femu@node06:/mnt/nvme4/D_9_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_2
ssh femu@node06 'rm -f /mnt/nvme5/L_9_2'
scp /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_14 on rack 6" >> placedway/update_log.txt

# Update block D_9_15 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_15
ssh femu@node08 'rm -f /mnt/nvme0/D_9_15'
scp /home/femu/ecwide-ssd/test/chunks/D_9_15 femu@node08:/mnt/nvme0/D_9_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_3
ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'
scp /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_15 on rack 8" >> placedway/update_log.txt

# Update block D_9_16 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_16
ssh femu@node08 'rm -f /mnt/nvme1/D_9_16'
scp /home/femu/ecwide-ssd/test/chunks/D_9_16 femu@node08:/mnt/nvme1/D_9_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_3
ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'
scp /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_16 on rack 8" >> placedway/update_log.txt

# Update block D_9_17 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_17
ssh femu@node08 'rm -f /mnt/nvme2/D_9_17'
scp /home/femu/ecwide-ssd/test/chunks/D_9_17 femu@node08:/mnt/nvme2/D_9_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_3
ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'
scp /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_17 on rack 8" >> placedway/update_log.txt

# Update block D_9_18 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_18
ssh femu@node08 'rm -f /mnt/nvme3/D_9_18'
scp /home/femu/ecwide-ssd/test/chunks/D_9_18 femu@node08:/mnt/nvme3/D_9_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_3
ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'
scp /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_18 on rack 8" >> placedway/update_log.txt

# Update block D_9_19 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_9_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_9_19
ssh femu@node08 'rm -f /mnt/nvme4/D_9_19'
scp /home/femu/ecwide-ssd/test/chunks/D_9_19 femu@node08:/mnt/nvme4/D_9_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_9_3
ssh femu@node08 'rm -f /mnt/nvme5/L_9_3'
scp /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_0
ssh femu@node07 'rm -f /mnt/nvme3/G_9_0'
scp /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_9_1
ssh femu@node03 'rm -f /mnt/nvme4/G_9_1'
scp /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
sleep 0.01

echo "20250414024138 - Updated D_9_19 on rack 8" >> placedway/update_log.txt

# Update block D_10_0 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_0
ssh femu@node02 'rm -f /mnt/nvme0/D_10_0'
scp /home/femu/ecwide-ssd/test/chunks/D_10_0 femu@node02:/mnt/nvme0/D_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_0
ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'
scp /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_0 on rack 2" >> placedway/update_log.txt

# Update block D_10_1 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_1
ssh femu@node02 'rm -f /mnt/nvme1/D_10_1'
scp /home/femu/ecwide-ssd/test/chunks/D_10_1 femu@node02:/mnt/nvme1/D_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_0
ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'
scp /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_1 on rack 2" >> placedway/update_log.txt

# Update block D_10_2 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_2
ssh femu@node02 'rm -f /mnt/nvme2/D_10_2'
scp /home/femu/ecwide-ssd/test/chunks/D_10_2 femu@node02:/mnt/nvme2/D_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_0
ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'
scp /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_2 on rack 2" >> placedway/update_log.txt

# Update block D_10_3 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_3
ssh femu@node01 'rm -f /mnt/nvme3/D_10_3'
scp /home/femu/ecwide-ssd/test/chunks/D_10_3 femu@node01:/mnt/nvme3/D_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_0
ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'
scp /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_3 on rack 1" >> placedway/update_log.txt

# Update block D_10_4 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_4
ssh femu@node01 'rm -f /mnt/nvme4/D_10_4'
scp /home/femu/ecwide-ssd/test/chunks/D_10_4 femu@node01:/mnt/nvme4/D_10_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_0
ssh femu@node01 'rm -f /mnt/nvme5/L_10_0'
scp /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_4 on rack 1" >> placedway/update_log.txt

# Update block D_10_5 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_5
ssh femu@node03 'rm -f /mnt/nvme0/D_10_5'
scp /home/femu/ecwide-ssd/test/chunks/D_10_5 femu@node03:/mnt/nvme0/D_10_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_1
ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'
scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_5 on rack 3" >> placedway/update_log.txt

# Update block D_10_6 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_6
ssh femu@node03 'rm -f /mnt/nvme1/D_10_6'
scp /home/femu/ecwide-ssd/test/chunks/D_10_6 femu@node03:/mnt/nvme1/D_10_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_1
ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'
scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_6 on rack 3" >> placedway/update_log.txt

# Update block D_10_7 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_7
ssh femu@node03 'rm -f /mnt/nvme2/D_10_7'
scp /home/femu/ecwide-ssd/test/chunks/D_10_7 femu@node03:/mnt/nvme2/D_10_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_1
ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'
scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_7 on rack 3" >> placedway/update_log.txt

# Update block D_10_8 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_8
ssh femu@node03 'rm -f /mnt/nvme3/D_10_8'
scp /home/femu/ecwide-ssd/test/chunks/D_10_8 femu@node03:/mnt/nvme3/D_10_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_1
ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'
scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_8 on rack 3" >> placedway/update_log.txt

# Update block D_10_9 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_9
ssh femu@node03 'rm -f /mnt/nvme4/D_10_9'
scp /home/femu/ecwide-ssd/test/chunks/D_10_9 femu@node03:/mnt/nvme4/D_10_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_1
ssh femu@node03 'rm -f /mnt/nvme5/L_10_1'
scp /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_9 on rack 3" >> placedway/update_log.txt

# Update block D_10_10 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_10
ssh femu@node05 'rm -f /mnt/nvme0/D_10_10'
scp /home/femu/ecwide-ssd/test/chunks/D_10_10 femu@node05:/mnt/nvme0/D_10_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_2
ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'
scp /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_10 on rack 5" >> placedway/update_log.txt

# Update block D_10_11 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_11
ssh femu@node05 'rm -f /mnt/nvme1/D_10_11'
scp /home/femu/ecwide-ssd/test/chunks/D_10_11 femu@node05:/mnt/nvme1/D_10_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_2
ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'
scp /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_11 on rack 5" >> placedway/update_log.txt

# Update block D_10_12 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_12
ssh femu@node05 'rm -f /mnt/nvme2/D_10_12'
scp /home/femu/ecwide-ssd/test/chunks/D_10_12 femu@node05:/mnt/nvme2/D_10_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_2
ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'
scp /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_12 on rack 5" >> placedway/update_log.txt

# Update block D_10_13 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_13
ssh femu@node05 'rm -f /mnt/nvme3/D_10_13'
scp /home/femu/ecwide-ssd/test/chunks/D_10_13 femu@node05:/mnt/nvme3/D_10_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_2
ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'
scp /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_13 on rack 5" >> placedway/update_log.txt

# Update block D_10_14 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_14
ssh femu@node05 'rm -f /mnt/nvme4/D_10_14'
scp /home/femu/ecwide-ssd/test/chunks/D_10_14 femu@node05:/mnt/nvme4/D_10_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_2
ssh femu@node05 'rm -f /mnt/nvme5/L_10_2'
scp /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_14 on rack 5" >> placedway/update_log.txt

# Update block D_10_15 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_15
ssh femu@node07 'rm -f /mnt/nvme0/D_10_15'
scp /home/femu/ecwide-ssd/test/chunks/D_10_15 femu@node07:/mnt/nvme0/D_10_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_3
ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'
scp /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_15 on rack 7" >> placedway/update_log.txt

# Update block D_10_16 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_16
ssh femu@node07 'rm -f /mnt/nvme1/D_10_16'
scp /home/femu/ecwide-ssd/test/chunks/D_10_16 femu@node07:/mnt/nvme1/D_10_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_3
ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'
scp /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_16 on rack 7" >> placedway/update_log.txt

# Update block D_10_17 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_17
ssh femu@node07 'rm -f /mnt/nvme2/D_10_17'
scp /home/femu/ecwide-ssd/test/chunks/D_10_17 femu@node07:/mnt/nvme2/D_10_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_3
ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'
scp /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_17 on rack 7" >> placedway/update_log.txt

# Update block D_10_18 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_18
ssh femu@node07 'rm -f /mnt/nvme3/D_10_18'
scp /home/femu/ecwide-ssd/test/chunks/D_10_18 femu@node07:/mnt/nvme3/D_10_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_3
ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'
scp /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_18 on rack 7" >> placedway/update_log.txt

# Update block D_10_19 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_10_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_10_19
ssh femu@node07 'rm -f /mnt/nvme4/D_10_19'
scp /home/femu/ecwide-ssd/test/chunks/D_10_19 femu@node07:/mnt/nvme4/D_10_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_10_3
ssh femu@node07 'rm -f /mnt/nvme5/L_10_3'
scp /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_0
ssh femu@node04 'rm -f /mnt/nvme1/G_10_0'
scp /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_10_1
ssh femu@node06 'rm -f /mnt/nvme2/G_10_1'
scp /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
sleep 0.01

echo "20250414024138 - Updated D_10_19 on rack 7" >> placedway/update_log.txt

# Update block D_11_0 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_0
ssh femu@node01 'rm -f /mnt/nvme0/D_11_0'
scp /home/femu/ecwide-ssd/test/chunks/D_11_0 femu@node01:/mnt/nvme0/D_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_0
ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'
scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_0 on rack 1" >> placedway/update_log.txt

# Update block D_11_1 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_1
ssh femu@node01 'rm -f /mnt/nvme1/D_11_1'
scp /home/femu/ecwide-ssd/test/chunks/D_11_1 femu@node01:/mnt/nvme1/D_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_0
ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'
scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_1 on rack 1" >> placedway/update_log.txt

# Update block D_11_2 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_2
ssh femu@node01 'rm -f /mnt/nvme2/D_11_2'
scp /home/femu/ecwide-ssd/test/chunks/D_11_2 femu@node01:/mnt/nvme2/D_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_0
ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'
scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_2 on rack 1" >> placedway/update_log.txt

# Update block D_11_3 (impacts R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_3
ssh femu@node02 'rm -f /mnt/nvme3/D_11_3'
scp /home/femu/ecwide-ssd/test/chunks/D_11_3 femu@node02:/mnt/nvme3/D_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_0
ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'
scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_3 on rack 2" >> placedway/update_log.txt

# Update block D_11_4 (impacts R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_4
ssh femu@node02 'rm -f /mnt/nvme4/D_11_4'
scp /home/femu/ecwide-ssd/test/chunks/D_11_4 femu@node02:/mnt/nvme4/D_11_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_0
ssh femu@node02 'rm -f /mnt/nvme5/L_11_0'
scp /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_4 on rack 2" >> placedway/update_log.txt

# Update block D_11_5 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_5
ssh femu@node04 'rm -f /mnt/nvme0/D_11_5'
scp /home/femu/ecwide-ssd/test/chunks/D_11_5 femu@node04:/mnt/nvme0/D_11_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_1
ssh femu@node04 'rm -f /mnt/nvme5/L_11_1'
scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_5 on rack 4" >> placedway/update_log.txt

# Update block D_11_6 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_6
ssh femu@node04 'rm -f /mnt/nvme1/D_11_6'
scp /home/femu/ecwide-ssd/test/chunks/D_11_6 femu@node04:/mnt/nvme1/D_11_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_1
ssh femu@node04 'rm -f /mnt/nvme5/L_11_1'
scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_6 on rack 4" >> placedway/update_log.txt

# Update block D_11_7 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_7
ssh femu@node04 'rm -f /mnt/nvme2/D_11_7'
scp /home/femu/ecwide-ssd/test/chunks/D_11_7 femu@node04:/mnt/nvme2/D_11_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_1
ssh femu@node04 'rm -f /mnt/nvme5/L_11_1'
scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_7 on rack 4" >> placedway/update_log.txt

# Update block D_11_8 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_8
ssh femu@node04 'rm -f /mnt/nvme3/D_11_8'
scp /home/femu/ecwide-ssd/test/chunks/D_11_8 femu@node04:/mnt/nvme3/D_11_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_1
ssh femu@node04 'rm -f /mnt/nvme5/L_11_1'
scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_8 on rack 4" >> placedway/update_log.txt

# Update block D_11_9 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_9
ssh femu@node04 'rm -f /mnt/nvme4/D_11_9'
scp /home/femu/ecwide-ssd/test/chunks/D_11_9 femu@node04:/mnt/nvme4/D_11_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_1
ssh femu@node04 'rm -f /mnt/nvme5/L_11_1'
scp /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_9 on rack 4" >> placedway/update_log.txt

# Update block D_11_10 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_10
ssh femu@node06 'rm -f /mnt/nvme0/D_11_10'
scp /home/femu/ecwide-ssd/test/chunks/D_11_10 femu@node06:/mnt/nvme0/D_11_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_2
ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'
scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_10 on rack 6" >> placedway/update_log.txt

# Update block D_11_11 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_11
ssh femu@node06 'rm -f /mnt/nvme1/D_11_11'
scp /home/femu/ecwide-ssd/test/chunks/D_11_11 femu@node06:/mnt/nvme1/D_11_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_2
ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'
scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_11 on rack 6" >> placedway/update_log.txt

# Update block D_11_12 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_12
ssh femu@node06 'rm -f /mnt/nvme2/D_11_12'
scp /home/femu/ecwide-ssd/test/chunks/D_11_12 femu@node06:/mnt/nvme2/D_11_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_2
ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'
scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_12 on rack 6" >> placedway/update_log.txt

# Update block D_11_13 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_13
ssh femu@node06 'rm -f /mnt/nvme3/D_11_13'
scp /home/femu/ecwide-ssd/test/chunks/D_11_13 femu@node06:/mnt/nvme3/D_11_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_2
ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'
scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_13 on rack 6" >> placedway/update_log.txt

# Update block D_11_14 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_14
ssh femu@node06 'rm -f /mnt/nvme4/D_11_14'
scp /home/femu/ecwide-ssd/test/chunks/D_11_14 femu@node06:/mnt/nvme4/D_11_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_2
ssh femu@node06 'rm -f /mnt/nvme5/L_11_2'
scp /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_14 on rack 6" >> placedway/update_log.txt

# Update block D_11_15 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_15
ssh femu@node08 'rm -f /mnt/nvme0/D_11_15'
scp /home/femu/ecwide-ssd/test/chunks/D_11_15 femu@node08:/mnt/nvme0/D_11_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_3
ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'
scp /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_15 on rack 8" >> placedway/update_log.txt

# Update block D_11_16 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_16
ssh femu@node08 'rm -f /mnt/nvme1/D_11_16'
scp /home/femu/ecwide-ssd/test/chunks/D_11_16 femu@node08:/mnt/nvme1/D_11_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_3
ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'
scp /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_16 on rack 8" >> placedway/update_log.txt

# Update block D_11_17 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_17
ssh femu@node08 'rm -f /mnt/nvme2/D_11_17'
scp /home/femu/ecwide-ssd/test/chunks/D_11_17 femu@node08:/mnt/nvme2/D_11_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_3
ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'
scp /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_17 on rack 8" >> placedway/update_log.txt

# Update block D_11_18 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_18
ssh femu@node08 'rm -f /mnt/nvme3/D_11_18'
scp /home/femu/ecwide-ssd/test/chunks/D_11_18 femu@node08:/mnt/nvme3/D_11_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_3
ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'
scp /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_18 on rack 8" >> placedway/update_log.txt

# Update block D_11_19 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_11_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_11_19
ssh femu@node08 'rm -f /mnt/nvme4/D_11_19'
scp /home/femu/ecwide-ssd/test/chunks/D_11_19 femu@node08:/mnt/nvme4/D_11_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_11_3
ssh femu@node08 'rm -f /mnt/nvme5/L_11_3'
scp /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_0
ssh femu@node05 'rm -f /mnt/nvme3/G_11_0'
scp /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_11_1
ssh femu@node07 'rm -f /mnt/nvme4/G_11_1'
scp /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
sleep 0.01

echo "20250414024138 - Updated D_11_19 on rack 8" >> placedway/update_log.txt

# Update block D_12_0 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_12_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_0
ssh femu@node02 'rm -f /mnt/nvme0/D_12_0'
scp /home/femu/ecwide-ssd/test/chunks/D_12_0 femu@node02:/mnt/nvme0/D_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_0
ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'
scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_0 on rack 2" >> placedway/update_log.txt

# Update block D_12_1 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_12_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_1
ssh femu@node02 'rm -f /mnt/nvme1/D_12_1'
scp /home/femu/ecwide-ssd/test/chunks/D_12_1 femu@node02:/mnt/nvme1/D_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_0
ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'
scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_1 on rack 2" >> placedway/update_log.txt

# Update block D_12_2 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_12_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_2
ssh femu@node02 'rm -f /mnt/nvme2/D_12_2'
scp /home/femu/ecwide-ssd/test/chunks/D_12_2 femu@node02:/mnt/nvme2/D_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_0
ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'
scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_2 on rack 2" >> placedway/update_log.txt

# Update block D_12_3 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_12_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_3
ssh femu@node01 'rm -f /mnt/nvme3/D_12_3'
scp /home/femu/ecwide-ssd/test/chunks/D_12_3 femu@node01:/mnt/nvme3/D_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_0
ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'
scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_3 on rack 1" >> placedway/update_log.txt

# Update block D_12_4 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_12_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_4
ssh femu@node01 'rm -f /mnt/nvme4/D_12_4'
scp /home/femu/ecwide-ssd/test/chunks/D_12_4 femu@node01:/mnt/nvme4/D_12_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_0
ssh femu@node01 'rm -f /mnt/nvme5/L_12_0'
scp /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_4 on rack 1" >> placedway/update_log.txt

# Update block D_12_5 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_5
ssh femu@node03 'rm -f /mnt/nvme0/D_12_5'
scp /home/femu/ecwide-ssd/test/chunks/D_12_5 femu@node03:/mnt/nvme0/D_12_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_1
ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'
scp /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_5 on rack 3" >> placedway/update_log.txt

# Update block D_12_6 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_6
ssh femu@node03 'rm -f /mnt/nvme1/D_12_6'
scp /home/femu/ecwide-ssd/test/chunks/D_12_6 femu@node03:/mnt/nvme1/D_12_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_1
ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'
scp /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_6 on rack 3" >> placedway/update_log.txt

# Update block D_12_7 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_7
ssh femu@node03 'rm -f /mnt/nvme2/D_12_7'
scp /home/femu/ecwide-ssd/test/chunks/D_12_7 femu@node03:/mnt/nvme2/D_12_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_1
ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'
scp /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_7 on rack 3" >> placedway/update_log.txt

# Update block D_12_8 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_8
ssh femu@node03 'rm -f /mnt/nvme3/D_12_8'
scp /home/femu/ecwide-ssd/test/chunks/D_12_8 femu@node03:/mnt/nvme3/D_12_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_1
ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'
scp /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_8 on rack 3" >> placedway/update_log.txt

# Update block D_12_9 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_9
ssh femu@node03 'rm -f /mnt/nvme4/D_12_9'
scp /home/femu/ecwide-ssd/test/chunks/D_12_9 femu@node03:/mnt/nvme4/D_12_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_1
ssh femu@node03 'rm -f /mnt/nvme5/L_12_1'
scp /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_9 on rack 3" >> placedway/update_log.txt

# Update block D_12_10 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_10
ssh femu@node05 'rm -f /mnt/nvme0/D_12_10'
scp /home/femu/ecwide-ssd/test/chunks/D_12_10 femu@node05:/mnt/nvme0/D_12_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_2
ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'
scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_10 on rack 5" >> placedway/update_log.txt

# Update block D_12_11 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_11
ssh femu@node05 'rm -f /mnt/nvme1/D_12_11'
scp /home/femu/ecwide-ssd/test/chunks/D_12_11 femu@node05:/mnt/nvme1/D_12_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_2
ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'
scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_11 on rack 5" >> placedway/update_log.txt

# Update block D_12_12 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_12
ssh femu@node05 'rm -f /mnt/nvme2/D_12_12'
scp /home/femu/ecwide-ssd/test/chunks/D_12_12 femu@node05:/mnt/nvme2/D_12_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_2
ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'
scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_12 on rack 5" >> placedway/update_log.txt

# Update block D_12_13 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_13
ssh femu@node05 'rm -f /mnt/nvme3/D_12_13'
scp /home/femu/ecwide-ssd/test/chunks/D_12_13 femu@node05:/mnt/nvme3/D_12_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_2
ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'
scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_13 on rack 5" >> placedway/update_log.txt

# Update block D_12_14 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_14
ssh femu@node05 'rm -f /mnt/nvme4/D_12_14'
scp /home/femu/ecwide-ssd/test/chunks/D_12_14 femu@node05:/mnt/nvme4/D_12_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_2
ssh femu@node05 'rm -f /mnt/nvme5/L_12_2'
scp /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_14 on rack 5" >> placedway/update_log.txt

# Update block D_12_15 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_15
ssh femu@node07 'rm -f /mnt/nvme0/D_12_15'
scp /home/femu/ecwide-ssd/test/chunks/D_12_15 femu@node07:/mnt/nvme0/D_12_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_3
ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'
scp /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_15 on rack 7" >> placedway/update_log.txt

# Update block D_12_16 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_16
ssh femu@node07 'rm -f /mnt/nvme1/D_12_16'
scp /home/femu/ecwide-ssd/test/chunks/D_12_16 femu@node07:/mnt/nvme1/D_12_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_3
ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'
scp /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_16 on rack 7" >> placedway/update_log.txt

# Update block D_12_17 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_17
ssh femu@node07 'rm -f /mnt/nvme2/D_12_17'
scp /home/femu/ecwide-ssd/test/chunks/D_12_17 femu@node07:/mnt/nvme2/D_12_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_3
ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'
scp /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_17 on rack 7" >> placedway/update_log.txt

# Update block D_12_18 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_18
ssh femu@node07 'rm -f /mnt/nvme3/D_12_18'
scp /home/femu/ecwide-ssd/test/chunks/D_12_18 femu@node07:/mnt/nvme3/D_12_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_3
ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'
scp /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_18 on rack 7" >> placedway/update_log.txt

# Update block D_12_19 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_12_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_12_19
ssh femu@node07 'rm -f /mnt/nvme4/D_12_19'
scp /home/femu/ecwide-ssd/test/chunks/D_12_19 femu@node07:/mnt/nvme4/D_12_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_12_3
ssh femu@node07 'rm -f /mnt/nvme5/L_12_3'
scp /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_0
ssh femu@node08 'rm -f /mnt/nvme0/G_12_0'
scp /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_12_1
ssh femu@node01 'rm -f /mnt/nvme1/G_12_1'
scp /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
sleep 0.01

echo "20250414024138 - Updated D_12_19 on rack 7" >> placedway/update_log.txt

# Update block D_13_0 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_0
ssh femu@node01 'rm -f /mnt/nvme0/D_13_0'
scp /home/femu/ecwide-ssd/test/chunks/D_13_0 femu@node01:/mnt/nvme0/D_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_0
ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'
scp /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_0 on rack 1" >> placedway/update_log.txt

# Update block D_13_1 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_1
ssh femu@node01 'rm -f /mnt/nvme1/D_13_1'
scp /home/femu/ecwide-ssd/test/chunks/D_13_1 femu@node01:/mnt/nvme1/D_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_0
ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'
scp /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_1 on rack 1" >> placedway/update_log.txt

# Update block D_13_2 (impacts R01, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_2
ssh femu@node01 'rm -f /mnt/nvme2/D_13_2'
scp /home/femu/ecwide-ssd/test/chunks/D_13_2 femu@node01:/mnt/nvme2/D_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_0
ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'
scp /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_2 on rack 1" >> placedway/update_log.txt

# Update block D_13_3 (impacts R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_3
ssh femu@node02 'rm -f /mnt/nvme3/D_13_3'
scp /home/femu/ecwide-ssd/test/chunks/D_13_3 femu@node02:/mnt/nvme3/D_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_0
ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'
scp /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_3 on rack 2" >> placedway/update_log.txt

# Update block D_13_4 (impacts R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_4
ssh femu@node02 'rm -f /mnt/nvme4/D_13_4'
scp /home/femu/ecwide-ssd/test/chunks/D_13_4 femu@node02:/mnt/nvme4/D_13_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_0
ssh femu@node02 'rm -f /mnt/nvme5/L_13_0'
scp /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_4 on rack 2" >> placedway/update_log.txt

# Update block D_13_5 (impacts R04, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_5
ssh femu@node04 'rm -f /mnt/nvme0/D_13_5'
scp /home/femu/ecwide-ssd/test/chunks/D_13_5 femu@node04:/mnt/nvme0/D_13_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_1
ssh femu@node04 'rm -f /mnt/nvme5/L_13_1'
scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_5 on rack 4" >> placedway/update_log.txt

# Update block D_13_6 (impacts R04, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_6
ssh femu@node04 'rm -f /mnt/nvme1/D_13_6'
scp /home/femu/ecwide-ssd/test/chunks/D_13_6 femu@node04:/mnt/nvme1/D_13_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_1
ssh femu@node04 'rm -f /mnt/nvme5/L_13_1'
scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_6 on rack 4" >> placedway/update_log.txt

# Update block D_13_7 (impacts R04, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_7
ssh femu@node04 'rm -f /mnt/nvme2/D_13_7'
scp /home/femu/ecwide-ssd/test/chunks/D_13_7 femu@node04:/mnt/nvme2/D_13_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_1
ssh femu@node04 'rm -f /mnt/nvme5/L_13_1'
scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_7 on rack 4" >> placedway/update_log.txt

# Update block D_13_8 (impacts R04, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_8
ssh femu@node04 'rm -f /mnt/nvme3/D_13_8'
scp /home/femu/ecwide-ssd/test/chunks/D_13_8 femu@node04:/mnt/nvme3/D_13_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_1
ssh femu@node04 'rm -f /mnt/nvme5/L_13_1'
scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_8 on rack 4" >> placedway/update_log.txt

# Update block D_13_9 (impacts R04, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_9
ssh femu@node04 'rm -f /mnt/nvme4/D_13_9'
scp /home/femu/ecwide-ssd/test/chunks/D_13_9 femu@node04:/mnt/nvme4/D_13_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_1
ssh femu@node04 'rm -f /mnt/nvme5/L_13_1'
scp /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_9 on rack 4" >> placedway/update_log.txt

# Update block D_13_10 (impacts R06, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_10
ssh femu@node06 'rm -f /mnt/nvme0/D_13_10'
scp /home/femu/ecwide-ssd/test/chunks/D_13_10 femu@node06:/mnt/nvme0/D_13_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_2
ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'
scp /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_10 on rack 6" >> placedway/update_log.txt

# Update block D_13_11 (impacts R06, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_11
ssh femu@node06 'rm -f /mnt/nvme1/D_13_11'
scp /home/femu/ecwide-ssd/test/chunks/D_13_11 femu@node06:/mnt/nvme1/D_13_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_2
ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'
scp /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_11 on rack 6" >> placedway/update_log.txt

# Update block D_13_12 (impacts R06, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_12
ssh femu@node06 'rm -f /mnt/nvme2/D_13_12'
scp /home/femu/ecwide-ssd/test/chunks/D_13_12 femu@node06:/mnt/nvme2/D_13_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_2
ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'
scp /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_12 on rack 6" >> placedway/update_log.txt

# Update block D_13_13 (impacts R06, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_13
ssh femu@node06 'rm -f /mnt/nvme3/D_13_13'
scp /home/femu/ecwide-ssd/test/chunks/D_13_13 femu@node06:/mnt/nvme3/D_13_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_2
ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'
scp /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_13 on rack 6" >> placedway/update_log.txt

# Update block D_13_14 (impacts R06, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_14
ssh femu@node06 'rm -f /mnt/nvme4/D_13_14'
scp /home/femu/ecwide-ssd/test/chunks/D_13_14 femu@node06:/mnt/nvme4/D_13_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_2
ssh femu@node06 'rm -f /mnt/nvme5/L_13_2'
scp /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_14 on rack 6" >> placedway/update_log.txt

# Update block D_13_15 (impacts R08, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_15
ssh femu@node08 'rm -f /mnt/nvme0/D_13_15'
scp /home/femu/ecwide-ssd/test/chunks/D_13_15 femu@node08:/mnt/nvme0/D_13_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_3
ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'
scp /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_15 on rack 8" >> placedway/update_log.txt

# Update block D_13_16 (impacts R08, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_16
ssh femu@node08 'rm -f /mnt/nvme1/D_13_16'
scp /home/femu/ecwide-ssd/test/chunks/D_13_16 femu@node08:/mnt/nvme1/D_13_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_3
ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'
scp /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_16 on rack 8" >> placedway/update_log.txt

# Update block D_13_17 (impacts R08, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_17
ssh femu@node08 'rm -f /mnt/nvme2/D_13_17'
scp /home/femu/ecwide-ssd/test/chunks/D_13_17 femu@node08:/mnt/nvme2/D_13_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_3
ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'
scp /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_17 on rack 8" >> placedway/update_log.txt

# Update block D_13_18 (impacts R08, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_18
ssh femu@node08 'rm -f /mnt/nvme3/D_13_18'
scp /home/femu/ecwide-ssd/test/chunks/D_13_18 femu@node08:/mnt/nvme3/D_13_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_3
ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'
scp /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_18 on rack 8" >> placedway/update_log.txt

# Update block D_13_19 (impacts R08, R02, R03)
echo '[$(date +%H:%M:%S)] Updating D_13_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_13_19
ssh femu@node08 'rm -f /mnt/nvme4/D_13_19'
scp /home/femu/ecwide-ssd/test/chunks/D_13_19 femu@node08:/mnt/nvme4/D_13_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_13_3
ssh femu@node08 'rm -f /mnt/nvme5/L_13_3'
scp /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_0
ssh femu@node02 'rm -f /mnt/nvme2/G_13_0'
scp /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_13_1
ssh femu@node03 'rm -f /mnt/nvme3/G_13_1'
scp /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
sleep 0.01

echo "20250414024138 - Updated D_13_19 on rack 8" >> placedway/update_log.txt

# Update block D_14_0 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_0
ssh femu@node02 'rm -f /mnt/nvme0/D_14_0'
scp /home/femu/ecwide-ssd/test/chunks/D_14_0 femu@node02:/mnt/nvme0/D_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_0
ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'
scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_0 on rack 2" >> placedway/update_log.txt

# Update block D_14_1 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_1
ssh femu@node02 'rm -f /mnt/nvme1/D_14_1'
scp /home/femu/ecwide-ssd/test/chunks/D_14_1 femu@node02:/mnt/nvme1/D_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_0
ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'
scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_1 on rack 2" >> placedway/update_log.txt

# Update block D_14_2 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_2
ssh femu@node02 'rm -f /mnt/nvme2/D_14_2'
scp /home/femu/ecwide-ssd/test/chunks/D_14_2 femu@node02:/mnt/nvme2/D_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_0
ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'
scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_2 on rack 2" >> placedway/update_log.txt

# Update block D_14_3 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_3
ssh femu@node01 'rm -f /mnt/nvme3/D_14_3'
scp /home/femu/ecwide-ssd/test/chunks/D_14_3 femu@node01:/mnt/nvme3/D_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_0
ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'
scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_3 on rack 1" >> placedway/update_log.txt

# Update block D_14_4 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_4
ssh femu@node01 'rm -f /mnt/nvme4/D_14_4'
scp /home/femu/ecwide-ssd/test/chunks/D_14_4 femu@node01:/mnt/nvme4/D_14_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_0
ssh femu@node01 'rm -f /mnt/nvme5/L_14_0'
scp /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_4 on rack 1" >> placedway/update_log.txt

# Update block D_14_5 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_5
ssh femu@node03 'rm -f /mnt/nvme0/D_14_5'
scp /home/femu/ecwide-ssd/test/chunks/D_14_5 femu@node03:/mnt/nvme0/D_14_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_1
ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'
scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_5 on rack 3" >> placedway/update_log.txt

# Update block D_14_6 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_6
ssh femu@node03 'rm -f /mnt/nvme1/D_14_6'
scp /home/femu/ecwide-ssd/test/chunks/D_14_6 femu@node03:/mnt/nvme1/D_14_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_1
ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'
scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_6 on rack 3" >> placedway/update_log.txt

# Update block D_14_7 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_7
ssh femu@node03 'rm -f /mnt/nvme2/D_14_7'
scp /home/femu/ecwide-ssd/test/chunks/D_14_7 femu@node03:/mnt/nvme2/D_14_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_1
ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'
scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_7 on rack 3" >> placedway/update_log.txt

# Update block D_14_8 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_8
ssh femu@node03 'rm -f /mnt/nvme3/D_14_8'
scp /home/femu/ecwide-ssd/test/chunks/D_14_8 femu@node03:/mnt/nvme3/D_14_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_1
ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'
scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_8 on rack 3" >> placedway/update_log.txt

# Update block D_14_9 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_9
ssh femu@node03 'rm -f /mnt/nvme4/D_14_9'
scp /home/femu/ecwide-ssd/test/chunks/D_14_9 femu@node03:/mnt/nvme4/D_14_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_1
ssh femu@node03 'rm -f /mnt/nvme5/L_14_1'
scp /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_9 on rack 3" >> placedway/update_log.txt

# Update block D_14_10 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_10
ssh femu@node05 'rm -f /mnt/nvme0/D_14_10'
scp /home/femu/ecwide-ssd/test/chunks/D_14_10 femu@node05:/mnt/nvme0/D_14_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_2
ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'
scp /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_10 on rack 5" >> placedway/update_log.txt

# Update block D_14_11 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_11
ssh femu@node05 'rm -f /mnt/nvme1/D_14_11'
scp /home/femu/ecwide-ssd/test/chunks/D_14_11 femu@node05:/mnt/nvme1/D_14_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_2
ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'
scp /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_11 on rack 5" >> placedway/update_log.txt

# Update block D_14_12 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_12
ssh femu@node05 'rm -f /mnt/nvme2/D_14_12'
scp /home/femu/ecwide-ssd/test/chunks/D_14_12 femu@node05:/mnt/nvme2/D_14_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_2
ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'
scp /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_12 on rack 5" >> placedway/update_log.txt

# Update block D_14_13 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_13
ssh femu@node05 'rm -f /mnt/nvme3/D_14_13'
scp /home/femu/ecwide-ssd/test/chunks/D_14_13 femu@node05:/mnt/nvme3/D_14_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_2
ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'
scp /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_13 on rack 5" >> placedway/update_log.txt

# Update block D_14_14 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_14
ssh femu@node05 'rm -f /mnt/nvme4/D_14_14'
scp /home/femu/ecwide-ssd/test/chunks/D_14_14 femu@node05:/mnt/nvme4/D_14_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_2
ssh femu@node05 'rm -f /mnt/nvme5/L_14_2'
scp /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_14 on rack 5" >> placedway/update_log.txt

# Update block D_14_15 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_15
ssh femu@node07 'rm -f /mnt/nvme0/D_14_15'
scp /home/femu/ecwide-ssd/test/chunks/D_14_15 femu@node07:/mnt/nvme0/D_14_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_3
ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'
scp /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_15 on rack 7" >> placedway/update_log.txt

# Update block D_14_16 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_16
ssh femu@node07 'rm -f /mnt/nvme1/D_14_16'
scp /home/femu/ecwide-ssd/test/chunks/D_14_16 femu@node07:/mnt/nvme1/D_14_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_3
ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'
scp /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_16 on rack 7" >> placedway/update_log.txt

# Update block D_14_17 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_17
ssh femu@node07 'rm -f /mnt/nvme2/D_14_17'
scp /home/femu/ecwide-ssd/test/chunks/D_14_17 femu@node07:/mnt/nvme2/D_14_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_3
ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'
scp /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_17 on rack 7" >> placedway/update_log.txt

# Update block D_14_18 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_18
ssh femu@node07 'rm -f /mnt/nvme3/D_14_18'
scp /home/femu/ecwide-ssd/test/chunks/D_14_18 femu@node07:/mnt/nvme3/D_14_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_3
ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'
scp /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_18 on rack 7" >> placedway/update_log.txt

# Update block D_14_19 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_14_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_14_19
ssh femu@node07 'rm -f /mnt/nvme4/D_14_19'
scp /home/femu/ecwide-ssd/test/chunks/D_14_19 femu@node07:/mnt/nvme4/D_14_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_14_3
ssh femu@node07 'rm -f /mnt/nvme5/L_14_3'
scp /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_0
ssh femu@node04 'rm -f /mnt/nvme0/G_14_0'
scp /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_14_1
ssh femu@node06 'rm -f /mnt/nvme1/G_14_1'
scp /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
sleep 0.01

echo "20250414024138 - Updated D_14_19 on rack 7" >> placedway/update_log.txt

# Update block D_15_0 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_15_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_0
ssh femu@node01 'rm -f /mnt/nvme0/D_15_0'
scp /home/femu/ecwide-ssd/test/chunks/D_15_0 femu@node01:/mnt/nvme0/D_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_0
ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'
scp /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_0 on rack 1" >> placedway/update_log.txt

# Update block D_15_1 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_15_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_1
ssh femu@node01 'rm -f /mnt/nvme1/D_15_1'
scp /home/femu/ecwide-ssd/test/chunks/D_15_1 femu@node01:/mnt/nvme1/D_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_0
ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'
scp /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_1 on rack 1" >> placedway/update_log.txt

# Update block D_15_2 (impacts R01, R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_15_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_2
ssh femu@node01 'rm -f /mnt/nvme2/D_15_2'
scp /home/femu/ecwide-ssd/test/chunks/D_15_2 femu@node01:/mnt/nvme2/D_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_0
ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'
scp /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_2 on rack 1" >> placedway/update_log.txt

# Update block D_15_3 (impacts R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_15_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_3
ssh femu@node02 'rm -f /mnt/nvme3/D_15_3'
scp /home/femu/ecwide-ssd/test/chunks/D_15_3 femu@node02:/mnt/nvme3/D_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_0
ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'
scp /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_3 on rack 2" >> placedway/update_log.txt

# Update block D_15_4 (impacts R02, R05)
echo '[$(date +%H:%M:%S)] Updating D_15_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_4
ssh femu@node02 'rm -f /mnt/nvme4/D_15_4'
scp /home/femu/ecwide-ssd/test/chunks/D_15_4 femu@node02:/mnt/nvme4/D_15_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_0
ssh femu@node02 'rm -f /mnt/nvme5/L_15_0'
scp /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_4 on rack 2" >> placedway/update_log.txt

# Update block D_15_5 (impacts R04, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_5
ssh femu@node04 'rm -f /mnt/nvme0/D_15_5'
scp /home/femu/ecwide-ssd/test/chunks/D_15_5 femu@node04:/mnt/nvme0/D_15_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_1
ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'
scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_5 on rack 4" >> placedway/update_log.txt

# Update block D_15_6 (impacts R04, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_6
ssh femu@node04 'rm -f /mnt/nvme1/D_15_6'
scp /home/femu/ecwide-ssd/test/chunks/D_15_6 femu@node04:/mnt/nvme1/D_15_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_1
ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'
scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_6 on rack 4" >> placedway/update_log.txt

# Update block D_15_7 (impacts R04, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_7
ssh femu@node04 'rm -f /mnt/nvme2/D_15_7'
scp /home/femu/ecwide-ssd/test/chunks/D_15_7 femu@node04:/mnt/nvme2/D_15_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_1
ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'
scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_7 on rack 4" >> placedway/update_log.txt

# Update block D_15_8 (impacts R04, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_8
ssh femu@node04 'rm -f /mnt/nvme3/D_15_8'
scp /home/femu/ecwide-ssd/test/chunks/D_15_8 femu@node04:/mnt/nvme3/D_15_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_1
ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'
scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_8 on rack 4" >> placedway/update_log.txt

# Update block D_15_9 (impacts R04, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_9
ssh femu@node04 'rm -f /mnt/nvme4/D_15_9'
scp /home/femu/ecwide-ssd/test/chunks/D_15_9 femu@node04:/mnt/nvme4/D_15_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_1
ssh femu@node04 'rm -f /mnt/nvme5/L_15_1'
scp /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_9 on rack 4" >> placedway/update_log.txt

# Update block D_15_10 (impacts R06, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_10
ssh femu@node06 'rm -f /mnt/nvme0/D_15_10'
scp /home/femu/ecwide-ssd/test/chunks/D_15_10 femu@node06:/mnt/nvme0/D_15_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_2
ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'
scp /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_10 on rack 6" >> placedway/update_log.txt

# Update block D_15_11 (impacts R06, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_11
ssh femu@node06 'rm -f /mnt/nvme1/D_15_11'
scp /home/femu/ecwide-ssd/test/chunks/D_15_11 femu@node06:/mnt/nvme1/D_15_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_2
ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'
scp /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_11 on rack 6" >> placedway/update_log.txt

# Update block D_15_12 (impacts R06, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_12
ssh femu@node06 'rm -f /mnt/nvme2/D_15_12'
scp /home/femu/ecwide-ssd/test/chunks/D_15_12 femu@node06:/mnt/nvme2/D_15_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_2
ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'
scp /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_12 on rack 6" >> placedway/update_log.txt

# Update block D_15_13 (impacts R06, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_13
ssh femu@node06 'rm -f /mnt/nvme3/D_15_13'
scp /home/femu/ecwide-ssd/test/chunks/D_15_13 femu@node06:/mnt/nvme3/D_15_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_2
ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'
scp /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_13 on rack 6" >> placedway/update_log.txt

# Update block D_15_14 (impacts R06, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_14...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_14
ssh femu@node06 'rm -f /mnt/nvme4/D_15_14'
scp /home/femu/ecwide-ssd/test/chunks/D_15_14 femu@node06:/mnt/nvme4/D_15_14
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_2
ssh femu@node06 'rm -f /mnt/nvme5/L_15_2'
scp /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_14 on rack 6" >> placedway/update_log.txt

# Update block D_15_15 (impacts R08, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_15...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_15
ssh femu@node08 'rm -f /mnt/nvme0/D_15_15'
scp /home/femu/ecwide-ssd/test/chunks/D_15_15 femu@node08:/mnt/nvme0/D_15_15
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_3
ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'
scp /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_15 on rack 8" >> placedway/update_log.txt

# Update block D_15_16 (impacts R08, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_16...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_16
ssh femu@node08 'rm -f /mnt/nvme1/D_15_16'
scp /home/femu/ecwide-ssd/test/chunks/D_15_16 femu@node08:/mnt/nvme1/D_15_16
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_3
ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'
scp /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_16 on rack 8" >> placedway/update_log.txt

# Update block D_15_17 (impacts R08, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_17...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_17
ssh femu@node08 'rm -f /mnt/nvme2/D_15_17'
scp /home/femu/ecwide-ssd/test/chunks/D_15_17 femu@node08:/mnt/nvme2/D_15_17
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_3
ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'
scp /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_17 on rack 8" >> placedway/update_log.txt

# Update block D_15_18 (impacts R08, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_18...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_18
ssh femu@node08 'rm -f /mnt/nvme3/D_15_18'
scp /home/femu/ecwide-ssd/test/chunks/D_15_18 femu@node08:/mnt/nvme3/D_15_18
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_3
ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'
scp /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_18 on rack 8" >> placedway/update_log.txt

# Update block D_15_19 (impacts R08, R05, R02)
echo '[$(date +%H:%M:%S)] Updating D_15_19...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_15_19
ssh femu@node08 'rm -f /mnt/nvme4/D_15_19'
scp /home/femu/ecwide-ssd/test/chunks/D_15_19 femu@node08:/mnt/nvme4/D_15_19
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_15_3
ssh femu@node08 'rm -f /mnt/nvme5/L_15_3'
scp /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_0
ssh femu@node05 'rm -f /mnt/nvme4/G_15_0'
scp /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_15_1
ssh femu@node02 'rm -f /mnt/nvme2/G_15_1'
scp /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
sleep 0.01

echo "20250414024138 - Updated D_15_19 on rack 8" >> placedway/update_log.txt

# Update block D_16_0 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_16_0...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_0
ssh femu@node02 'rm -f /mnt/nvme0/D_16_0'
scp /home/femu/ecwide-ssd/test/chunks/D_16_0 femu@node02:/mnt/nvme0/D_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_0
ssh femu@node01 'rm -f /mnt/nvme5/L_16_0'
scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_0 on rack 2" >> placedway/update_log.txt

# Update block D_16_1 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_16_1...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_1
ssh femu@node02 'rm -f /mnt/nvme1/D_16_1'
scp /home/femu/ecwide-ssd/test/chunks/D_16_1 femu@node02:/mnt/nvme1/D_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_0
ssh femu@node01 'rm -f /mnt/nvme5/L_16_0'
scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_1 on rack 2" >> placedway/update_log.txt

# Update block D_16_2 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_16_2...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_2
ssh femu@node02 'rm -f /mnt/nvme2/D_16_2'
scp /home/femu/ecwide-ssd/test/chunks/D_16_2 femu@node02:/mnt/nvme2/D_16_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_0
ssh femu@node01 'rm -f /mnt/nvme5/L_16_0'
scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_2 on rack 2" >> placedway/update_log.txt

# Update block D_16_3 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_16_3...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_3
ssh femu@node01 'rm -f /mnt/nvme3/D_16_3'
scp /home/femu/ecwide-ssd/test/chunks/D_16_3 femu@node01:/mnt/nvme3/D_16_3
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_0
ssh femu@node01 'rm -f /mnt/nvme5/L_16_0'
scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_3 on rack 1" >> placedway/update_log.txt

# Update block D_16_4 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_16_4...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_4
ssh femu@node01 'rm -f /mnt/nvme4/D_16_4'
scp /home/femu/ecwide-ssd/test/chunks/D_16_4 femu@node01:/mnt/nvme4/D_16_4
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_0
ssh femu@node01 'rm -f /mnt/nvme5/L_16_0'
scp /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_4 on rack 1" >> placedway/update_log.txt

# Update block D_16_5 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_5...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_5
ssh femu@node03 'rm -f /mnt/nvme0/D_16_5'
scp /home/femu/ecwide-ssd/test/chunks/D_16_5 femu@node03:/mnt/nvme0/D_16_5
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_1
ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'
scp /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_5 on rack 3" >> placedway/update_log.txt

# Update block D_16_6 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_6...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_6
ssh femu@node03 'rm -f /mnt/nvme1/D_16_6'
scp /home/femu/ecwide-ssd/test/chunks/D_16_6 femu@node03:/mnt/nvme1/D_16_6
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_1
ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'
scp /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_6 on rack 3" >> placedway/update_log.txt

# Update block D_16_7 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_7...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_7
ssh femu@node03 'rm -f /mnt/nvme2/D_16_7'
scp /home/femu/ecwide-ssd/test/chunks/D_16_7 femu@node03:/mnt/nvme2/D_16_7
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_1
ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'
scp /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_7 on rack 3" >> placedway/update_log.txt

# Update block D_16_8 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_8...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_8
ssh femu@node03 'rm -f /mnt/nvme3/D_16_8'
scp /home/femu/ecwide-ssd/test/chunks/D_16_8 femu@node03:/mnt/nvme3/D_16_8
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_1
ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'
scp /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_8 on rack 3" >> placedway/update_log.txt

# Update block D_16_9 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_9...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_9
ssh femu@node03 'rm -f /mnt/nvme4/D_16_9'
scp /home/femu/ecwide-ssd/test/chunks/D_16_9 femu@node03:/mnt/nvme4/D_16_9
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_1
ssh femu@node03 'rm -f /mnt/nvme5/L_16_1'
scp /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_9 on rack 3" >> placedway/update_log.txt

# Update block D_16_10 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_10...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_10
ssh femu@node05 'rm -f /mnt/nvme0/D_16_10'
scp /home/femu/ecwide-ssd/test/chunks/D_16_10 femu@node05:/mnt/nvme0/D_16_10
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_2
ssh femu@node05 'rm -f /mnt/nvme5/L_16_2'
scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_10 on rack 5" >> placedway/update_log.txt

# Update block D_16_11 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_11...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_11
ssh femu@node05 'rm -f /mnt/nvme1/D_16_11'
scp /home/femu/ecwide-ssd/test/chunks/D_16_11 femu@node05:/mnt/nvme1/D_16_11
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_2
ssh femu@node05 'rm -f /mnt/nvme5/L_16_2'
scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_11 on rack 5" >> placedway/update_log.txt

# Update block D_16_12 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_12...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_12
ssh femu@node05 'rm -f /mnt/nvme2/D_16_12'
scp /home/femu/ecwide-ssd/test/chunks/D_16_12 femu@node05:/mnt/nvme2/D_16_12
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_2
ssh femu@node05 'rm -f /mnt/nvme5/L_16_2'
scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024138 - Updated D_16_12 on rack 5" >> placedway/update_log.txt

# Update block D_16_13 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_13...'
echo "Updated content 20250414024138" > /home/femu/ecwide-ssd/test/chunks/D_16_13
ssh femu@node05 'rm -f /mnt/nvme3/D_16_13'
scp /home/femu/ecwide-ssd/test/chunks/D_16_13 femu@node05:/mnt/nvme3/D_16_13
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/L_16_2
ssh femu@node05 'rm -f /mnt/nvme5/L_16_2'
scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024138" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_13 on rack 5" >> placedway/update_log.txt

# Update block D_16_14 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_14...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_14
ssh femu@node05 'rm -f /mnt/nvme4/D_16_14'
scp /home/femu/ecwide-ssd/test/chunks/D_16_14 femu@node05:/mnt/nvme4/D_16_14
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_2
ssh femu@node05 'rm -f /mnt/nvme5/L_16_2'
scp /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_14 on rack 5" >> placedway/update_log.txt

# Update block D_16_15 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_15...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_15
ssh femu@node07 'rm -f /mnt/nvme0/D_16_15'
scp /home/femu/ecwide-ssd/test/chunks/D_16_15 femu@node07:/mnt/nvme0/D_16_15
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_3
ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'
scp /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_15 on rack 7" >> placedway/update_log.txt

# Update block D_16_16 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_16...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_16
ssh femu@node07 'rm -f /mnt/nvme1/D_16_16'
scp /home/femu/ecwide-ssd/test/chunks/D_16_16 femu@node07:/mnt/nvme1/D_16_16
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_3
ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'
scp /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_16 on rack 7" >> placedway/update_log.txt

# Update block D_16_17 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_17...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_17
ssh femu@node07 'rm -f /mnt/nvme2/D_16_17'
scp /home/femu/ecwide-ssd/test/chunks/D_16_17 femu@node07:/mnt/nvme2/D_16_17
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_3
ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'
scp /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_17 on rack 7" >> placedway/update_log.txt

# Update block D_16_18 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_18...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_18
ssh femu@node07 'rm -f /mnt/nvme3/D_16_18'
scp /home/femu/ecwide-ssd/test/chunks/D_16_18 femu@node07:/mnt/nvme3/D_16_18
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_3
ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'
scp /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_18 on rack 7" >> placedway/update_log.txt

# Update block D_16_19 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_16_19...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_16_19
ssh femu@node07 'rm -f /mnt/nvme4/D_16_19'
scp /home/femu/ecwide-ssd/test/chunks/D_16_19 femu@node07:/mnt/nvme4/D_16_19
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_16_3
ssh femu@node07 'rm -f /mnt/nvme5/L_16_3'
scp /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_0
ssh femu@node08 'rm -f /mnt/nvme0/G_16_0'
scp /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_16_1
ssh femu@node01 'rm -f /mnt/nvme1/G_16_1'
scp /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
sleep 0.01

echo "20250414024139 - Updated D_16_19 on rack 7" >> placedway/update_log.txt

# Update block D_17_0 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_0...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_0
ssh femu@node01 'rm -f /mnt/nvme0/D_17_0'
scp /home/femu/ecwide-ssd/test/chunks/D_17_0 femu@node01:/mnt/nvme0/D_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_0
ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'
scp /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_0 on rack 1" >> placedway/update_log.txt

# Update block D_17_1 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_1...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_1
ssh femu@node01 'rm -f /mnt/nvme1/D_17_1'
scp /home/femu/ecwide-ssd/test/chunks/D_17_1 femu@node01:/mnt/nvme1/D_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_0
ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'
scp /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_1 on rack 1" >> placedway/update_log.txt

# Update block D_17_2 (impacts R01, R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_2...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_2
ssh femu@node01 'rm -f /mnt/nvme2/D_17_2'
scp /home/femu/ecwide-ssd/test/chunks/D_17_2 femu@node01:/mnt/nvme2/D_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_0
ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'
scp /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_2 on rack 1" >> placedway/update_log.txt

# Update block D_17_3 (impacts R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_3...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_3
ssh femu@node02 'rm -f /mnt/nvme3/D_17_3'
scp /home/femu/ecwide-ssd/test/chunks/D_17_3 femu@node02:/mnt/nvme3/D_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_0
ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'
scp /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_3 on rack 2" >> placedway/update_log.txt

# Update block D_17_4 (impacts R02, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_4...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_4
ssh femu@node02 'rm -f /mnt/nvme4/D_17_4'
scp /home/femu/ecwide-ssd/test/chunks/D_17_4 femu@node02:/mnt/nvme4/D_17_4
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_0
ssh femu@node02 'rm -f /mnt/nvme5/L_17_0'
scp /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_4 on rack 2" >> placedway/update_log.txt

# Update block D_17_5 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_5...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_5
ssh femu@node04 'rm -f /mnt/nvme0/D_17_5'
scp /home/femu/ecwide-ssd/test/chunks/D_17_5 femu@node04:/mnt/nvme0/D_17_5
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_1
ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'
scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_5 on rack 4" >> placedway/update_log.txt

# Update block D_17_6 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_6...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_6
ssh femu@node04 'rm -f /mnt/nvme1/D_17_6'
scp /home/femu/ecwide-ssd/test/chunks/D_17_6 femu@node04:/mnt/nvme1/D_17_6
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_1
ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'
scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_6 on rack 4" >> placedway/update_log.txt

# Update block D_17_7 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_7...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_7
ssh femu@node04 'rm -f /mnt/nvme2/D_17_7'
scp /home/femu/ecwide-ssd/test/chunks/D_17_7 femu@node04:/mnt/nvme2/D_17_7
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_1
ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'
scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_7 on rack 4" >> placedway/update_log.txt

# Update block D_17_8 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_8...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_8
ssh femu@node04 'rm -f /mnt/nvme3/D_17_8'
scp /home/femu/ecwide-ssd/test/chunks/D_17_8 femu@node04:/mnt/nvme3/D_17_8
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_1
ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'
scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_8 on rack 4" >> placedway/update_log.txt

# Update block D_17_9 (impacts R04, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_9...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_9
ssh femu@node04 'rm -f /mnt/nvme4/D_17_9'
scp /home/femu/ecwide-ssd/test/chunks/D_17_9 femu@node04:/mnt/nvme4/D_17_9
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_1
ssh femu@node04 'rm -f /mnt/nvme5/L_17_1'
scp /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_9 on rack 4" >> placedway/update_log.txt

# Update block D_17_10 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_10...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_10
ssh femu@node06 'rm -f /mnt/nvme0/D_17_10'
scp /home/femu/ecwide-ssd/test/chunks/D_17_10 femu@node06:/mnt/nvme0/D_17_10
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_2
ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'
scp /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_10 on rack 6" >> placedway/update_log.txt

# Update block D_17_11 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_11...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_11
ssh femu@node06 'rm -f /mnt/nvme1/D_17_11'
scp /home/femu/ecwide-ssd/test/chunks/D_17_11 femu@node06:/mnt/nvme1/D_17_11
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_2
ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'
scp /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_11 on rack 6" >> placedway/update_log.txt

# Update block D_17_12 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_12...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_12
ssh femu@node06 'rm -f /mnt/nvme2/D_17_12'
scp /home/femu/ecwide-ssd/test/chunks/D_17_12 femu@node06:/mnt/nvme2/D_17_12
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_2
ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'
scp /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_12 on rack 6" >> placedway/update_log.txt

# Update block D_17_13 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_13...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_13
ssh femu@node06 'rm -f /mnt/nvme3/D_17_13'
scp /home/femu/ecwide-ssd/test/chunks/D_17_13 femu@node06:/mnt/nvme3/D_17_13
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_2
ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'
scp /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_13 on rack 6" >> placedway/update_log.txt

# Update block D_17_14 (impacts R06, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_14...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_14
ssh femu@node06 'rm -f /mnt/nvme4/D_17_14'
scp /home/femu/ecwide-ssd/test/chunks/D_17_14 femu@node06:/mnt/nvme4/D_17_14
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_2
ssh femu@node06 'rm -f /mnt/nvme5/L_17_2'
scp /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_14 on rack 6" >> placedway/update_log.txt

# Update block D_17_15 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_15...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_15
ssh femu@node08 'rm -f /mnt/nvme0/D_17_15'
scp /home/femu/ecwide-ssd/test/chunks/D_17_15 femu@node08:/mnt/nvme0/D_17_15
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_3
ssh femu@node08 'rm -f /mnt/nvme5/L_17_3'
scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_15 on rack 8" >> placedway/update_log.txt

# Update block D_17_16 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_16...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_16
ssh femu@node08 'rm -f /mnt/nvme1/D_17_16'
scp /home/femu/ecwide-ssd/test/chunks/D_17_16 femu@node08:/mnt/nvme1/D_17_16
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_3
ssh femu@node08 'rm -f /mnt/nvme5/L_17_3'
scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_16 on rack 8" >> placedway/update_log.txt

# Update block D_17_17 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_17...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_17
ssh femu@node08 'rm -f /mnt/nvme2/D_17_17'
scp /home/femu/ecwide-ssd/test/chunks/D_17_17 femu@node08:/mnt/nvme2/D_17_17
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_3
ssh femu@node08 'rm -f /mnt/nvme5/L_17_3'
scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_17 on rack 8" >> placedway/update_log.txt

# Update block D_17_18 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_18...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_18
ssh femu@node08 'rm -f /mnt/nvme3/D_17_18'
scp /home/femu/ecwide-ssd/test/chunks/D_17_18 femu@node08:/mnt/nvme3/D_17_18
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_3
ssh femu@node08 'rm -f /mnt/nvme5/L_17_3'
scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_18 on rack 8" >> placedway/update_log.txt

# Update block D_17_19 (impacts R08, R07, R03)
echo '[$(date +%H:%M:%S)] Updating D_17_19...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_17_19
ssh femu@node08 'rm -f /mnt/nvme4/D_17_19'
scp /home/femu/ecwide-ssd/test/chunks/D_17_19 femu@node08:/mnt/nvme4/D_17_19
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_17_3
ssh femu@node08 'rm -f /mnt/nvme5/L_17_3'
scp /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_0
ssh femu@node07 'rm -f /mnt/nvme3/G_17_0'
scp /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_17_1
ssh femu@node03 'rm -f /mnt/nvme4/G_17_1'
scp /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
sleep 0.01

echo "20250414024139 - Updated D_17_19 on rack 8" >> placedway/update_log.txt

# Update block D_18_0 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_0...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_0
ssh femu@node02 'rm -f /mnt/nvme0/D_18_0'
scp /home/femu/ecwide-ssd/test/chunks/D_18_0 femu@node02:/mnt/nvme0/D_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_0
ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'
scp /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_0 on rack 2" >> placedway/update_log.txt

# Update block D_18_1 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_1...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_1
ssh femu@node02 'rm -f /mnt/nvme1/D_18_1'
scp /home/femu/ecwide-ssd/test/chunks/D_18_1 femu@node02:/mnt/nvme1/D_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_0
ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'
scp /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_1 on rack 2" >> placedway/update_log.txt

# Update block D_18_2 (impacts R02, R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_2...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_2
ssh femu@node02 'rm -f /mnt/nvme2/D_18_2'
scp /home/femu/ecwide-ssd/test/chunks/D_18_2 femu@node02:/mnt/nvme2/D_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_0
ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'
scp /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_2 on rack 2" >> placedway/update_log.txt

# Update block D_18_3 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_3...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_3
ssh femu@node01 'rm -f /mnt/nvme3/D_18_3'
scp /home/femu/ecwide-ssd/test/chunks/D_18_3 femu@node01:/mnt/nvme3/D_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_0
ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'
scp /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_3 on rack 1" >> placedway/update_log.txt

# Update block D_18_4 (impacts R01, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_4...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_4
ssh femu@node01 'rm -f /mnt/nvme4/D_18_4'
scp /home/femu/ecwide-ssd/test/chunks/D_18_4 femu@node01:/mnt/nvme4/D_18_4
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_0
ssh femu@node01 'rm -f /mnt/nvme5/L_18_0'
scp /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_4 on rack 1" >> placedway/update_log.txt

# Update block D_18_5 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_5...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_5
ssh femu@node03 'rm -f /mnt/nvme0/D_18_5'
scp /home/femu/ecwide-ssd/test/chunks/D_18_5 femu@node03:/mnt/nvme0/D_18_5
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_1
ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'
scp /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_5 on rack 3" >> placedway/update_log.txt

# Update block D_18_6 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_6...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_6
ssh femu@node03 'rm -f /mnt/nvme1/D_18_6'
scp /home/femu/ecwide-ssd/test/chunks/D_18_6 femu@node03:/mnt/nvme1/D_18_6
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_1
ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'
scp /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_6 on rack 3" >> placedway/update_log.txt

# Update block D_18_7 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_7...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_7
ssh femu@node03 'rm -f /mnt/nvme2/D_18_7'
scp /home/femu/ecwide-ssd/test/chunks/D_18_7 femu@node03:/mnt/nvme2/D_18_7
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_1
ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'
scp /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_7 on rack 3" >> placedway/update_log.txt

# Update block D_18_8 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_8...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_8
ssh femu@node03 'rm -f /mnt/nvme3/D_18_8'
scp /home/femu/ecwide-ssd/test/chunks/D_18_8 femu@node03:/mnt/nvme3/D_18_8
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_1
ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'
scp /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_8 on rack 3" >> placedway/update_log.txt

# Update block D_18_9 (impacts R03, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_9...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_9
ssh femu@node03 'rm -f /mnt/nvme4/D_18_9'
scp /home/femu/ecwide-ssd/test/chunks/D_18_9 femu@node03:/mnt/nvme4/D_18_9
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_1
ssh femu@node03 'rm -f /mnt/nvme5/L_18_1'
scp /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_9 on rack 3" >> placedway/update_log.txt

# Update block D_18_10 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_10...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_10
ssh femu@node05 'rm -f /mnt/nvme0/D_18_10'
scp /home/femu/ecwide-ssd/test/chunks/D_18_10 femu@node05:/mnt/nvme0/D_18_10
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_2
ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'
scp /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_10 on rack 5" >> placedway/update_log.txt

# Update block D_18_11 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_11...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_11
ssh femu@node05 'rm -f /mnt/nvme1/D_18_11'
scp /home/femu/ecwide-ssd/test/chunks/D_18_11 femu@node05:/mnt/nvme1/D_18_11
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_2
ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'
scp /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_11 on rack 5" >> placedway/update_log.txt

# Update block D_18_12 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_12...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_12
ssh femu@node05 'rm -f /mnt/nvme2/D_18_12'
scp /home/femu/ecwide-ssd/test/chunks/D_18_12 femu@node05:/mnt/nvme2/D_18_12
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_2
ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'
scp /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_12 on rack 5" >> placedway/update_log.txt

# Update block D_18_13 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_13...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_13
ssh femu@node05 'rm -f /mnt/nvme3/D_18_13'
scp /home/femu/ecwide-ssd/test/chunks/D_18_13 femu@node05:/mnt/nvme3/D_18_13
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_2
ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'
scp /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_13 on rack 5" >> placedway/update_log.txt

# Update block D_18_14 (impacts R05, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_14...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_14
ssh femu@node05 'rm -f /mnt/nvme4/D_18_14'
scp /home/femu/ecwide-ssd/test/chunks/D_18_14 femu@node05:/mnt/nvme4/D_18_14
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_2
ssh femu@node05 'rm -f /mnt/nvme5/L_18_2'
scp /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_14 on rack 5" >> placedway/update_log.txt

# Update block D_18_15 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_15...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_15
ssh femu@node07 'rm -f /mnt/nvme0/D_18_15'
scp /home/femu/ecwide-ssd/test/chunks/D_18_15 femu@node07:/mnt/nvme0/D_18_15
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_3
ssh femu@node07 'rm -f /mnt/nvme5/L_18_3'
scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_15 on rack 7" >> placedway/update_log.txt

# Update block D_18_16 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_16...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_16
ssh femu@node07 'rm -f /mnt/nvme1/D_18_16'
scp /home/femu/ecwide-ssd/test/chunks/D_18_16 femu@node07:/mnt/nvme1/D_18_16
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_3
ssh femu@node07 'rm -f /mnt/nvme5/L_18_3'
scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_16 on rack 7" >> placedway/update_log.txt

# Update block D_18_17 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_17...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_17
ssh femu@node07 'rm -f /mnt/nvme2/D_18_17'
scp /home/femu/ecwide-ssd/test/chunks/D_18_17 femu@node07:/mnt/nvme2/D_18_17
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_3
ssh femu@node07 'rm -f /mnt/nvme5/L_18_3'
scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_17 on rack 7" >> placedway/update_log.txt

# Update block D_18_18 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_18...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_18
ssh femu@node07 'rm -f /mnt/nvme3/D_18_18'
scp /home/femu/ecwide-ssd/test/chunks/D_18_18 femu@node07:/mnt/nvme3/D_18_18
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_3
ssh femu@node07 'rm -f /mnt/nvme5/L_18_3'
scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_18 on rack 7" >> placedway/update_log.txt

# Update block D_18_19 (impacts R07, R04, R06)
echo '[$(date +%H:%M:%S)] Updating D_18_19...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_18_19
ssh femu@node07 'rm -f /mnt/nvme4/D_18_19'
scp /home/femu/ecwide-ssd/test/chunks/D_18_19 femu@node07:/mnt/nvme4/D_18_19
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_18_3
ssh femu@node07 'rm -f /mnt/nvme5/L_18_3'
scp /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_0
ssh femu@node04 'rm -f /mnt/nvme2/G_18_0'
scp /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_18_1
ssh femu@node06 'rm -f /mnt/nvme0/G_18_1'
scp /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
sleep 0.01

echo "20250414024139 - Updated D_18_19 on rack 7" >> placedway/update_log.txt

# Update block D_19_0 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_0...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_0
ssh femu@node01 'rm -f /mnt/nvme0/D_19_0'
scp /home/femu/ecwide-ssd/test/chunks/D_19_0 femu@node01:/mnt/nvme0/D_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_0
ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'
scp /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_0 on rack 1" >> placedway/update_log.txt

# Update block D_19_1 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_1...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_1
ssh femu@node01 'rm -f /mnt/nvme1/D_19_1'
scp /home/femu/ecwide-ssd/test/chunks/D_19_1 femu@node01:/mnt/nvme1/D_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_0
ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'
scp /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_1 on rack 1" >> placedway/update_log.txt

# Update block D_19_2 (impacts R01, R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_2...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_2
ssh femu@node01 'rm -f /mnt/nvme2/D_19_2'
scp /home/femu/ecwide-ssd/test/chunks/D_19_2 femu@node01:/mnt/nvme2/D_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_0
ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'
scp /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_2 on rack 1" >> placedway/update_log.txt

# Update block D_19_3 (impacts R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_3...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_3
ssh femu@node02 'rm -f /mnt/nvme3/D_19_3'
scp /home/femu/ecwide-ssd/test/chunks/D_19_3 femu@node02:/mnt/nvme3/D_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_0
ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'
scp /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_3 on rack 2" >> placedway/update_log.txt

# Update block D_19_4 (impacts R02, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_4...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_4
ssh femu@node02 'rm -f /mnt/nvme4/D_19_4'
scp /home/femu/ecwide-ssd/test/chunks/D_19_4 femu@node02:/mnt/nvme4/D_19_4
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_0
ssh femu@node02 'rm -f /mnt/nvme5/L_19_0'
scp /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_4 on rack 2" >> placedway/update_log.txt

# Update block D_19_5 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_5...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_5
ssh femu@node04 'rm -f /mnt/nvme0/D_19_5'
scp /home/femu/ecwide-ssd/test/chunks/D_19_5 femu@node04:/mnt/nvme0/D_19_5
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_1
ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'
scp /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_5 on rack 4" >> placedway/update_log.txt

# Update block D_19_6 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_6...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_6
ssh femu@node04 'rm -f /mnt/nvme1/D_19_6'
scp /home/femu/ecwide-ssd/test/chunks/D_19_6 femu@node04:/mnt/nvme1/D_19_6
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_1
ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'
scp /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_6 on rack 4" >> placedway/update_log.txt

# Update block D_19_7 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_7...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_7
ssh femu@node04 'rm -f /mnt/nvme2/D_19_7'
scp /home/femu/ecwide-ssd/test/chunks/D_19_7 femu@node04:/mnt/nvme2/D_19_7
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_1
ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'
scp /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_7 on rack 4" >> placedway/update_log.txt

# Update block D_19_8 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_8...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_8
ssh femu@node04 'rm -f /mnt/nvme3/D_19_8'
scp /home/femu/ecwide-ssd/test/chunks/D_19_8 femu@node04:/mnt/nvme3/D_19_8
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_1
ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'
scp /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_8 on rack 4" >> placedway/update_log.txt

# Update block D_19_9 (impacts R04, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_9...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_9
ssh femu@node04 'rm -f /mnt/nvme4/D_19_9'
scp /home/femu/ecwide-ssd/test/chunks/D_19_9 femu@node04:/mnt/nvme4/D_19_9
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_1
ssh femu@node04 'rm -f /mnt/nvme5/L_19_1'
scp /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_9 on rack 4" >> placedway/update_log.txt

# Update block D_19_10 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_10...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_10
ssh femu@node06 'rm -f /mnt/nvme0/D_19_10'
scp /home/femu/ecwide-ssd/test/chunks/D_19_10 femu@node06:/mnt/nvme0/D_19_10
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_2
ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'
scp /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_10 on rack 6" >> placedway/update_log.txt

# Update block D_19_11 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_11...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_11
ssh femu@node06 'rm -f /mnt/nvme1/D_19_11'
scp /home/femu/ecwide-ssd/test/chunks/D_19_11 femu@node06:/mnt/nvme1/D_19_11
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_2
ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'
scp /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_11 on rack 6" >> placedway/update_log.txt

# Update block D_19_12 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_12...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_12
ssh femu@node06 'rm -f /mnt/nvme2/D_19_12'
scp /home/femu/ecwide-ssd/test/chunks/D_19_12 femu@node06:/mnt/nvme2/D_19_12
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_2
ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'
scp /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_12 on rack 6" >> placedway/update_log.txt

# Update block D_19_13 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_13...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_13
ssh femu@node06 'rm -f /mnt/nvme3/D_19_13'
scp /home/femu/ecwide-ssd/test/chunks/D_19_13 femu@node06:/mnt/nvme3/D_19_13
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_2
ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'
scp /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_13 on rack 6" >> placedway/update_log.txt

# Update block D_19_14 (impacts R06, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_14...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_14
ssh femu@node06 'rm -f /mnt/nvme4/D_19_14'
scp /home/femu/ecwide-ssd/test/chunks/D_19_14 femu@node06:/mnt/nvme4/D_19_14
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_2
ssh femu@node06 'rm -f /mnt/nvme5/L_19_2'
scp /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_14 on rack 6" >> placedway/update_log.txt

# Update block D_19_15 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_15...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_15
ssh femu@node08 'rm -f /mnt/nvme0/D_19_15'
scp /home/femu/ecwide-ssd/test/chunks/D_19_15 femu@node08:/mnt/nvme0/D_19_15
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_3
ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'
scp /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_15 on rack 8" >> placedway/update_log.txt

# Update block D_19_16 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_16...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_16
ssh femu@node08 'rm -f /mnt/nvme1/D_19_16'
scp /home/femu/ecwide-ssd/test/chunks/D_19_16 femu@node08:/mnt/nvme1/D_19_16
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_3
ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'
scp /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_16 on rack 8" >> placedway/update_log.txt

# Update block D_19_17 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_17...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_17
ssh femu@node08 'rm -f /mnt/nvme2/D_19_17'
scp /home/femu/ecwide-ssd/test/chunks/D_19_17 femu@node08:/mnt/nvme2/D_19_17
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_3
ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'
scp /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_17 on rack 8" >> placedway/update_log.txt

# Update block D_19_18 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_18...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_18
ssh femu@node08 'rm -f /mnt/nvme3/D_19_18'
scp /home/femu/ecwide-ssd/test/chunks/D_19_18 femu@node08:/mnt/nvme3/D_19_18
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_3
ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'
scp /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_18 on rack 8" >> placedway/update_log.txt

# Update block D_19_19 (impacts R08, R05, R07)
echo '[$(date +%H:%M:%S)] Updating D_19_19...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_19_19
ssh femu@node08 'rm -f /mnt/nvme4/D_19_19'
scp /home/femu/ecwide-ssd/test/chunks/D_19_19 femu@node08:/mnt/nvme4/D_19_19
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_19_3
ssh femu@node08 'rm -f /mnt/nvme5/L_19_3'
scp /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_0
ssh femu@node05 'rm -f /mnt/nvme3/G_19_0'
scp /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_19_1
ssh femu@node07 'rm -f /mnt/nvme4/G_19_1'
scp /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
sleep 0.01

echo "20250414024139 - Updated D_19_19 on rack 8" >> placedway/update_log.txt

# Update block D_20_0 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_20_0...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_0
ssh femu@node02 'rm -f /mnt/nvme0/D_20_0'
scp /home/femu/ecwide-ssd/test/chunks/D_20_0 femu@node02:/mnt/nvme0/D_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_0
ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'
scp /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_0 on rack 2" >> placedway/update_log.txt

# Update block D_20_1 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_20_1...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_1
ssh femu@node02 'rm -f /mnt/nvme1/D_20_1'
scp /home/femu/ecwide-ssd/test/chunks/D_20_1 femu@node02:/mnt/nvme1/D_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_0
ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'
scp /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_1 on rack 2" >> placedway/update_log.txt

# Update block D_20_2 (impacts R02, R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_20_2...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_2
ssh femu@node02 'rm -f /mnt/nvme2/D_20_2'
scp /home/femu/ecwide-ssd/test/chunks/D_20_2 femu@node02:/mnt/nvme2/D_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_0
ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'
scp /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_2 on rack 2" >> placedway/update_log.txt

# Update block D_20_3 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_20_3...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_3
ssh femu@node01 'rm -f /mnt/nvme3/D_20_3'
scp /home/femu/ecwide-ssd/test/chunks/D_20_3 femu@node01:/mnt/nvme3/D_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_0
ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'
scp /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_3 on rack 1" >> placedway/update_log.txt

# Update block D_20_4 (impacts R01, R08)
echo '[$(date +%H:%M:%S)] Updating D_20_4...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_4
ssh femu@node01 'rm -f /mnt/nvme4/D_20_4'
scp /home/femu/ecwide-ssd/test/chunks/D_20_4 femu@node01:/mnt/nvme4/D_20_4
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_0
ssh femu@node01 'rm -f /mnt/nvme5/L_20_0'
scp /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_4 on rack 1" >> placedway/update_log.txt

# Update block D_20_5 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_5...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_5
ssh femu@node03 'rm -f /mnt/nvme0/D_20_5'
scp /home/femu/ecwide-ssd/test/chunks/D_20_5 femu@node03:/mnt/nvme0/D_20_5
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_1
ssh femu@node03 'rm -f /mnt/nvme5/L_20_1'
scp /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_5 on rack 3" >> placedway/update_log.txt

# Update block D_20_6 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_6...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_6
ssh femu@node03 'rm -f /mnt/nvme1/D_20_6'
scp /home/femu/ecwide-ssd/test/chunks/D_20_6 femu@node03:/mnt/nvme1/D_20_6
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_1
ssh femu@node03 'rm -f /mnt/nvme5/L_20_1'
scp /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_6 on rack 3" >> placedway/update_log.txt

# Update block D_20_7 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_7...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_7
ssh femu@node03 'rm -f /mnt/nvme2/D_20_7'
scp /home/femu/ecwide-ssd/test/chunks/D_20_7 femu@node03:/mnt/nvme2/D_20_7
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_1
ssh femu@node03 'rm -f /mnt/nvme5/L_20_1'
scp /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_7 on rack 3" >> placedway/update_log.txt

# Update block D_20_8 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_8...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_8
ssh femu@node03 'rm -f /mnt/nvme3/D_20_8'
scp /home/femu/ecwide-ssd/test/chunks/D_20_8 femu@node03:/mnt/nvme3/D_20_8
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_1
ssh femu@node03 'rm -f /mnt/nvme5/L_20_1'
scp /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_8 on rack 3" >> placedway/update_log.txt

# Update block D_20_9 (impacts R03, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_9...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_9
ssh femu@node03 'rm -f /mnt/nvme4/D_20_9'
scp /home/femu/ecwide-ssd/test/chunks/D_20_9 femu@node03:/mnt/nvme4/D_20_9
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_1
ssh femu@node03 'rm -f /mnt/nvme5/L_20_1'
scp /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_9 on rack 3" >> placedway/update_log.txt

# Update block D_20_10 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_10...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_10
ssh femu@node05 'rm -f /mnt/nvme0/D_20_10'
scp /home/femu/ecwide-ssd/test/chunks/D_20_10 femu@node05:/mnt/nvme0/D_20_10
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_2
ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'
scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_10 on rack 5" >> placedway/update_log.txt

# Update block D_20_11 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_11...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_11
ssh femu@node05 'rm -f /mnt/nvme1/D_20_11'
scp /home/femu/ecwide-ssd/test/chunks/D_20_11 femu@node05:/mnt/nvme1/D_20_11
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_2
ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'
scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_11 on rack 5" >> placedway/update_log.txt

# Update block D_20_12 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_12...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_12
ssh femu@node05 'rm -f /mnt/nvme2/D_20_12'
scp /home/femu/ecwide-ssd/test/chunks/D_20_12 femu@node05:/mnt/nvme2/D_20_12
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_2
ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'
scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_12 on rack 5" >> placedway/update_log.txt

# Update block D_20_13 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_13...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_13
ssh femu@node05 'rm -f /mnt/nvme3/D_20_13'
scp /home/femu/ecwide-ssd/test/chunks/D_20_13 femu@node05:/mnt/nvme3/D_20_13
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_2
ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'
scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_13 on rack 5" >> placedway/update_log.txt

# Update block D_20_14 (impacts R05, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_14...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_14
ssh femu@node05 'rm -f /mnt/nvme4/D_20_14'
scp /home/femu/ecwide-ssd/test/chunks/D_20_14 femu@node05:/mnt/nvme4/D_20_14
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_2
ssh femu@node05 'rm -f /mnt/nvme5/L_20_2'
scp /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_14 on rack 5" >> placedway/update_log.txt

# Update block D_20_15 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_15...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_15
ssh femu@node07 'rm -f /mnt/nvme0/D_20_15'
scp /home/femu/ecwide-ssd/test/chunks/D_20_15 femu@node07:/mnt/nvme0/D_20_15
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_3
ssh femu@node07 'rm -f /mnt/nvme5/L_20_3'
scp /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_15 on rack 7" >> placedway/update_log.txt

# Update block D_20_16 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_16...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_16
ssh femu@node07 'rm -f /mnt/nvme1/D_20_16'
scp /home/femu/ecwide-ssd/test/chunks/D_20_16 femu@node07:/mnt/nvme1/D_20_16
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_3
ssh femu@node07 'rm -f /mnt/nvme5/L_20_3'
scp /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_16 on rack 7" >> placedway/update_log.txt

# Update block D_20_17 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_17...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_17
ssh femu@node07 'rm -f /mnt/nvme2/D_20_17'
scp /home/femu/ecwide-ssd/test/chunks/D_20_17 femu@node07:/mnt/nvme2/D_20_17
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_3
ssh femu@node07 'rm -f /mnt/nvme5/L_20_3'
scp /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_17 on rack 7" >> placedway/update_log.txt

# Update block D_20_18 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_18...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_18
ssh femu@node07 'rm -f /mnt/nvme3/D_20_18'
scp /home/femu/ecwide-ssd/test/chunks/D_20_18 femu@node07:/mnt/nvme3/D_20_18
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_3
ssh femu@node07 'rm -f /mnt/nvme5/L_20_3'
scp /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_18 on rack 7" >> placedway/update_log.txt

# Update block D_20_19 (impacts R07, R08, R01)
echo '[$(date +%H:%M:%S)] Updating D_20_19...'
echo "Updated content 20250414024139" > /home/femu/ecwide-ssd/test/chunks/D_20_19
ssh femu@node07 'rm -f /mnt/nvme4/D_20_19'
scp /home/femu/ecwide-ssd/test/chunks/D_20_19 femu@node07:/mnt/nvme4/D_20_19
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/L_20_3
ssh femu@node07 'rm -f /mnt/nvme5/L_20_3'
scp /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_0
ssh femu@node08 'rm -f /mnt/nvme1/G_20_0'
scp /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
echo "Updated parity 20250414024139" > /home/femu/ecwide-ssd/test/chunks/G_20_1
ssh femu@node01 'rm -f /mnt/nvme2/G_20_1'
scp /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
sleep 0.01

echo "20250414024139 - Updated D_20_19 on rack 7" >> placedway/update_log.txt

# Update complete, print summary
echo
echo 'Update Summary:'
echo '---------------'
echo 'Total blocks updated: 400'
echo 'Rack write impact:'
echo '  R01: 220 writes'
echo '  R02: 180 writes'
echo '  R03: 200 writes'
echo '  R04: 200 writes'
echo '  R05: 200 writes'
echo '  R06: 200 writes'
echo '  R07: 200 writes'
echo '  R08: 200 writes'
echo
echo 'Batch update completed at $(date)'
