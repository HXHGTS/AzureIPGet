#!/bin/sh

apt install -y jq

jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / > ip.txt

#jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

#jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

# 将ip.txt文件中的每行读取为JSON数组
ip_cidr=$(jq -R -s 'split("\n")[:-1]' ip.txt)

# 使用jq生成JSON结构
echo "{\"route\": {\"rules\": [{\"ip_cidr\": $ip_cidr, \"outbound\": \"REJECT\"}]}}" > ip.json

# 输出最终的ip.json文件内容
cat ip.json
