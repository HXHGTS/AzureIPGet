#!/bin/bash

# 创建一个名为ip_cidr的数组来存储IP地址
ip_cidr=()

# 读取ip.txt文件并填充ip_cidr数组
while IFS= read -r line; do
    ip_cidr+=("$line")
done < ip.txt

# 使用printf和Bash数组创建JSON格式的字符串
json_content=$(printf '{
    "routing": {
        "rules": [
            {
                "ip": [%s],
                "port": "3075,6000-6100,10000:10099",
                "network": "udp",
                "outboundTag": "REJECT"
            }
        ]
    }
}' "$(printf '"%s",' "${ip_cidr[@]}" | sed 's/,$//')")

# 输出JSON内容
echo "$json_content"
