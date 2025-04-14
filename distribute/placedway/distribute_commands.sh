#!/bin/bash

# Generated distribution commands for 8 nodes, 20 stripes

# Ensure local source directory exists
mkdir -p /home/femu/ecwide-ssd/test/chunks

# Node 01 distribution
ssh femu@node01 'mkdir -p /mnt/nvme0'
ssh femu@node01 'mkdir -p /mnt/nvme1'
ssh femu@node01 'mkdir -p /mnt/nvme2'
ssh femu@node01 'mkdir -p /mnt/nvme3'
ssh femu@node01 'mkdir -p /mnt/nvme4'
ssh femu@node01 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_0 femu@node01:/mnt/nvme0/D_11_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_0 femu@node01:/mnt/nvme0/D_13_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_0 femu@node01:/mnt/nvme0/D_15_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_0 femu@node01:/mnt/nvme0/D_17_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_0 femu@node01:/mnt/nvme0/D_19_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_0 femu@node01:/mnt/nvme0/D_1_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_0 femu@node01:/mnt/nvme0/D_3_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_0 femu@node01:/mnt/nvme0/D_5_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_0 femu@node01:/mnt/nvme0/D_7_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_0 femu@node01:/mnt/nvme0/D_9_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_1 femu@node01:/mnt/nvme0/G_8_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_1 femu@node01:/mnt/nvme1/D_11_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_1 femu@node01:/mnt/nvme1/D_13_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_1 femu@node01:/mnt/nvme1/D_15_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_1 femu@node01:/mnt/nvme1/D_17_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_1 femu@node01:/mnt/nvme1/D_19_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_1 femu@node01:/mnt/nvme1/D_1_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_1 femu@node01:/mnt/nvme1/D_3_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_1 femu@node01:/mnt/nvme1/D_5_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_1 femu@node01:/mnt/nvme1/D_7_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_1 femu@node01:/mnt/nvme1/D_9_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_1 femu@node01:/mnt/nvme1/G_12_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_1 femu@node01:/mnt/nvme1/G_16_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_1 femu@node01:/mnt/nvme1/G_4_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_2 femu@node01:/mnt/nvme2/D_11_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_2 femu@node01:/mnt/nvme2/D_13_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_2 femu@node01:/mnt/nvme2/D_15_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_2 femu@node01:/mnt/nvme2/D_17_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_2 femu@node01:/mnt/nvme2/D_19_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_2 femu@node01:/mnt/nvme2/D_1_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_2 femu@node01:/mnt/nvme2/D_3_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_2 femu@node01:/mnt/nvme2/D_5_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_2 femu@node01:/mnt/nvme2/D_7_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_2 femu@node01:/mnt/nvme2/D_9_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_1 femu@node01:/mnt/nvme2/G_20_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_3 femu@node01:/mnt/nvme3/D_10_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_3 femu@node01:/mnt/nvme3/D_12_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_3 femu@node01:/mnt/nvme3/D_14_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_3 femu@node01:/mnt/nvme3/D_16_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_3 femu@node01:/mnt/nvme3/D_18_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_3 femu@node01:/mnt/nvme3/D_20_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_3 femu@node01:/mnt/nvme3/D_2_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_3 femu@node01:/mnt/nvme3/D_4_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_3 femu@node01:/mnt/nvme3/D_6_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_3 femu@node01:/mnt/nvme3/D_8_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_0 femu@node01:/mnt/nvme3/G_1_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_4 femu@node01:/mnt/nvme4/D_10_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_4 femu@node01:/mnt/nvme4/D_12_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_4 femu@node01:/mnt/nvme4/D_14_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_4 femu@node01:/mnt/nvme4/D_16_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_4 femu@node01:/mnt/nvme4/D_18_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_4 femu@node01:/mnt/nvme4/D_20_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_4 femu@node01:/mnt/nvme4/D_2_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_4 femu@node01:/mnt/nvme4/D_4_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_4 femu@node01:/mnt/nvme4/D_6_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_4 femu@node01:/mnt/nvme4/D_8_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_0 femu@node01:/mnt/nvme5/L_10_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_0 femu@node01:/mnt/nvme5/L_12_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_0 femu@node01:/mnt/nvme5/L_14_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_0 femu@node01:/mnt/nvme5/L_16_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_0 femu@node01:/mnt/nvme5/L_18_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_0 femu@node01:/mnt/nvme5/L_20_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_0 femu@node01:/mnt/nvme5/L_2_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_0 femu@node01:/mnt/nvme5/L_4_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_0 femu@node01:/mnt/nvme5/L_6_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_0 femu@node01:/mnt/nvme5/L_8_0

