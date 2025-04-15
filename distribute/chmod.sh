#!/bin/bash

# 用户、密码与节点数量配置
USER="femu"
PASSWORD="femu"
NODE_PREFIX="node"
NODE_COUNT=9

# 执行命令
REMOTE_CMD="sudo chown -R femu:femu /mnt/nvme0 /mnt/nvme1 /mnt/nvme2 /mnt/nvme3 /mnt/nvme4 /mnt/nvme5"

# 执行循环
for i in $(seq -w 1 $NODE_COUNT); do
  HOST="${USER}@${NODE_PREFIX}${i}"  # 注意这里用的是 ${i}
  echo "[*] Logging into $HOST and running command..."

  sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$HOST" "$REMOTE_CMD"

  echo "[✔] Finished on $HOST"
  echo "--------------------------------------"
done