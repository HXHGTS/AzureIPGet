#!/bin/bash

# 检查参数个数
if [ "$#" -ne 2 ]; then
    echo "用法: $0 <ip地址> <端口>"
    exit 1
fi

# 读取IP地址和端口参数
IP=$1
PORT=$2

# 设置超时时间
TIMEOUT=3

# 发送UDP数据包并监听响应
echo "Ping $IP:$PORT via UDP..."
if nc -u -w $TIMEOUT $IP $PORT < /dev/null; then
    echo "从 $IP 的 $PORT 端口成功接收到UDP响应"
else
    echo "无法从 $IP 的 $PORT 端口接收到UDP响应"
fi