# Node 02 distribution
ssh femu@node02 'mkdir -p /mnt/nvme3'
ssh femu@node02 'mkdir -p /mnt/nvme4'
ssh femu@node02 'mkdir -p /mnt/nvme5'
ssh femu@node02 'mkdir -p /mnt/nvme0'
ssh femu@node02 'mkdir -p /mnt/nvme1'
ssh femu@node02 'mkdir -p /mnt/nvme2'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_3 femu@node02:/mnt/nvme3/D_11_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_3 femu@node02:/mnt/nvme3/D_13_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_3 femu@node02:/mnt/nvme3/D_15_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_3 femu@node02:/mnt/nvme3/D_17_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_3 femu@node02:/mnt/nvme3/D_19_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_3 femu@node02:/mnt/nvme3/D_1_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_3 femu@node02:/mnt/nvme3/D_3_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_3 femu@node02:/mnt/nvme3/D_5_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_3 femu@node02:/mnt/nvme3/D_7_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_3 femu@node02:/mnt/nvme3/D_9_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_4 femu@node02:/mnt/nvme4/D_11_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_4 femu@node02:/mnt/nvme4/D_13_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_4 femu@node02:/mnt/nvme4/D_15_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_4 femu@node02:/mnt/nvme4/D_17_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_4 femu@node02:/mnt/nvme4/D_19_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_4 femu@node02:/mnt/nvme4/D_1_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_4 femu@node02:/mnt/nvme4/D_3_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_4 femu@node02:/mnt/nvme4/D_5_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_4 femu@node02:/mnt/nvme4/D_7_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_4 femu@node02:/mnt/nvme4/D_9_4
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_0 femu@node02:/mnt/nvme5/L_11_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_0 femu@node02:/mnt/nvme5/L_13_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_0 femu@node02:/mnt/nvme5/L_15_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_0 femu@node02:/mnt/nvme5/L_17_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_0 femu@node02:/mnt/nvme5/L_19_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_0 femu@node02:/mnt/nvme5/L_1_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_0 femu@node02:/mnt/nvme5/L_3_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_0 femu@node02:/mnt/nvme5/L_5_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_0 femu@node02:/mnt/nvme5/L_7_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_0 femu@node02:/mnt/nvme5/L_9_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_0 femu@node02:/mnt/nvme0/D_10_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_0 femu@node02:/mnt/nvme0/D_12_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_0 femu@node02:/mnt/nvme0/D_14_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_0 femu@node02:/mnt/nvme0/D_16_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_0 femu@node02:/mnt/nvme0/D_18_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_0 femu@node02:/mnt/nvme0/D_20_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_0 femu@node02:/mnt/nvme0/D_2_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_0 femu@node02:/mnt/nvme0/D_4_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_0 femu@node02:/mnt/nvme0/D_6_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_0 femu@node02:/mnt/nvme0/D_8_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_1 femu@node02:/mnt/nvme1/D_10_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_1 femu@node02:/mnt/nvme1/D_12_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_1 femu@node02:/mnt/nvme1/D_14_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_1 femu@node02:/mnt/nvme1/D_16_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_1 femu@node02:/mnt/nvme1/D_18_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_1 femu@node02:/mnt/nvme1/D_20_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_1 femu@node02:/mnt/nvme1/D_2_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_1 femu@node02:/mnt/nvme1/D_4_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_1 femu@node02:/mnt/nvme1/D_6_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_1 femu@node02:/mnt/nvme1/D_8_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_2 femu@node02:/mnt/nvme2/D_10_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_2 femu@node02:/mnt/nvme2/D_12_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_2 femu@node02:/mnt/nvme2/D_14_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_2 femu@node02:/mnt/nvme2/D_16_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_2 femu@node02:/mnt/nvme2/D_18_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_2 femu@node02:/mnt/nvme2/D_20_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_2 femu@node02:/mnt/nvme2/D_2_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_2 femu@node02:/mnt/nvme2/D_4_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_2 femu@node02:/mnt/nvme2/D_6_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_2 femu@node02:/mnt/nvme2/D_8_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_0 femu@node02:/mnt/nvme2/G_13_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_1 femu@node02:/mnt/nvme2/G_15_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_0 femu@node02:/mnt/nvme2/G_3_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_1 femu@node02:/mnt/nvme2/G_5_1

