#!/bin/sh

apt install -y jq wget

curl -fsSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/IPGet.sh | bash

jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >ip.txt

#jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

#jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

#jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

# 检查 /usr/local/etc/xray 目录是否存在
if [ -d "/usr/local/etc/xray" ]; then
    # 下载 ip2xray.sh 脚本
    wget -O ip2xray.sh https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2xray.sh
    # 赋予执行权限
    chmod +x ip2xray.sh
    # 执行脚本并输出到 REJECT.json
    bash ip2xray.sh >/usr/local/etc/xray/REJECT.json
    # 输出 REJECT.json 的内容
    cat /usr/local/etc/xray/REJECT.json
    # 重启 xray 服务
    systemctl restart xray
    rm -f ip2xray.sh ip.txt ServiceTags_Public.json
# 如果 /usr/local/etc/xray 目录不存在，检查 /etc/sing-box 目录是否存在
elif [ -d "/etc/sing-box" ]; then
    # 下载 ip2sing.sh 脚本
    wget -O ip2sing.sh https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2sing.sh
    # 赋予执行权限
    chmod +x ip2sing.sh
    # 执行脚本并输出到 REJECT.json
    bash ip2sing.sh >/etc/sing-box/REJECT.json
    # 输出 REJECT.json 的内容
    cat /etc/sing-box/REJECT.json
    # 重启 sing-box 服务
    systemctl restart sing-box
    rm -f ip2sing.sh ip.txt ServiceTags_Public.json
# 如果两个目录都不存在，返回提示信息
else
    echo "未发现可执行脚本的路径！"
fi
