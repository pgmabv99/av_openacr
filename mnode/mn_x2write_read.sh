#!/bin/bash
source  mn_set.sh
local=false
local=true
msg_rate=1
msg_size=1k
max_msgs=10
gw=192.168.104.2:1508
if [ "$local" = "true" ]; then
  echo "==start local x2write/x2read/x2traf !!!!!!!!!!!!!!!!!!!!!!!! "
  x2read -gw:$gw    > /home/avorovich/av_openacr/logs_x2sup/x2read.log  &
  x2traf -msg_size:$msg_size -max_msgs:$max_msgs -msg_rate:$msg_rate -tstamp:N | x2write  -gw:$gw -progress -printacks:N  
else
  echo "==start remote  x2write/x2read/x2traf !!!!!!!!!!!!!!!!!!!!!!!!"
  omcli dev.x2-4.x2w-1 -shell_cmd:"cd release;nohup ~/release/bin/x2read -gw:$gw    > ~/x2read.log 2>&1 &"
  omcli dev.x2-4.x2w-1 -shell_cmd:"cd release;~/release/bin/x2traf -msg_size:$msg_size -max_msgs:$max_msgs -msg_rate:$msg_rate -tstamp:N | ~/release/bin/x2write  -gw:$gw -progress -printacks:N"
fi
echo "END x2write/x2read/x2traf !!!!!!!!!!!!!!!!!!!!!!!! "