# Node 03 distribution
ssh femu@node03 'mkdir -p /mnt/nvme4'
ssh femu@node03 'mkdir -p /mnt/nvme0'
ssh femu@node03 'mkdir -p /mnt/nvme1'
ssh femu@node03 'mkdir -p /mnt/nvme2'
ssh femu@node03 'mkdir -p /mnt/nvme3'
ssh femu@node03 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_9 femu@node03:/mnt/nvme4/D_10_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_9 femu@node03:/mnt/nvme4/D_12_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_9 femu@node03:/mnt/nvme4/D_14_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_9 femu@node03:/mnt/nvme4/D_16_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_9 femu@node03:/mnt/nvme4/D_18_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_9 femu@node03:/mnt/nvme4/D_20_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_9 femu@node03:/mnt/nvme4/D_2_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_9 femu@node03:/mnt/nvme4/D_4_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_9 femu@node03:/mnt/nvme4/D_6_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_9 femu@node03:/mnt/nvme4/D_8_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_1 femu@node03:/mnt/nvme4/G_17_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_1_1 femu@node03:/mnt/nvme4/G_1_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_1 femu@node03:/mnt/nvme4/G_9_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_5 femu@node03:/mnt/nvme0/D_10_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_5 femu@node03:/mnt/nvme0/D_12_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_5 femu@node03:/mnt/nvme0/D_14_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_5 femu@node03:/mnt/nvme0/D_16_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_5 femu@node03:/mnt/nvme0/D_18_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_5 femu@node03:/mnt/nvme0/D_20_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_5 femu@node03:/mnt/nvme0/D_2_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_5 femu@node03:/mnt/nvme0/D_4_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_5 femu@node03:/mnt/nvme0/D_6_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_5 femu@node03:/mnt/nvme0/D_8_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_6 femu@node03:/mnt/nvme1/D_10_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_6 femu@node03:/mnt/nvme1/D_12_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_6 femu@node03:/mnt/nvme1/D_14_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_6 femu@node03:/mnt/nvme1/D_16_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_6 femu@node03:/mnt/nvme1/D_18_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_6 femu@node03:/mnt/nvme1/D_20_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_6 femu@node03:/mnt/nvme1/D_2_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_6 femu@node03:/mnt/nvme1/D_4_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_6 femu@node03:/mnt/nvme1/D_6_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_6 femu@node03:/mnt/nvme1/D_8_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_7 femu@node03:/mnt/nvme2/D_10_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_7 femu@node03:/mnt/nvme2/D_12_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_7 femu@node03:/mnt/nvme2/D_14_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_7 femu@node03:/mnt/nvme2/D_16_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_7 femu@node03:/mnt/nvme2/D_18_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_7 femu@node03:/mnt/nvme2/D_20_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_7 femu@node03:/mnt/nvme2/D_2_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_7 femu@node03:/mnt/nvme2/D_4_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_7 femu@node03:/mnt/nvme2/D_6_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_7 femu@node03:/mnt/nvme2/D_8_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_8 femu@node03:/mnt/nvme3/D_10_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_8 femu@node03:/mnt/nvme3/D_12_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_8 femu@node03:/mnt/nvme3/D_14_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_8 femu@node03:/mnt/nvme3/D_16_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_8 femu@node03:/mnt/nvme3/D_18_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_8 femu@node03:/mnt/nvme3/D_20_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_8 femu@node03:/mnt/nvme3/D_2_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_8 femu@node03:/mnt/nvme3/D_4_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_8 femu@node03:/mnt/nvme3/D_6_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_8 femu@node03:/mnt/nvme3/D_8_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_13_1 femu@node03:/mnt/nvme3/G_13_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_0 femu@node03:/mnt/nvme3/G_7_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_1 femu@node03:/mnt/nvme5/L_10_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_1 femu@node03:/mnt/nvme5/L_12_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_1 femu@node03:/mnt/nvme5/L_14_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_1 femu@node03:/mnt/nvme5/L_16_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_1 femu@node03:/mnt/nvme5/L_18_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_1 femu@node03:/mnt/nvme5/L_20_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_1 femu@node03:/mnt/nvme5/L_2_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_1 femu@node03:/mnt/nvme5/L_4_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_1 femu@node03:/mnt/nvme5/L_6_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_1 femu@node03:/mnt/nvme5/L_8_1

