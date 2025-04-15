#!/bin/bash

# 设置虚拟机用户名、密码和节点数量
USER="femu"
PASSWORD="femu"
NODE_PREFIX="node"
NODE_COUNT=9  # 根据你有多少台 nodeXX 设置

# 要执行的命令
REMOTE_CMD="sudo chown -R femu:femu /mnt/nvme0 /mnt/nvme1 /mnt/nvme2 /mnt/nvme3 /mnt/nvme4 /mnt/nvme5"

# 遍历每个节点
for i in $(seq -w 1 $NODE_COUNT); do
  HOST="$USER@${NODE_PREFIX}${i}"
  echo "[*] Logging into $HOST and running command..."

  sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$HOST" "$REMOTE_CMD"

  echo "[✔] Finished on $HOST"
  echo "--------------------------------------"
done