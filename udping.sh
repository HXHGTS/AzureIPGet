#!/bin/bash

# 检查参数个数
if [ "$#" -ne 2 ]; then
    echo "用法: $0 <服务器IP> <端口>"
    exit 1
fi

# 读取服务器IP和端口参数
SERVER_IP=$1
PORT=$2
PACKET_COUNT=100
TIMEOUT=1
DELAY=0.1 # 每个包之间的延迟
SENT=0
RECEIVED=0
TOTAL_DELAY=0

# 发送数据包
for i in $(seq 1 $PACKET_COUNT)
do
    # 记录发送时间
    START_TIME=$(date +%s%N)
    echo "Ping" | nc -u -w $TIMEOUT $SERVER_IP $PORT
    if [ $? -eq 0 ]; then
        # 记录接收时间
        END_TIME=$(date +%s%N)
        # 计算延迟
        DELTA_TIME=$((($END_TIME - $START_TIME)/1000000))
        TOTAL_DELAY=$(echo "$TOTAL_DELAY + $DELTA_TIME" | bc)
        RECEIVED=$(($RECEIVED+1))
    fi
    SENT=$(($SENT+1))
    sleep $DELAY
done

# 计算丢包率和平均延迟
if [ $RECEIVED -ne 0 ]; then
    LOSS_RATE=$(echo "scale=2; (1-($RECEIVED/$SENT))*100" | bc)
    AVERAGE_DELAY=$(echo "scale=2; $TOTAL_DELAY/$RECEIVED" | bc)
    echo "发送数据包: $SENT"
    echo "接收数据包: $RECEIVED"
    echo "丢包率: $LOSS_RATE%"
    echo "平均延迟: $AVERAGE_DELAY ms"
else
    echo "没有收到任何响应，无法计算丢包率和延迟。"
fi