# Node 04 distribution
ssh femu@node04 'mkdir -p /mnt/nvme0'
ssh femu@node04 'mkdir -p /mnt/nvme1'
ssh femu@node04 'mkdir -p /mnt/nvme2'
ssh femu@node04 'mkdir -p /mnt/nvme3'
ssh femu@node04 'mkdir -p /mnt/nvme4'
ssh femu@node04 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_5 femu@node04:/mnt/nvme0/D_11_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_5 femu@node04:/mnt/nvme0/D_13_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_5 femu@node04:/mnt/nvme0/D_15_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_5 femu@node04:/mnt/nvme0/D_17_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_5 femu@node04:/mnt/nvme0/D_19_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_5 femu@node04:/mnt/nvme0/D_1_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_5 femu@node04:/mnt/nvme0/D_3_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_5 femu@node04:/mnt/nvme0/D_5_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_5 femu@node04:/mnt/nvme0/D_7_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_5 femu@node04:/mnt/nvme0/D_9_5
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_0 femu@node04:/mnt/nvme0/G_14_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_0 femu@node04:/mnt/nvme0/G_2_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_0 femu@node04:/mnt/nvme0/G_6_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_6 femu@node04:/mnt/nvme1/D_11_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_6 femu@node04:/mnt/nvme1/D_13_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_6 femu@node04:/mnt/nvme1/D_15_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_6 femu@node04:/mnt/nvme1/D_17_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_6 femu@node04:/mnt/nvme1/D_19_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_6 femu@node04:/mnt/nvme1/D_1_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_6 femu@node04:/mnt/nvme1/D_3_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_6 femu@node04:/mnt/nvme1/D_5_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_6 femu@node04:/mnt/nvme1/D_7_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_6 femu@node04:/mnt/nvme1/D_9_6
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_0 femu@node04:/mnt/nvme1/G_10_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_7 femu@node04:/mnt/nvme2/D_11_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_7 femu@node04:/mnt/nvme2/D_13_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_7 femu@node04:/mnt/nvme2/D_15_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_7 femu@node04:/mnt/nvme2/D_17_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_7 femu@node04:/mnt/nvme2/D_19_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_7 femu@node04:/mnt/nvme2/D_1_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_7 femu@node04:/mnt/nvme2/D_3_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_7 femu@node04:/mnt/nvme2/D_5_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_7 femu@node04:/mnt/nvme2/D_7_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_7 femu@node04:/mnt/nvme2/D_9_7
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_0 femu@node04:/mnt/nvme2/G_18_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_8 femu@node04:/mnt/nvme3/D_11_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_8 femu@node04:/mnt/nvme3/D_13_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_8 femu@node04:/mnt/nvme3/D_15_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_8 femu@node04:/mnt/nvme3/D_17_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_8 femu@node04:/mnt/nvme3/D_19_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_8 femu@node04:/mnt/nvme3/D_1_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_8 femu@node04:/mnt/nvme3/D_3_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_8 femu@node04:/mnt/nvme3/D_5_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_8 femu@node04:/mnt/nvme3/D_7_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_8 femu@node04:/mnt/nvme3/D_9_8
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_9 femu@node04:/mnt/nvme4/D_11_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_9 femu@node04:/mnt/nvme4/D_13_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_9 femu@node04:/mnt/nvme4/D_15_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_9 femu@node04:/mnt/nvme4/D_17_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_9 femu@node04:/mnt/nvme4/D_19_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_9 femu@node04:/mnt/nvme4/D_1_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_9 femu@node04:/mnt/nvme4/D_3_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_9 femu@node04:/mnt/nvme4/D_5_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_9 femu@node04:/mnt/nvme4/D_7_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_9 femu@node04:/mnt/nvme4/D_9_9
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_1 femu@node04:/mnt/nvme5/L_11_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_1 femu@node04:/mnt/nvme5/L_13_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_1 femu@node04:/mnt/nvme5/L_15_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_1 femu@node04:/mnt/nvme5/L_17_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_1 femu@node04:/mnt/nvme5/L_19_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_1 femu@node04:/mnt/nvme5/L_1_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_1 femu@node04:/mnt/nvme5/L_3_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_1 femu@node04:/mnt/nvme5/L_5_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_1 femu@node04:/mnt/nvme5/L_7_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_1 femu@node04:/mnt/nvme5/L_9_1

