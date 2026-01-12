#!/bin/bash
# basic test for x2 msg parse
set -e
echo "this should result in 10 req and 10 seq"
atf_snf  -x2 -sll2 -in_file:/home/avorovich/av_openacr/regression/x2.pcap -dir:regr_x2 -sll2 --timestamp_log:N > /home/avorovich/av_openacr/regression/test_x2.log 2>&1
grep session_ /home/avorovich/av_openacr/regression/test_x2.log  