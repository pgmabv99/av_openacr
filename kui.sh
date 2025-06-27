#!/bin/bash
# Record X2 oor kafka sessions

omrun_load=debug-workload100
omenv=dev.x2-4
# omenv=dev.ak-8

omcli $omenv.% -stop
tag=${omenv}_${omrun_load}
ofile=~/av_openacr/sniffer_logs/atf_snf_live_$tag.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is redirected to $ofile"
echo "....live monitoring   in temp/atf_snf.dat . "
sudo ~/arnd/bin/atf_snf -dev:data0-8T -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$tag -v > $ofile 2>&1; tail -n 20 $ofile

exit

# 
#to be issued form a separate terminal
echo "---------------------X2or Kafka    clean start ONE node + bench"
# omenv=dev.ak-8
set -x
omenv=dev.x2-4
omrun_load=debug-workload100
omcli $omenv.x2-0 -start_clean
omcli $omenv.kafkaw% -start_clean
omcli $omenv -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:$omrun_load -omrun_minutes:1

