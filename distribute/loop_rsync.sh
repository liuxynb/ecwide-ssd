#!/bin/bash

FILE="./test"  # 当前目录下生成文件

while true; do
  echo "[*] Generating 256MB file in current directory..."
  dd if=/dev/zero of="$FILE" bs=1M count=64 status=none

  echo "[*] Removing old file on node02..."
  ssh femu@node02 'rm -f /mnt/nvme0/D_1_0'

  echo "[*] Transferring file to node02..."
  rsync -azP "$FILE" femu@node02:/mnt/nvme0/D_1_0

  echo "[*] One round done."
done