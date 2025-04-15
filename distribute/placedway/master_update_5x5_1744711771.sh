#!/bin/bash

# Master script to run 5 batch update scripts
# Each batch updates 5 random blocks
# Generated on 2025-04-15 10:09:31

echo '======================================================'
echo 'Starting execution of 5 batch updates'
echo '======================================================'

# Change to output directory
cd "/home/lxy/ecwide-ssd/distribute/placedway"

echo
echo '======================================================'
echo 'Executing batch 1/5: batch_update_1_of_5_5_1744711771.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_1_of_5_5_1744711771.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 2/5: batch_update_2_of_5_5_1744711771.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_2_of_5_5_1744711771.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 3/5: batch_update_3_of_5_5_1744711771.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_3_of_5_5_1744711771.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 4/5: batch_update_4_of_5_5_1744711771.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_4_of_5_5_1744711771.sh"

# Short delay between batches
sleep 1

echo
echo '======================================================'
echo 'Executing batch 5/5: batch_update_5_of_5_5_1744711771.sh'
echo 'Started at: '$(date)
echo '======================================================'
"./batch_update_5_of_5_5_1744711771.sh"

echo
echo '======================================================'
echo 'All batch updates completed successfully!'
echo 'Finished at: '$(date)
echo '======================================================'
