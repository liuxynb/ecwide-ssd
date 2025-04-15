#!/bin/bash

FILE="./test"  # 当前目录下生成的文件
COUNT=1        # 初始化计数器

# 第一次执行前先检查文件是否存在，不存在就生成
if [ ! -f "$FILE" ]; then
  echo "[*] Generating 64MB file in current directory..."
  dd if=/dev/zero of="$FILE" bs=1M count=64 status=none
fi

# 无限循环复用该文件传输
while true; do
  echo "[*] Round $COUNT: Transferring file to node01..."
  scp "$FILE" femu@node01:/mnt/nvme0/D_1_0

  echo "[*] Round $COUNT done."
  echo "-----------------------------------------"

  ((COUNT++))  # 计数器加一
done