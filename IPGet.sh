#!/bin/sh

apt install -y jq

jq '.values[] | select((.region | tostring) | startswith("ap") and any(.name[]; . == "HongKong" or . == "Singapore") | not) | .properties.addressPrefixes' ServiceTags_Public.json | grep -v : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / > ipv4.txt

jq '.values[] | select((.region | tostring) | startswith("ap") and any(.name[]; . == "HongKong" or . == "Singapore") | not) | .properties.addressPrefixes' ServiceTags_Public.json | grep : | sed -e 's/"//g;s/,//g;s/\[//g;s/\]//g;s/{//g;s/}//g;s/ //g' | grep / > ipv6.txt
