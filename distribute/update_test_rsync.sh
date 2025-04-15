#!/bin/bash

# 参数配置
LOCAL_PATH="/home/femu/ecwide-ssd/test/chunks"
FILENAME="D_16_4"
FULL_LOCAL_PATH="$LOCAL_PATH/$FILENAME"
REMOTE_NODE="node01"
REMOTE_PATH="/mnt/nvme4/$FILENAME"
BLOCK_SIZE=33554432  # 32MB
COUNT=1
USER="femu"
REPEAT=1000  # 默认重复次数

# 如果有传参就用传参控制重复次数
if [ $# -ge 1 ]; then
    REPEAT=$1
fi

echo "Starting to generate and upload $FILENAME $REPEAT times..."

for ((i=1; i<=REPEAT; i++)); do
    echo "[$i/$REPEAT] Generating random data..."
    dd if=/dev/urandom bs=$BLOCK_SIZE count=$COUNT of="$FULL_LOCAL_PATH" 2>/dev/null

    echo "[$i/$REPEAT] Uploading to $REMOTE_NODE:$REMOTE_PATH..."
    rsync -azP "$FULL_LOCAL_PATH" "$USER@$REMOTE_NODE:$REMOTE_PATH"

    echo "[$i/$REPEAT] Done."
done

echo "All done."