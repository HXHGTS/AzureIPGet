#!/bin/bash

# 检查参数个数
if [ "$#" -ne 2 ]; then
    echo "用法: $0 <ip地址> <端口>"
    exit 1
fi

# 读取IP地址和端口参数
IP=$1
PORT=$2

# 使用/dev/tcp来测试连接
( echo > /dev/tcp/$IP/$PORT ) >/dev/null 2>&1
result=$?

# 检查结果并打印相应信息
if [ $result -eq 0 ]; then
    echo "从 $IP 的 $PORT 端口成功接收到响应"
else
    echo "无法从 $IP 的 $PORT 端口接收到响应"
fi
