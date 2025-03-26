#!/bin/bash
# 在宿主机上配置桥接网络

# 检查是否已有br0接口
if ip link show br0 &> /dev/null; then
    echo "接口br0已存在，将重新配置..."
    sudo ip link set br0 down
    sudo brctl delbr br0
fi

# 创建桥接接口
echo "创建桥接接口br0..."
sudo brctl addbr br0
sudo ip addr add 192.168.100.1/24 dev br0
sudo ip link set br0 up

# 开启IP转发
echo "开启IP转发..."
sudo sysctl -w net.ipv4.ip_forward=1

# 配置NAT
echo "配置NAT规则..."
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 ! -d 192.168.100.0/24 -j MASQUERADE

# 允许转发
sudo iptables -F FORWARD
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i br0 -j ACCEPT

# 显示配置信息
echo "桥接网络配置完成！"
echo "桥接接口IP地址: 192.168.100.1/24"
ip addr show br0