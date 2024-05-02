#!/bin/sh

apt install -y jq

jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / > ip.txt

#jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

#jq '.values[] | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | select(.properties.systemService | test("sql")) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >> ip.txt

curl -sSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2json.sh > ip2json.sh

chmod +x ip2json.sh

bash ip2json.sh > REJECT.json

cat REJECT.json
