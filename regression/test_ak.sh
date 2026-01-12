#!/bin/bash
# basic test for x2 msg parse
set -e
echo "this should result in ... kafka_req_count_total:2320 "
atf_snf  -kapi -in_file:/home/avorovich/av_openacr/regression/ak.pcap -dir:regr_ak --timestamp_log:N > /home/avorovich/av_openacr/regression/test_ak.log 2>&1
grep session_ /home/avorovich/av_openacr/regression/test_ak.log  