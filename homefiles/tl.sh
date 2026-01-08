#!/bin/bash
echo "start tunnel"
wstunnel --version


wstunnel client -P ssh --local-to-remote tcp://0.0.0.0:2222:192.168.10.11:1063 wss://ws2ssh-nj1.algox2.com



exit


# wstunnel client --log-lvl=off -P ssh -L stdio://192.168.10.11:1000 wss://ws2ssh-nj1.algox2.com

echo "installing wstunnel"
curl -LO https://github.com/erebe/wstunnel/releases/download/v10.5.1/wstunnel_10.5.1_linux_amd64.tar.gz
tar xzf wstunnel_10.5.1_linux_amd64.tar.gz
sudo install -m 755 wstunnel /usr/local/bin/
rm -f wstunnel_10.5.1_linux_amd64.tar.gz
rm -f wstunnel