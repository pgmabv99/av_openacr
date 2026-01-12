#!/bin/bash
# run x2sup with x2read/x2write/x2traf  and capture traffic on port 8850

x22sup_start.sh

echo "==start tcpdump  "
sudo tcpdump -i any port 8850 -X -nn -s0 -U -w temp/x2tmp/x2gw_8850.pcap  &

echo"==start x2write/x2read/x2traf  "
x2read    > /home/avorovich/av_openacr/logs_x2sup/x2read.log  &
# x2traf -msg_size:10 -max_msgs:1000 -msg_rate:1K -tstamp:N | x2write  -progress -printacks:N
x2traf -msg_size:1K -max_msgs:10 -msg_rate:1 -tstamp:N | x2write  -progress -printacks:N

# Allow some time to flush pcap
sleep .001
pkill -f x2write
# let read finish
sleep 1
pkill -f x2traf
pkill -f x2read

#
echo "run sniffer with x2  to parse pcap" 
atf_snf  -x2 -sll2           -in_file:/home/avorovich/arnd/temp/x2tmp/x2gw_8850.pcap  -dir:x2sup --timestamp_log:N  -v > /home/avorovich/av_openacr/logs_x2sup/atf_snf.log 2>&1

echo "==latency for req "
grep "In_GUAckMsg found" /home/avorovich/av_openacr/logs_x2sup/atf_snf.log | tail -10
echo "==latency for seq "
grep "In_Seqmsg found" /home/avorovich/av_openacr/logs_x2sup/atf_snf.log | tail -10
echo "==summary "
grep avg_lat /home/avorovich/av_openacr/logs_x2sup/atf_snf.log | tail -10
exit 
# ========================================

# tcpdump -r temp/x2tmp/x2gw_8850.pcap




1st terminal: 
x2read -format:trafmsg  | x2traf -payload:trafmsg -read
x2read -format:trafmsg  | x2traf -payload:trafmsg -read_print
2nd terminal: 
x2traf  -payload:trafmsg  -msg_size:1000 -msg_rate:100K  -traf_id:64 | x2write -printacks:N -max_inflight:0 -payload:trafmsg


x2traf  -payload:trafmsg  -msg_size:10 -msg_rate:1   -traf_id:64 | x2write -printacks:N -max_inflight:0 -payload:trafmsg


 # Step 1: produce file (overwrites /tmp/traf_input.bin)
x2traf -payload:trafmsg -msg_size:10 -msg_rate:1 -traf_id:64 > temp/traf_input.bin

# Step 2: consume from file
x2write -printacks:N -max_inflight:0 -payload:trafmsg  -in_file:temp/traf_input.bin

x2read -format:trafmsg > temp/xread_out.txt
x2traf -payload:trafmsg -read_print -in_file:temp/xread_out.txt
x2traf -payload:trafmsg -msg_size:10 -msg_rate:1 -traf_id:64
#from chat
x2traf -tstamp:N -msg_rate:1  -payload:trafmsg -msg_size:10 | x2traf -read_print -payload:trafmsg

# ----------------------------------
# x2read -format:trafmsg  | x2traf -payload:trafmsg -read > /home/avorovich/av_openacr/logs_x2sup/x2traf.log  &
# sleep 1
# x2traf -payload:trafmsg -msg_size:10 -msg_rate:1k -traf_id:64 -tstamp:Y -max_msgs:500 |
# x2write -printacks:N -max_inflight:0 -payload:trafmsg &