# Node 05 distribution
ssh femu@node05 'mkdir -p /mnt/nvme0'
ssh femu@node05 'mkdir -p /mnt/nvme1'
ssh femu@node05 'mkdir -p /mnt/nvme2'
ssh femu@node05 'mkdir -p /mnt/nvme3'
ssh femu@node05 'mkdir -p /mnt/nvme4'
ssh femu@node05 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_10 femu@node05:/mnt/nvme0/D_10_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_10 femu@node05:/mnt/nvme0/D_12_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_10 femu@node05:/mnt/nvme0/D_14_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_10 femu@node05:/mnt/nvme0/D_16_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_10 femu@node05:/mnt/nvme0/D_18_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_10 femu@node05:/mnt/nvme0/D_20_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_10 femu@node05:/mnt/nvme0/D_2_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_10 femu@node05:/mnt/nvme0/D_4_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_10 femu@node05:/mnt/nvme0/D_6_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_10 femu@node05:/mnt/nvme0/D_8_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_11 femu@node05:/mnt/nvme1/D_10_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_11 femu@node05:/mnt/nvme1/D_12_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_11 femu@node05:/mnt/nvme1/D_14_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_11 femu@node05:/mnt/nvme1/D_16_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_11 femu@node05:/mnt/nvme1/D_18_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_11 femu@node05:/mnt/nvme1/D_20_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_11 femu@node05:/mnt/nvme1/D_2_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_11 femu@node05:/mnt/nvme1/D_4_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_11 femu@node05:/mnt/nvme1/D_6_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_11 femu@node05:/mnt/nvme1/D_8_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_12 femu@node05:/mnt/nvme2/D_10_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_12 femu@node05:/mnt/nvme2/D_12_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_12 femu@node05:/mnt/nvme2/D_14_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_12 femu@node05:/mnt/nvme2/D_16_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_12 femu@node05:/mnt/nvme2/D_18_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_12 femu@node05:/mnt/nvme2/D_20_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_12 femu@node05:/mnt/nvme2/D_2_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_12 femu@node05:/mnt/nvme2/D_4_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_12 femu@node05:/mnt/nvme2/D_6_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_12 femu@node05:/mnt/nvme2/D_8_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_13 femu@node05:/mnt/nvme3/D_10_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_13 femu@node05:/mnt/nvme3/D_12_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_13 femu@node05:/mnt/nvme3/D_14_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_13 femu@node05:/mnt/nvme3/D_16_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_13 femu@node05:/mnt/nvme3/D_18_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_13 femu@node05:/mnt/nvme3/D_20_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_13 femu@node05:/mnt/nvme3/D_2_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_13 femu@node05:/mnt/nvme3/D_4_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_13 femu@node05:/mnt/nvme3/D_6_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_13 femu@node05:/mnt/nvme3/D_8_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_0 femu@node05:/mnt/nvme3/G_11_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_0 femu@node05:/mnt/nvme3/G_19_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_3_1 femu@node05:/mnt/nvme3/G_3_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_14 femu@node05:/mnt/nvme4/D_10_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_14 femu@node05:/mnt/nvme4/D_12_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_14 femu@node05:/mnt/nvme4/D_14_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_14 femu@node05:/mnt/nvme4/D_16_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_14 femu@node05:/mnt/nvme4/D_18_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_14 femu@node05:/mnt/nvme4/D_20_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_14 femu@node05:/mnt/nvme4/D_2_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_14 femu@node05:/mnt/nvme4/D_4_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_14 femu@node05:/mnt/nvme4/D_6_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_14 femu@node05:/mnt/nvme4/D_8_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_15_0 femu@node05:/mnt/nvme4/G_15_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_7_1 femu@node05:/mnt/nvme4/G_7_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_2 femu@node05:/mnt/nvme5/L_10_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_2 femu@node05:/mnt/nvme5/L_12_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_2 femu@node05:/mnt/nvme5/L_14_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_2 femu@node05:/mnt/nvme5/L_16_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_2 femu@node05:/mnt/nvme5/L_18_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_2 femu@node05:/mnt/nvme5/L_20_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_2 femu@node05:/mnt/nvme5/L_2_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_2 femu@node05:/mnt/nvme5/L_4_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_2 femu@node05:/mnt/nvme5/L_6_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_2 femu@node05:/mnt/nvme5/L_8_2

