#!/bin/bash

FILE="./test"  # 当前目录下生成文件

while true; do
  echo "[*] Generating 256MB file in current directory..."
  dd if=/dev/zero of="$FILE" bs=1M count=256 status=none

  echo "[*] Removing old file on node01..."
  ssh femu@node01 'rm -f /mnt/nvme0/D_1_0'

  echo "[*] Transferring file to node01..."
  rsync -azP "$FILE" femu@node01:/mnt/nvme0/D_1_0

  echo "[*] One round done. Sleep 1s."
  sleep 1
done