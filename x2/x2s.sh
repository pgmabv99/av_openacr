#!/bin/bash

echo "==kill previous x2sup and tcpdump"
pkill x2sup
sudo pkill tcpdump
rm -rf temp/x2tmp

echo "==start new x2sup "
x2sup -initdir:temp/x2tmp/ -daemon  -temp -livecheck:N
sleep 1
lsof -Pan -p $(pidof x2gw) -i

echo "==start tcpdump  "
sudo tcpdump -i any port 8850 -X -nn -s0 -U -w temp/x2tmp/x2gw_8850.pcap  &

echo "==do write and read x2 messages"

trafmsg=false
trafmsg=true
if $trafmsg; then
    # Start read
    x2read -format:trafmsg  | x2traf -payload:trafmsg -read > /home/avorovich/av_openacr/logs_x2sup/x2traf.log  &
    sleep 1
    # Start write
    x2traf -payload:trafmsg -msg_size:10 -msg_rate:1k -text_char:B -traf_id:64 |
    x2write -printacks:N -max_inflight:0 -payload:trafmsg &
    # Wait to allow to run
    sleep 5
    # Kill all 
    pkill -f x2traf
    pkill -f x2write
    pkill -f x2read
else
x2write <<EOF
aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
EOF
x2read -end:2
fi

echo "run sniffer with x2 in trafmsg mode to parse pcap" 
atf_snf  -x2 -sll2 -trafmsg -in_file:/home/avorovich/arnd/temp/x2tmp/x2gw_8850.pcap  > /home/avorovich/av_openacr/logs_x2sup/atf_snf_x2_trafmsg.log      

exit 
# ========================================

# tcpdump -r temp/x2tmp/x2gw_8850.pcap

echo "regresion test with kafka"
atf_snf  -kapi -in_file:/home/avorovich/av_openacr/pcap/atf_snf.pcap


1st terminal: 
x2read -format:trafmsg  | x2traf -payload:trafmsg -read
2nd terminal: 
x2traf  -payload:trafmsg  -msg_size:1000 -msg_rate:100K -text_char:B -traf_id:64 | x2write -printacks:N -max_inflight:0 -payload:trafmsg


x2traf  -payload:trafmsg  -msg_size:10 -msg_rate:1      -text_char:B -traf_id:64 | x2write -printacks:N -max_inflight:0 -payload:trafmsg


