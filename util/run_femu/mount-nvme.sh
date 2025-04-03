#!/bin/bash

# 磁盘设备列表
DISKS=(/dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1)
MOUNT_DIR_BASE="/mnt/nvme"

# 创建挂载点目录
echo ">>> 创建挂载目录..."
for i in {0..5}; do
    MOUNT_DIR="${MOUNT_DIR_BASE}${i}"
    sudo mkdir -p "$MOUNT_DIR"
done

# 格式化磁盘（如果未格式化）
echo ">>> 检查并格式化未格式化的磁盘..."
for DISK in "${DISKS[@]}"; do
    # 检查是否已格式化
    if ! sudo blkid "$DISK" >/dev/null 2>&1; then
        echo "  -> $DISK 未格式化，正在格式化为 ext4..."
        sudo mkfs.ext4 "$DISK"
    else
        echo "  -> $DISK 已格式化，跳过。"
    fi
done

# 挂载磁盘
echo ">>> 挂载磁盘..."
for i in {0..5}; do
    MOUNT_DIR="${MOUNT_DIR_BASE}${i}"
    DISK="${DISKS[$i]}"
    
    if mount | grep -q "$DISK"; then
        echo "  -> $DISK 已挂载，跳过。"
    else
        echo "  -> 挂载 $DISK 到 $MOUNT_DIR"
        sudo mount "$DISK" "$MOUNT_DIR"
    fi
done

# 更新 /etc/fstab 以实现开机自动挂载
echo ">>> 更新 /etc/fstab 以支持开机自动挂载..."
for i in {0..5}; do
    MOUNT_DIR="${MOUNT_DIR_BASE}${i}"
    DISK="${DISKS[$i]}"
    
    # 检查 /etc/fstab 是否已包含该磁盘
    if ! grep -q "$DISK" /etc/fstab; then
        echo "$DISK $MOUNT_DIR ext4 defaults 0 2" | sudo tee -a /etc/fstab
    fi
done

echo ">>> 挂载完成，检查结果："
df -h | grep nvme
echo "✅ 所有 NVMe 盘已挂载！"