# Node 06 distribution
ssh femu@node06 'mkdir -p /mnt/nvme0'
ssh femu@node06 'mkdir -p /mnt/nvme1'
ssh femu@node06 'mkdir -p /mnt/nvme2'
ssh femu@node06 'mkdir -p /mnt/nvme3'
ssh femu@node06 'mkdir -p /mnt/nvme4'
ssh femu@node06 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_10 femu@node06:/mnt/nvme0/D_11_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_10 femu@node06:/mnt/nvme0/D_13_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_10 femu@node06:/mnt/nvme0/D_15_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_10 femu@node06:/mnt/nvme0/D_17_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_10 femu@node06:/mnt/nvme0/D_19_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_10 femu@node06:/mnt/nvme0/D_1_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_10 femu@node06:/mnt/nvme0/D_3_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_10 femu@node06:/mnt/nvme0/D_5_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_10 femu@node06:/mnt/nvme0/D_7_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_10 femu@node06:/mnt/nvme0/D_9_10
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_18_1 femu@node06:/mnt/nvme0/G_18_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_11 femu@node06:/mnt/nvme1/D_11_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_11 femu@node06:/mnt/nvme1/D_13_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_11 femu@node06:/mnt/nvme1/D_15_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_11 femu@node06:/mnt/nvme1/D_17_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_11 femu@node06:/mnt/nvme1/D_19_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_11 femu@node06:/mnt/nvme1/D_1_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_11 femu@node06:/mnt/nvme1/D_3_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_11 femu@node06:/mnt/nvme1/D_5_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_11 femu@node06:/mnt/nvme1/D_7_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_11 femu@node06:/mnt/nvme1/D_9_11
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_14_1 femu@node06:/mnt/nvme1/G_14_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_2_1 femu@node06:/mnt/nvme1/G_2_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_6_1 femu@node06:/mnt/nvme1/G_6_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_12 femu@node06:/mnt/nvme2/D_11_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_12 femu@node06:/mnt/nvme2/D_13_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_12 femu@node06:/mnt/nvme2/D_15_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_12 femu@node06:/mnt/nvme2/D_17_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_12 femu@node06:/mnt/nvme2/D_19_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_12 femu@node06:/mnt/nvme2/D_1_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_12 femu@node06:/mnt/nvme2/D_3_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_12 femu@node06:/mnt/nvme2/D_5_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_12 femu@node06:/mnt/nvme2/D_7_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_12 femu@node06:/mnt/nvme2/D_9_12
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_10_1 femu@node06:/mnt/nvme2/G_10_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_13 femu@node06:/mnt/nvme3/D_11_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_13 femu@node06:/mnt/nvme3/D_13_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_13 femu@node06:/mnt/nvme3/D_15_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_13 femu@node06:/mnt/nvme3/D_17_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_13 femu@node06:/mnt/nvme3/D_19_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_13 femu@node06:/mnt/nvme3/D_1_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_13 femu@node06:/mnt/nvme3/D_3_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_13 femu@node06:/mnt/nvme3/D_5_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_13 femu@node06:/mnt/nvme3/D_7_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_13 femu@node06:/mnt/nvme3/D_9_13
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_14 femu@node06:/mnt/nvme4/D_11_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_14 femu@node06:/mnt/nvme4/D_13_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_14 femu@node06:/mnt/nvme4/D_15_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_14 femu@node06:/mnt/nvme4/D_17_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_14 femu@node06:/mnt/nvme4/D_19_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_14 femu@node06:/mnt/nvme4/D_1_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_14 femu@node06:/mnt/nvme4/D_3_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_14 femu@node06:/mnt/nvme4/D_5_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_14 femu@node06:/mnt/nvme4/D_7_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_14 femu@node06:/mnt/nvme4/D_9_14
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_2 femu@node06:/mnt/nvme5/L_11_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_2 femu@node06:/mnt/nvme5/L_13_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_2 femu@node06:/mnt/nvme5/L_15_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_2 femu@node06:/mnt/nvme5/L_17_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_2 femu@node06:/mnt/nvme5/L_19_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_2 femu@node06:/mnt/nvme5/L_1_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_2 femu@node06:/mnt/nvme5/L_3_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_2 femu@node06:/mnt/nvme5/L_5_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_2 femu@node06:/mnt/nvme5/L_7_2
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_2 femu@node06:/mnt/nvme5/L_9_2

