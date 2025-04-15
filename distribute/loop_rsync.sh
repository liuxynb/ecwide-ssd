#!/bin/bash

FILE="./test"  # 当前目录下生成文件
COUNT=1        # 初始化计数器

while true; do
  echo "[*] Round $COUNT: Generating 64MB file in current directory..."
  dd if=/dev/zero of="$FILE" bs=1M count=64 status=none

  # echo "[*] Round $COUNT: Removing old file on node01..."
  # ssh femu@node01 'rm -f /mnt/nvme0/D_1_0'

  echo "[*] Round $COUNT: Transferring file to node01..."
  rsync -azP "$FILE" femu@node01:/mnt/nvme0/D_1_0

  echo "[*] Round $COUNT done."
  echo "-----------------------------------------"

  ((COUNT++))  # 计数器加一
done