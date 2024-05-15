#!/bin/sh
curl 'https://www.microsoft.com/en-us/download/details.aspx?id=56519' \
    -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
    -H 'accept-language: zh-CN,zh;q=0.9' \
    -H 'cache-control: max-age=0' \
    -H 'cookie: ApplicationGatewayAffinityCORS=207ef6035c95e17dbf9681c0dc5ed362; AEMDC=westus2; ApplicationGatewayAffinity=207ef6035c95e17dbf9681c0dc5ed362; ak_bmsc=3025E27550054A8F09D06B302FB0DF8E~000000000000000000000000000000~YAAQb/axdYTfoWuPAQAAHpEEfBcEy2L4jl+rxdlkzkY1CLPM8V3lu70f7fvbXdDc6qI7d/4Y3NcfWRxBEsESl75iP0lzFdwqdfsAZ+dfNRu0bnOZpGo3s9VlfsC9+9WmsnsBuKu5UJaLbIrcghHnutwwKmG+4q3cV7JwM9ADNZDbU0dP3d9qQCRtdYiRE4NQ+bzfjFjgqG5fp1uVsIqbXGF1dk4BW1Xg75/S6OX6pcDvaVp9klZFgVzCwpiplMN2Fr75Ed63uEbAsWDY+IzVuyWBSuBg7H9Qb9vBijabF0/UTR+2t6Pp9HmLf+h/O1ZMvYH4TKrrNfa6cygRztTF3voWmuWObiXZMyPvaXLRbTSlis6UC/UiF6E7DH/cBHxKenjubYpmAqyEfl6cFzU=; ai_session=EiR93G1fZEoqzV6FMKXO3L|1715772632434|1715772632434; MUID=c52c134df04c4d4d9cb32af1cf67e1bf; fptctx2=H3ihr9e92IdW6yd1ZgQ9SxNMSL5fwIGS0iyEDx6kB49fQzjZjOkvYlwqw885G2M0zcj2IOuvTo3r2H00P1S9R%252f8UA0pwkdS4L%252fTsT8Ry%252f8TpVZTyWHWpfdX94vBRM2BmhslcvhESqtGOuqo2FIliabz57KVIcRdTIZS1UmvgSnJlWw1J4x4khH69A9DGem3IGrIrat94NUGS18Q8xNA%252b37mUSd5g0vwHLc3ZHJBbZrPzQVLPYbYNzdx%252br5mScKc63qVYx92CFh%252baBsFTlaIgeCZRXQIm2XRd4L9TzYTxFLXUYDdfDbykkDREJmIxXH0kEj2X24R%252ftv5pAfOfSi%252fUnQ%253d%253d' \
    -H 'dnt: 1' \
    -H 'priority: u=0, i' \
    -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "Windows"' \
    -H 'sec-ch-ua-platform-version: "15.0.0"' \
    -H 'sec-fetch-dest: document' \
    -H 'sec-fetch-mode: navigate' \
    -H 'sec-fetch-site: none' \
    -H 'sec-fetch-user: ?1' \
    -H 'sec-gpc: 1' \
    -H 'upgrade-insecure-requests: 1' \
    -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' | sed -e 's/"/\n/g' | grep ServiceTags_Public_ | grep https | head -n 1 >GetAzureIPRange.txt

wget -O ServiceTags_Public.json -i GetAzureIPRange.txt
