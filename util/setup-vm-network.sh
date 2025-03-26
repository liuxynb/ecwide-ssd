#!/bin/bash
# 在FEMU虚拟机中配置网络

# 检查参数
if [ "$#" -ne 1 ]; then
    echo "用法: $0 <节点ID>"
    exit 1
fi

NODE_ID=$1
IP_ADDR="192.168.100.$(($NODE_ID + 10))"
HOSTNAME="node$(printf "%02d" $NODE_ID)"

# 设置主机名
echo "设置主机名为 $HOSTNAME..."
sudo hostnamectl set-hostname $HOSTNAME

# 配置网络接口
echo "配置桥接网络接口..."
sudo ip addr add $IP_ADDR/24 dev ens3
sudo ip link set ens3 up
sudo ip route add default via 192.168.100.1

# 添加hosts记录
echo "添加hosts记录..."
echo "192.168.100.1   master" | sudo tee -a /etc/hosts

# 测试连通性
echo "测试与宿主机的连通性..."
ping -c 3 192.168.100.1

echo "网络配置完成！IP地址: $IP_ADDR"