#!/bin/sh

apt install -y jq wget

jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / > ip.txt

#jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

#jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

wget -o ip2json.sh  https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2json.sh

chmod +x ip2json.sh

bash ip2json.sh > /etc/sing-box/REJECT.json

cat /etc/sing-box/REJECT.json

systemctl restart sing-box
