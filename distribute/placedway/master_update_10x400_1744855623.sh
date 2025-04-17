#!/bin/bash

# Master script to run 10 batch update scripts
# Each batch updates 400 random blocks
# Generated on 2025-04-17 02:07:03

echo '======================================================'
echo 'Starting execution of 10 batch updates'
echo '======================================================'

# Change to output directory
cd "/home/lxy/ecwide-ssd/distribute/placedway"

echo
echo '======================================================'
echo 'Executing batch 1/10: batch_update_1_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_1_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 2/10: batch_update_2_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_2_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 3/10: batch_update_3_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_3_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 4/10: batch_update_4_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_4_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 5/10: batch_update_5_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_5_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 6/10: batch_update_6_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_6_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 7/10: batch_update_7_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_7_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 8/10: batch_update_8_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_8_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 9/10: batch_update_9_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_9_of_10_400_1744855623.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 10/10: batch_update_10_of_10_400_1744855623.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_10_of_10_400_1744855623.sh"

echo
echo '======================================================'
echo 'All batch updates completed successfully!'
echo 'Finished at: '$(date)
echo '======================================================'
