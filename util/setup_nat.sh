#!/bin/bash
# FEMU NAT网络配置脚本

# 创建虚拟网桥
sudo brctl addbr br0

# 创建虚拟tap设备（根据需要的FEMU实例数量创建）
for i in {0..5}; do  # 创建5个tap设备，可根据需要调整
    sudo ip tuntap add mode tap tap$i
    sudo brctl addif br0 tap$i
    sudo ip link set tap$i up
done

# 配置网桥IP
sudo ip addr add 192.168.0.1/24 dev br0
sudo ip route add 192.168.0.0/24 dev br0

# 启动桥设备
sudo ip link set br0 up

# 配置NAT转发规则
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 ! -d 192.168.0.0/24 -j MASQUERADE

# 开启IP转发功能
sudo sysctl -w net.ipv4.ip_forward=1

# 配置防火墙允许转发
sudo iptables -A FORWARD -s 192.168.0.0/24 -j ACCEPT

# 创建dnsmasq配置文件
cat > dnsmasq.conf << EOF
strict-order
pid-file=/var/run/femu-dnsmasq.pid
except-interface=lo
bind-interfaces
listen-address=192.168.0.1
dhcp-range=192.168.0.2,192.168.0.254
dhcp-no-override
dhcp-leasefile=/tmp/femu-dnsmasq.leases
dhcp-lease-max=253
EOF

# 启动dnsmasq服务
sudo dnsmasq --conf-file=./dnsmasq.conf

echo "NAT网络环境配置完成！"

echo "网桥IP: 192.168.0.1"
echo "DHCP范围: 192.168.0.2 - 192.168.0.254"