#!/bin/sh

apt install -y jq wget sed coreutils

curl -fsSL https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/IPGet.sh | bash

jq '.values[] | select(.id | test("AzureCloud")) | select(.properties.region | test("japaneast|japanwest|koreacentral|koreasouth")) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / >ip.txt

#wget -O ip2xray.sh https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2xray.sh

#chmod +x ip2xray.sh

#bash ip2xray.sh > AzureIPBlock.json

#cat AzureIPBlock.json

#rm -f ip2xray.sh ip.txt

wget -O ip2sing.sh https://raw.githubusercontent.com/HXHGTS/AzureIPGet/main/ip2singclient.sh

chmod +x ip2sing.sh

bash ip2sing.sh > AzureIPBlock.json

cat AzureIPBlock.json

rm -f ip2sing.sh ip.txt ip.txt ServiceTags_Public.json
