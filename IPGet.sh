#!/bin/sh

apt install -y jq

jq '.values[] | select((.region | tostring) | startswith("ap") and any(.name[]; . == "HongKong" or . == "Singapore") | not) | .properties.addressPrefixes' ServiceTags_Public.json
