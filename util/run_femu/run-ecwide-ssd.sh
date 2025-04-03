#!/bin/bash
# FEMU Multi-Instance Launcher with Enhanced Debugging
# Version 2.0 - Full QLC/TLC Hybrid Support
# Author: liuxynb
# Last Updated: 2024-03-15

# ========================
# 用户配置区 (按需修改)
# ========================
DEBUG_LEVEL=2                  # 调试级别 (0:静默, 1:基础, 2:详细)
BASE_IMAGE="/home/lxy/images/u20s.qcow2"  # 基础镜像路径
DEFAULT_LOG_DIR="/home/lxy/femu/build-femu/femu_logs"  # 默认日志目录
SSD_SIZE_MB_QLC=2048               # 单SSD容量 (MB)
SSD_SIZE_MB_TLC=2048               # 单SSD容量 (MB)
MEM_PER_INSTANCE="4G"          # 单实例内存分配
CPU_CORES=2                    # 单实例CPU核心数

# ========================
# 环境检测与初始化
# ========================
[ $# -lt 1 ] && {
    echo -e "\033[31m[ERROR] Usage: $0 <num_instances> [log_directory]\033[0m"
    exit 1
}

NUM_INSTANCES=$1
LOG_TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
LOG_DIR="${2:-$DEFAULT_LOG_DIR}/$LOG_TIMESTAMP"

# ========================
# 功能函数定义
# ========================

# 彩色输出函数
color_echo() {
    local color=$1
    shift
    case $color in
        red)    echo -e "\033[31m$*\033[0m" ;;
        green)  echo -e "\033[32m$*\033[0m" ;;
        yellow) echo -e "\033[33m$*\033[0m" ;;
        blue)   echo -e "\033[34m$*\033[0m" ;;
        *)      echo -e "$*" ;;
    esac
}

# 调试输出函数
debug_print() {
    [ $DEBUG_LEVEL -ge $1 ] && color_echo $3 "[DEBUG$1] $2"
}

# SSD参数生成器
generate_ssd_config() {
    local ssd_type=$1
    case $ssd_type in
        qlc)
            echo "femu_mode=1,devsz_mb=$SSD_SIZE_MB_QLC,pg_wr_lat=25000,blk_er_lat=250000,max_pe_cycles=1000"
            ;;
        tlc)
            echo "femu_mode=1,devsz_mb=$SSD_SIZE_MB_TLC,pg_wr_lat=15000,blk_er_lat=200000,max_pe_cycles=3000"
            ;;
        *)
            color_echo red "未知SSD类型: $ssd_type"
            exit 1
            ;;
    esac
}

# 网络配置函数
setup_network() {
    local instance_id=$1
    debug_print 2 "配置TAP网络接口 tap$instance_id" blue
    
    sudo ip tuntap add dev tap$instance_id mode tap 2>> "$LOG_DIR/network.log" || {
        color_echo yellow "检测到已存在的TAP接口 tap$instance_id，尝试复用"
    }
    
    sudo ip link set tap$instance_id up 2>> "$LOG_DIR/network.log" || {
        color_echo red "无法激活TAP接口 tap$instance_id"
        exit 1
    }
}