# Node 07 distribution
ssh femu@node07 'mkdir -p /mnt/nvme0'
ssh femu@node07 'mkdir -p /mnt/nvme1'
ssh femu@node07 'mkdir -p /mnt/nvme2'
ssh femu@node07 'mkdir -p /mnt/nvme3'
ssh femu@node07 'mkdir -p /mnt/nvme4'
ssh femu@node07 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_15 femu@node07:/mnt/nvme0/D_10_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_15 femu@node07:/mnt/nvme0/D_12_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_15 femu@node07:/mnt/nvme0/D_14_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_15 femu@node07:/mnt/nvme0/D_16_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_15 femu@node07:/mnt/nvme0/D_18_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_15 femu@node07:/mnt/nvme0/D_20_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_15 femu@node07:/mnt/nvme0/D_2_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_15 femu@node07:/mnt/nvme0/D_4_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_15 femu@node07:/mnt/nvme0/D_6_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_15 femu@node07:/mnt/nvme0/D_8_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_16 femu@node07:/mnt/nvme1/D_10_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_16 femu@node07:/mnt/nvme1/D_12_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_16 femu@node07:/mnt/nvme1/D_14_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_16 femu@node07:/mnt/nvme1/D_16_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_16 femu@node07:/mnt/nvme1/D_18_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_16 femu@node07:/mnt/nvme1/D_20_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_16 femu@node07:/mnt/nvme1/D_2_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_16 femu@node07:/mnt/nvme1/D_4_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_16 femu@node07:/mnt/nvme1/D_6_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_16 femu@node07:/mnt/nvme1/D_8_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_17 femu@node07:/mnt/nvme2/D_10_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_17 femu@node07:/mnt/nvme2/D_12_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_17 femu@node07:/mnt/nvme2/D_14_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_17 femu@node07:/mnt/nvme2/D_16_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_17 femu@node07:/mnt/nvme2/D_18_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_17 femu@node07:/mnt/nvme2/D_20_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_17 femu@node07:/mnt/nvme2/D_2_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_17 femu@node07:/mnt/nvme2/D_4_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_17 femu@node07:/mnt/nvme2/D_6_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_17 femu@node07:/mnt/nvme2/D_8_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_18 femu@node07:/mnt/nvme3/D_10_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_18 femu@node07:/mnt/nvme3/D_12_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_18 femu@node07:/mnt/nvme3/D_14_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_18 femu@node07:/mnt/nvme3/D_16_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_18 femu@node07:/mnt/nvme3/D_18_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_18 femu@node07:/mnt/nvme3/D_20_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_18 femu@node07:/mnt/nvme3/D_2_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_18 femu@node07:/mnt/nvme3/D_4_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_18 femu@node07:/mnt/nvme3/D_6_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_18 femu@node07:/mnt/nvme3/D_8_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_17_0 femu@node07:/mnt/nvme3/G_17_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_9_0 femu@node07:/mnt/nvme3/G_9_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_10_19 femu@node07:/mnt/nvme4/D_10_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_12_19 femu@node07:/mnt/nvme4/D_12_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_14_19 femu@node07:/mnt/nvme4/D_14_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_16_19 femu@node07:/mnt/nvme4/D_16_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_18_19 femu@node07:/mnt/nvme4/D_18_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_20_19 femu@node07:/mnt/nvme4/D_20_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_2_19 femu@node07:/mnt/nvme4/D_2_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_4_19 femu@node07:/mnt/nvme4/D_4_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_6_19 femu@node07:/mnt/nvme4/D_6_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_8_19 femu@node07:/mnt/nvme4/D_8_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_11_1 femu@node07:/mnt/nvme4/G_11_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_19_1 femu@node07:/mnt/nvme4/G_19_1
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_5_0 femu@node07:/mnt/nvme4/G_5_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_10_3 femu@node07:/mnt/nvme5/L_10_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_12_3 femu@node07:/mnt/nvme5/L_12_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_14_3 femu@node07:/mnt/nvme5/L_14_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_16_3 femu@node07:/mnt/nvme5/L_16_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_18_3 femu@node07:/mnt/nvme5/L_18_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_20_3 femu@node07:/mnt/nvme5/L_20_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_2_3 femu@node07:/mnt/nvme5/L_2_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_4_3 femu@node07:/mnt/nvme5/L_4_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_6_3 femu@node07:/mnt/nvme5/L_6_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_8_3 femu@node07:/mnt/nvme5/L_8_3

