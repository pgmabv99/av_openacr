#!/bin/bash

# pkill javaa || true
# ps -aux | grep java | grep kafka | grep -v grep || true

# set -e
# source mn_set.sh
# mn_clean.sh
# mn_brokers.sh
# if [ "$client" = "x2" ]; then
#     mn_x2write_read.sh
# elif [ "$client" = "ak" ]; then
#     mn_produce.sh
#     mn_consume.sh
# else
#   echo "unknown client:$client - no action"
# fi
# sleep 2
# # loop in above
# mn_collect.sh


// === This is a simple test script to run Kafka producer performance test against x2 lost req ?? ===
mn_brokers.sh
sleep 5
mn_perf.sh
sleep 2
mn_collect.sh

exit

atf_snf -kapi -kafka_buf_dump \
    -in_file:/home/avorovich/av_openacr/temp/atf_snf_80.pcap -dir:80 --timestamp_log:N  \
   > /home/avorovich/av_openacr/temp/atf_snf.log 2>&1






