#!/bin/bash

LOCAL_FILE="/home/femu/ecwide-ssd/test/chunks/G_1_0"
REMOTE_USER="femu"
REMOTE_HOST="node01"
REMOTE_PATH="/mnt/nvme3/G_1_0"

while true; do
  # 当前时间戳
  TIMESTAMP=$(date +%Y%m%d%H%M%S)

  echo "[*] Updating file G_1_0 at $TIMESTAMP..."

  # 获取本地文件大小（若文件不存在，则默认 1MB）
  FILESIZE=$(stat -c%s "$LOCAL_FILE" 2>/dev/null || echo 1048576)

  # 生成更新后的内容，并写入本地文件
  dd if=/dev/urandom bs=$FILESIZE count=1 2>/dev/null \
    | sed "s/^/UpdatedParity_${TIMESTAMP}_1_9_/" \
    | head -c $FILESIZE > "$LOCAL_FILE"

  # 传输到远端节点
  echo "[*] Transferring to $REMOTE_HOST:$REMOTE_PATH..."
  scp "$LOCAL_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

  echo "[✔] Done. Sleeping 0.1 seconds..."
  echo "-----------------------------------------"
  sleep 0.1
done