#!/bin/bash

omcli dev.ak-8.% -stop

tag=rdp_del_top
ofile=~/av_openacr/sniffer_logs/atf_snf_live_$tag.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is redirected to $ofile"
echo "....live monitoring   in temp/atf_snf.dat . "
sudo ~/arnd/bin/atf_snf -dev:data0-8T -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$tag -v > $ofile 2>&1; tail -n 20 $ofile
# sudo ~/arnd/bin/atf_snf -dev:data0-8T -kapi:true  -out_file:$tag.pcap   > $ofile 2>&1; tail -n 20 $ofile

exit

# 
#to be issued form a separate terminal
omcli dev.ak-8.kafka-% -dkr_clean_run

omcli dev.ak-8.% -start_clean
omcli dev.ak-8.kafka-% -start_clean
omcli dev.ak-8.kafkaw-2 -start_clean
bin/x2node  -node:dev.kafkaw-08 -cmd:'./kafkawrkr_test start_clean'  -fail_on_error:Y

# omcli -omenv:dev.ak-8 -omtest:om_benchmark
echo " short benchmark with 1 broker"
omcli  -omenv:dev.ak-8 -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload -omrun_minutes:1

omcli dev.ak-8.% -status

# 

omcli dev.ak-8.kafkaui% -start_clean
omcli dev.ak-8.rdpui% -start_clean
# 
omcli dev.ak-8.kafka-% -kcat_plaintext -kcat_cmd:"-L"
omcli dev.ak-8.kafka-1 -shell
omcli dev.ak-8.kafkaui-1 -shell
omcli dev.ak-8.kafkaui-1 -status