# Node 08 distribution
ssh femu@node08 'mkdir -p /mnt/nvme0'
ssh femu@node08 'mkdir -p /mnt/nvme1'
ssh femu@node08 'mkdir -p /mnt/nvme2'
ssh femu@node08 'mkdir -p /mnt/nvme3'
ssh femu@node08 'mkdir -p /mnt/nvme4'
ssh femu@node08 'mkdir -p /mnt/nvme5'
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_15 femu@node08:/mnt/nvme0/D_11_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_15 femu@node08:/mnt/nvme0/D_13_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_15 femu@node08:/mnt/nvme0/D_15_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_15 femu@node08:/mnt/nvme0/D_17_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_15 femu@node08:/mnt/nvme0/D_19_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_15 femu@node08:/mnt/nvme0/D_1_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_15 femu@node08:/mnt/nvme0/D_3_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_15 femu@node08:/mnt/nvme0/D_5_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_15 femu@node08:/mnt/nvme0/D_7_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_15 femu@node08:/mnt/nvme0/D_9_15
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_12_0 femu@node08:/mnt/nvme0/G_12_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_16_0 femu@node08:/mnt/nvme0/G_16_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_4_0 femu@node08:/mnt/nvme0/G_4_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_16 femu@node08:/mnt/nvme1/D_11_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_16 femu@node08:/mnt/nvme1/D_13_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_16 femu@node08:/mnt/nvme1/D_15_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_16 femu@node08:/mnt/nvme1/D_17_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_16 femu@node08:/mnt/nvme1/D_19_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_16 femu@node08:/mnt/nvme1/D_1_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_16 femu@node08:/mnt/nvme1/D_3_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_16 femu@node08:/mnt/nvme1/D_5_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_16 femu@node08:/mnt/nvme1/D_7_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_16 femu@node08:/mnt/nvme1/D_9_16
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_20_0 femu@node08:/mnt/nvme1/G_20_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_17 femu@node08:/mnt/nvme2/D_11_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_17 femu@node08:/mnt/nvme2/D_13_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_17 femu@node08:/mnt/nvme2/D_15_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_17 femu@node08:/mnt/nvme2/D_17_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_17 femu@node08:/mnt/nvme2/D_19_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_17 femu@node08:/mnt/nvme2/D_1_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_17 femu@node08:/mnt/nvme2/D_3_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_17 femu@node08:/mnt/nvme2/D_5_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_17 femu@node08:/mnt/nvme2/D_7_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_17 femu@node08:/mnt/nvme2/D_9_17
rsync -azP /home/femu/ecwide-ssd/test/chunks/G_8_0 femu@node08:/mnt/nvme2/G_8_0
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_18 femu@node08:/mnt/nvme3/D_11_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_18 femu@node08:/mnt/nvme3/D_13_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_18 femu@node08:/mnt/nvme3/D_15_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_18 femu@node08:/mnt/nvme3/D_17_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_18 femu@node08:/mnt/nvme3/D_19_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_18 femu@node08:/mnt/nvme3/D_1_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_18 femu@node08:/mnt/nvme3/D_3_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_18 femu@node08:/mnt/nvme3/D_5_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_18 femu@node08:/mnt/nvme3/D_7_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_18 femu@node08:/mnt/nvme3/D_9_18
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_11_19 femu@node08:/mnt/nvme4/D_11_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_13_19 femu@node08:/mnt/nvme4/D_13_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_15_19 femu@node08:/mnt/nvme4/D_15_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_17_19 femu@node08:/mnt/nvme4/D_17_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_19_19 femu@node08:/mnt/nvme4/D_19_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_19 femu@node08:/mnt/nvme4/D_1_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_3_19 femu@node08:/mnt/nvme4/D_3_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_5_19 femu@node08:/mnt/nvme4/D_5_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_7_19 femu@node08:/mnt/nvme4/D_7_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/D_9_19 femu@node08:/mnt/nvme4/D_9_19
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_11_3 femu@node08:/mnt/nvme5/L_11_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_13_3 femu@node08:/mnt/nvme5/L_13_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_15_3 femu@node08:/mnt/nvme5/L_15_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_17_3 femu@node08:/mnt/nvme5/L_17_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_19_3 femu@node08:/mnt/nvme5/L_19_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_1_3 femu@node08:/mnt/nvme5/L_1_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_3_3 femu@node08:/mnt/nvme5/L_3_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_5_3 femu@node08:/mnt/nvme5/L_5_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_7_3 femu@node08:/mnt/nvme5/L_7_3
rsync -azP /home/femu/ecwide-ssd/test/chunks/L_9_3 femu@node08:/mnt/nvme5/L_9_3

