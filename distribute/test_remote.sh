#!/bin/bash

# ====================
# 模拟远端 SSD 磨损脚本
# ====================

# 配置项
REMOTE_NODE="node02"
REMOTE_USER="femu"
REMOTE_PATH="/mnt/nvme0"
BLOCK_NAME="D_1_0"
BLOCK_SIZE="128M"
REPEAT=1000             # 写入次数
SLEEP_INTERVAL=0      # 每次写入后休眠秒数（可为 0）

echo "[INFO] 开始模拟远端磨损：$REMOTE_NODE:$REMOTE_PATH/$BLOCK_NAME"
for ((i=1; i<=REPEAT; i++)); do
    echo "[INFO] 第 $i 次写入..."
    ssh ${REMOTE_USER}@${REMOTE_NODE} "dd if=/dev/urandom of=${REMOTE_PATH}/${BLOCK_NAME} bs=${BLOCK_SIZE} count=1 iflag=fullblock status=none"
    
    if [ $? -ne 0 ]; then
        echo "[ERROR] 第 $i 次写入失败，跳出循环。"
        break
    fi

    sleep $SLEEP_INTERVAL
done

echo "[INFO] 模拟完成。"