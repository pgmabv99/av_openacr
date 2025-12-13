#!/bin/bash
pkill javaa || true
ps -aux | grep java | grep kafka | grep -v grep || true

mn_clean.sh
mn_tap.sh
mn_brokers.sh
mn_x2write_read.sh
mn_collect.sh
exit

omcli dev.x2-4.x2w-1 -shell
omcli dev.x2-4.x2w-1 -shell_cmd:"ls -ltr"
omcli dev.x2-4.x2w-1 -shell_cmd:"cd release;~/release/bin/x2traf -msg_size:1k -max_msgs:10 -msg_rate:1 -tstamp:N | ~/release/bin/x2write  -gw:192.168.104.2:1508 -progress -printacks:N"