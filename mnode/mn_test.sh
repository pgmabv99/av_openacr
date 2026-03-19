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


# == This is a simple test script to run Kafka producer performance test against x2 lost req ?? ===
source mn_set.sh
mn_brokers.sh
sleep 5
mn_perf.sh
sleep 2
mn_perf.sh
sleep 2
mn_perf.sh
sleep 2
mn_collect.sh

exit



# echo "====================starting kafka connector test"
# source mn_set.sh
# mn_brokers.sh  
# mn_produce.sh

# omcli nj1-4.kafkacw-1 -dkr_clean_run -ignore_node_passive 
# omcli  nj1-4.kafkacw-1  -start_clean -ignore_node_passive -omplat:$omplat 
# # omcli  nj1-4.kafkacw-1  -start_clean  -omplat:$omplat -omrun_connect:confluent-s3sink.dflt -omrun_worker:kafka-connect.dflt 
# # omcli  nj1-4.kafkacw-1  -start_clean  -omplat:$omplat -omrun_connect:apache-iceberg-sink.dflt -omrun_worker:kafka-connect.dflt 
# nsleep=5
# echo "sleeping $nsleep seconds for connector to do some work"
# sleep $nsleep
# # omcli nj1-4.kafkacw-1 -stop -ignore_node_passive
# sleep 1
# mn_collect.sh

# exit

# echo "====================local atf_snf test"
# test=bench_branch
# atf_snf -kapi -kafka_buf_dump \
#     -in_file:/home/avorovich/av_openacr/temp/atf_snf_$test.pcap -dir:$test --timestamp_log:N  \
#    > /home/avorovich/av_openacr/temp/atf_snf_$test.log 2>&1mn

# echo "====================local kafka connect"

# pkill -f java  || true
# source mn_set.sh
# mn_brokers.sh
# sleep 8
# mn_produce.sh
# kafka-connect start $server $topic
# sleep 12
# kafka-connect stop   


# # echo "====================VP connector test"
# omp=x2
# pkill java || true
# omcli nj1-4 -dkr_destroy -force -ignore_omplat   -ignore_node_passive
# omcli nj1-4 -dkr_clean_run -omplat:$omp -ignore_node_passive
# x2rel -env:nj1-4 -start -create -upload  
# omcli nj1-4 -omtest:connect_s3sink -omplat:$omp
