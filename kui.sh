#!/bin/bash
# Record X2 oor kafka sessions

omrun_load=debug-workload100

# omenv=dev.x2-4
# dev=data0-4T 
omenv=dev.ak-8
dev=data0-8T

echo "....starting atf_snf in  $(pwd) . "
echo "....use ctrl+C to enter commands . stdout is redirected to $ofile"
echo "....live monitoring   in temp/atf_snf.dat . "

# echo "run capture with sudo"
tag=common
sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi  -dir:$tag  -timestamp_log:N

echo "convert pcap file to logs"
# tag=common
# atf_snf  -kapi -in_file:/home/avorovich/arnd/temp/atf_snf_logs/common/2025.07.24.11.16/atf_snf.pcap



exit


# 

# run bencmark against kafka and pcap
omcli dev.x2-4 -omplat:ak -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload100 -omrun_minutes:1
omcli dev.x2-4 -omplat:ak -collect_logs
atf_snf  -kapi -in_file:/home/avorovich/av_openacr/pcap/atf_snf.pcap