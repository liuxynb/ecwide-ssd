#!/bin/bash

USER="femu"
PASSWORD="femu"
NODE_PREFIX="node"
NODE_COUNT=9

REMOTE_CMD="sudo chown -R femu:femu /mnt/nvme0 /mnt/nvme1 /mnt/nvme2 /mnt/nvme3 /mnt/nvme4 /mnt/nvme5"

for i in $(seq 1 $NODE_COUNT); do
  INDEX=$(printf "%02d" $i)
  NODE_NAME="${NODE_PREFIX}${INDEX}"
  HOST="${USER}@${NODE_NAME}"

  echo "[*] Logging into $HOST and running command..."

  sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$HOST" "$REMOTE_CMD"

  echo "[✔] Finished on $HOST"
  echo "--------------------------------------"
done