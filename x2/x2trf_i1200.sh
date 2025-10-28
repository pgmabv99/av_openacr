#!/bin/bash
# issue 1200
LOOP_N=1000

for ((i=1;i<=LOOP_N;i++)); do
atf_comp atf_x2.TrafBin
done
exit

# =========================
x22sup_start.sh
# Kill all 
pkill -f x2traf
pkill -f x2write
pkill -f x2read


echo "==do write and read x2 messages"
LOOP_N=8

for ((i=1;i<=LOOP_N;i++)); do
    echo "== iteration $i/$LOOP_N =="
    x2traf -max_msgs:64 -msg_rate:0 -msg_size:128 -payload:bin -tstamp:N | x2write -payload:bin
done
# Start read
x2read  -beg:0 -end:eof -payload_lim:0 -strip:0  
