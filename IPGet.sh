#!/bin/sh

echo '正在获取AzureIPRange数据库下载地址. . .'

curl 'https://www.microsoft.com/en-us/download/details.aspx?id=56519' --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' | sed -e 's/"/\n/g' | grep ServiceTags_Public_ | grep https | head -n 1 >GetAzureIPRange.txt

echo '正在下载AzureIPRange数据库. . .'

wget -O ServiceTags_Public.json -i GetAzureIPRange.txt
