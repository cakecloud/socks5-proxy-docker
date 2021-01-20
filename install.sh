#!/bin/bash
apt update
apt-get install apt-transport-https ca-certificates curl nano gnupg-agent software-properties-common sudo wget git -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker run -d --name socks5_1234 -p 4444:1080 -e PROXY_USER=user -e PROXY_PASSWORD=password olebedev/socks5
IP=$(curl ifconfig.me)
echo "COMPLETE! YOUR PROXY IS READY:"
echo "${IP},4444,user,password"
exit 0
