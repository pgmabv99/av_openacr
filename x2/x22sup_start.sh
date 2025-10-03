#!/bin/bash
# run x2sup  
echo "==kill previous x2sup and tcpdump"
pkill x2sup
sudo pkill tcpdump
rm -rf temp/x2tmp

echo "==start new x2sup "
x2sup -initdir:temp/x2tmp/ -daemon  -temp -livecheck:N
sleep 1
lsof -Pan -p $(pidof x2gw) -i
