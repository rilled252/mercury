#!/bin/bash

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && dpkg -i cloudflared.deb 
curl -SL "https://github.com/v2fly/v2ray-core/releases/download/v5.37.0/v2ray-linux-64.zip" -o v2ray.zip
unzip -o v2ray.zip
rm config.json
sleep 1
wget -O config.json https://gist.githubusercontent.com/rilled252/c5949d06b87cbde6dfe082f1cf367099/raw/config.json
sleep 1
wget -N wget https://raw.githubusercontent.com/Psiphon-Labs/psiphon-tunnel-core-binaries/master/linux/psiphon-tunnel-core-x86_64
mv psiphon-tunnel-core-x86_64 psiphon
chmod +x psiphon
wget -O psiphon.config https://gist.githubusercontent.com/rilled252/848140370e8f2c8d415d999c1ba88b5d/raw/psiphon.config
sleep 5
nohup ./psiphon -config psiphon.config >/dev/null 2>&1 &
sleep 4
nohup ./v2ray run -c ./config.json > /tmp/v2ray-nohup.log 2>&1 & disown
sleep 5
nohup cloudflared tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token "eyJhIjoiZjllNjNiZmUwNjZiOTYwN2YyZTExZDliNDRjYTk0ZjYiLCJ0IjoiZjljZDliMTItNzdmNC00OWYwLWJhZDktMzJmY2I1YTI0ZWJjIiwicyI6Ik5UQmhNR0V3TTJZdFpUSmhaUzAwT0RabUxUa3habUl0TXpOaFpXRXpZemxrWlRrMCJ9" >/dev/null 2>&1 &
sleep 10
netstat -ntlp
sleep 5
node ./index.js