# 实例启动函数
launch_instance() {
    local instance_id=$1
    color_echo blue "\n==== 启动实例 $instance_id ===="

    # 生成唯一标识
    local mac_addr="52:54:00:12:34:$(printf "%02x" $instance_id)"
    local host_port=$((2200 + $instance_id))
    local log_file="$LOG_DIR/femu_node${instance_id}.log"

    # 镜像检测
    local instance_img="${BASE_IMAGE%/*}/femu_instance_${instance_id}.qcow2"
    [ ! -f "$instance_img" ] && {
        debug_print 1 "创建实例镜像: $instance_img" yellow
        qemu-img create -f qcow2 -b "$BASE_IMAGE" -F qcow2 "$instance_img" || {
            color_echo red "镜像创建失败"
            exit 1
        }
    }

    # 网络配置
    setup_network $instance_id

    # 构建SSD参数
    local ssd_params=""
    for q in {1..5}; do
        ssd_params+="-device femu,id=femu${instance_id}_qlc${q},$(generate_ssd_config qlc) "
    done
    ssd_params+="-device femu,id=femu${instance_id}_tlc,$(generate_ssd_config tlc)"

    # Screen启动命令
    local screen_cmd="screen -L -Logfile \"$log_file\" -dmS femu_node$instance_id"
    local qemu_cmd="sudo ./qemu-system-x86_64 \
        -L /usr/share/qemu \
        -name \"FEMU-Node$instance_id\" \
        -enable-kvm \
        -cpu host \
        -smp $CPU_CORES \
        -m $MEM_PER_INSTANCE \
        -device virtio-scsi-pci,id=scsi0 \
        -device scsi-hd,drive=hd0 \
        -drive file=\"$instance_img\",if=none,aio=native,cache=none,format=qcow2,id=hd0 \
        $ssd_params \
        -netdev tap,id=net$instance_id,ifname=tap$instance_id,script=no,downscript=no \
        -device virtio-net-pci,netdev=net$instance_id,mac=\"$mac_addr\" \
        -netdev user,id=user$instance_id,hostfwd=tcp::$host_port-:22 \
        -nographic"

    debug_print 2 "执行命令: $screen_cmd $qemu_cmd" yellow
    eval "$screen_cmd $qemu_cmd"

    # 状态验证
    sleep 1
    screen -ls | grep -q "femu_node$instance_id" && {
        color_echo green "✓ 实例 $instance_id 启动成功"
        echo -e "  访问方式:    screen -r femu_node$instance_id"
        echo -e "  SSH端口:     $host_port"
        echo -e "  日志文件:    $log_file"
        echo -e "  SSD设备:     5×QLC(femu${instance_id}_qlc1-5) 1×TLC(femu${instance_id}_tlc)"
    } || {
        color_echo red "实例 $instance_id 启动失败!"
        exit 1
    }
}

# ========================
# 主执行流程
# ========================

# 初始化环境
mkdir -p "$LOG_DIR" || {
    color_echo red "无法创建日志目录: $LOG_DIR"
    exit 1
}
color_echo green "日志目录已创建: $LOG_DIR"

# 打印配置摘要
color_echo yellow "\n==== 实验环境配置 ===="
echo -e "实例数量:    $NUM_INSTANCES"
echo -e "基础镜像:    $BASE_IMAGE"
echo -e "SSD配置:     5×QLC(${SSD_SIZE_MB_QLC}MB) + 1×TLC(${SSD_SIZE_MB_TLC}MB)"
echo -e "资源分配:    ${MEM_PER_INSTANCE}内存 / ${CPU_CORES}核心 每实例"

# 批量启动实例
color_echo yellow "\n==== 启动实例 ===="
for i in $(seq 1 $NUM_INSTANCES); do
    launch_instance $i
done

# 生成调试工具包
color_echo yellow "\n==== 生成调试工具 ===="
cat > "$LOG_DIR/debug_tools.sh" << 'EOF'
#!/bin/bash
# FEMU Debug Toolkit
echo "可用命令:"
echo "1. 列出所有实例:       screen -ls | grep femu"
echo "2. 进入实例控制台:     screen -r <session_name>"
echo "3. 查看SSD设备:       lsblk | grep femu"
echo "4. 网络诊断:          ping -c 4 10.10.10.1\$i"
echo "5. 实时日志监控:      tail -f $LOG_DIR/femu_node*.log"
echo "6. 性能监控:          watch -n 1 'dmesg | tail -20'"
EOF
chmod +x "$LOG_DIR/debug_tools.sh"

# 最终状态报告
color_echo green "\n==== 启动完成 ===="
echo -e "所有实例 ($NUM_INSTANCES) 已成功启动"
echo -e "后续操作建议:"
echo -e "1. 查看实时日志:    tail -f $LOG_DIR/femu_node*.log"
echo -e "2. 使用调试工具:    $LOG_DIR/debug_tools.sh"
echo -e "3. SSH访问示例:     ssh -p 2201 user@localhost"
echo -e "4. 会话管理示例:    screen -r femu_node1"