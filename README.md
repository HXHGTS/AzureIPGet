# AzureIPGet

用于解析R6亚太除香港外机房IP，实现精确匹配区域

[sing-box 彩虹六号亚服锁区规则](https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/data/AzureIPBlock.json)

运行:
```
curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/AzureIPGet@main/JsonGet.sh | bash
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/JsonGet.sh | bash
```
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/JsonToClient.sh | bash
```

获取香港IPV4段:
```
curl -sSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/IPGet.sh | bash
jq '.values[] | select(.id | test("AzureCloud")) | select((.properties.region | test("eastasia")) and (.properties.region | test("southeastasia") | not)) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep /
```

```
wget https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/tcping.sh -O /root/tcping.sh

chmod +x tcping.sh

bash tcping.sh
```

```
apt install -y netcat-openbsd bc

wget https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/udping.sh -O /root/udping.sh

chmod +x udping.sh

bash udping.sh
```

[IP源数据下载(本仓库)](https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/data/ServiceTags_Public.json) [IP源数据下载(Azure)](https://www.microsoft.com/en-us/download/details.aspx?id=56519)

[路由测试地址](./speedtest.md) 
