#!/bin/bash
set -x

echo "kill previous x2sup and tcpdump"
pkill x2sup
sudo pkill tcpdump
rm -rf temp/x2tmp
echo "start new x2sup "
x2sup -initdir:temp/x2tmp/ -daemon  -temp -livecheck:N
sleep 1
lsof -Pan -p $(pidof x2gw) -i

echo "start tcpdump  "
sudo tcpdump -i any port 8850 -X -nn -s0 -U -w temp/x2tmp/x2gw_8850.pcap  &

echo "do write and read x2 messages"
x2write <<EOF
aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
ccccccccccccccccccccccccccccc
EOF

x2read -end:2

# tcpdump -r temp/x2tmp/x2gw_8850.pcap

exit 
echo "run with x2 " 
atf_snf  -x2 -sll2 -in_file:/home/avorovich/arnd/temp/x2tmp/x2gw_8850.pcap  > /home/avorovich/av_openacr/logs_x2sup/x2.log      

echo "regresion test with kafka"
atf_snf  -kapi -in_file:/home/avorovich/av_openacr/pcap/atf_snf.pcap




