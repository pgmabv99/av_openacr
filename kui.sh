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
# tag=common
# sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi  -dir:$tag 

echo "convert pcap file to logs"
tag=common
atf_snf  -kapi -in_file:/home/avorovich/arnd/temp/atf_snf_logs/common/2025.07.24.11.16/atf_snf.pcap



exit


# echo "---postprocess atf_snf  files"
# cd atf_snf_logs/mytest3/2025.07.11.14.11/tcp_pairs
# pwd
# x2sup_pretty.sh

# cannot be run as sudo because of rsync
omenv=dev.x2-4
tag=test
vscode-set-program atf_snf -- -kapi:true -dir:${tag} 

# 
#to be issued form a separate terminal
echo "---------------------X2or Kafka    clean start ONE node + bench"
# set -x
omenv=dev.ak-8
# omenv=dev.x2-4
omrun_load=debug-workload100
omcli $omenv -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:$omrun_load -omrun_minutes:1
sudo pkill -SIGUSR1 atf_snf



echo "simple ak-8 "
omcli dev.ak-8 -start_clean
sudo pkill -SIGUSR1 atf_snf