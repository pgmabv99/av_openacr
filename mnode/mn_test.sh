#!/bin/bash
## test by hand produce 
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


# // === This is a simple test script to run Kafka producer performance test against x2 lost req ?? ===
# source mn_set.sh
# mn_brokers.sh
# sleep 5
# mn_perf.sh
# sleep 2
# mn_collect.sh

# exit



echo "====================starting kafka connector test"
source mn_set.sh
mn_brokers.sh  
mn_produce.sh

omcli nj1-4.kafkacw-1 -dkr_clean_run 
omcli  nj1-4.kafkacw-1  -start_clean  -omplat:$omplat 
# omcli  nj1-4.kafkacw-1  -start_clean  -omplat:$omplat -omrun_connect:confluent-s3sink.dflt -omrun_worker:kafka-connect.dflt 
# omcli  nj1-4.kafkacw-1  -start_clean  -omplat:$omplat -omrun_connect:apache-iceberg-sink.dflt -omrun_worker:kafka-connect.dflt 

mn_collect.sh

exit

test=bench_branch
atf_snf -kapi -kafka_buf_dump \
    -in_file:/home/avorovich/av_openacr/temp/atf_snf_$test.pcap -dir:$test --timestamp_log:N  \
   > /home/avorovich/av_openacr/temp/atf_snf_$test.log 2>&1