#!/bin/bash
# Record X2 oor kafka sessions

omrun_load=debug-workload100

# omenv=dev.x2-4
# nic=data0-4T 
omenv=dev.ak-8
nic=data0-8T

# tag=${omenv}_${omrun_load}_c1_798_yyyy
# tag=${omenv}_${omrun_load}_c1_798_nnnY
# tag=${omenv}_${omrun_load}_c2_798_nnnY
# tag=${omenv}_${omrun_load}_c1_master_nnnY
# tag=${omenv}_${omrun_load}_c2_798_nnnY
# tag=${omenv}_${omrun_load}_c1_798_nnnY
# tag=${omenv}_${omrun_load}_test
# tag=${omenv}_redpanda_test_fetch_with_hex
tag=${omenv}_test_remote
ofile=~/av_openacr/sniffer_logs/atf_snf_live_$tag.log
mkdir -p $HOME/atf_snf_logs

# omcli $omenv.% -stop
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is redirected to $ofile"
echo "....live monitoring   in temp/atf_snf.dat . "
# sudo ~/arnd/bin/atf_snf -dev:${nic} -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$HOME$tag -dir:$HOME/atf_snf_logs/$tag -v -hex_print > $ofile 2>&1; tail -n 60 $ofile
sudo ~/arnd/bin/atf_snf -dev:${nic} -kapi:true   -dir:$HOME/atf_snf_logs/$tag  > $ofile 2>&1; tail -n 60 $ofile

# echo "---download node logs"
# cd ~/pcap/${tag}_omnode_logs/logs
# x2sup_pretty.sh dev.x2-20/dev-x2-4.x2sup-0-0.log  dev.x2-20/dev-x2-4.x2sup-0-0_pretty.log

# echo "---postprocess atf_snf  files"
# cd ~/pcap/$tag/tcp_pairs
# pwd
# atf_snf_sort.sh
# x2sup_pretty.sh

exit

# cannot be run as sudo because of rsync
omenv=dev.x2-4
tag=test
vscode_setup atf_snf -- -omenv_logs:$omenv -out_solo_dir:${tag} 

# 
#to be issued form a separate terminal
echo "---------------------X2or Kafka    clean start ONE node + bench"
set -x
omenv=dev.ak-8
# omenv=dev.x2-4
omrun_load=debug-workload100
omcli $omenv -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:$omrun_load -omrun_minutes:1

echo "---------------------X2 from VP"
omcli -force dev.x2-4 -dkr_clean_run -ignore_omnode_use
x2rel -force -upload -create -omenv:dev.x2-4 -product:'x2|x2w' -start
omcli -force dev.x2-4 -omtest:om_benchmark -omrun_load:debug-workload100 -omrun_driver:kafka-debug -debug_x2sup


echo " kcat for AP"
echo "Hello, Kafka!" | kcat -P -b dev.ak-8.kafka-4.ext-0:1047 -t my-test-topic

kcat -b dev.ak-8.kafka-4.ext-0:1047  -C -t my-test-topic
