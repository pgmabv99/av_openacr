#!/bin/bash
# Record X2 oor kafka sessions

omrun_load=debug-workload100

# omenv=dev.x2-4
# dev=data0-4T 
omenv=dev.ak-8
dev=data0-8T

ofile=~/av_openacr/sniffer_logs/atf_snf_stdout.log

# omcli $omenv.% -stop
# cd ~/av_openacr 
echo "....starting atf_snf in  $(pwd) . "
echo "....use ctrl+C to enter commands . stdout is redirected to $ofile"
echo "....live monitoring   in temp/atf_snf.dat . "

# old
# tag=old
# sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$tag  > $ofile 2>&1; tail -n 60 $ofile

# tag=mytest3
# sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi  -dir:$tag  > $ofile 2>&1; tail -n 60 $ofile
# atf_snf  -kapi -in_file:/home/avorovich/arnd/temp/atf_snf_logs/mytest3/2025.07.14.14.31/atf_snf.pcap -dir:$tag  > $ofile 2>&1; tail -n 60 $ofile

# tag=iframe_live
# sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi  -dir:$tag 

# this will create a new directory with new timestamp (and a new pcap file - which is really unndeeded)
tag=iframe_pcap
atf_snf  -kapi -in_file:/home/avorovich/arnd/temp/atf_snf_logs/iframe_live/2025.07.21.11.42/atf_snf.pcap   -dir:$tag  > $ofile 2>&1; tail -n 60 $ofile


# echo "---postprocess atf_snf  files"
# cd atf_snf_logs/mytest3/2025.07.11.14.11/tcp_pairs
# pwd
# atf_snf_sort.sh
# x2sup_pretty.sh

exit

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