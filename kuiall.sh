#!/bin/bash

cd ~/arnd
omcli -omnode:dev.ak-8.% -stop
omcli -omnode:dev.ak-8.% -start_clean
ofile=~/av_openacr/sniffer_logs/atf_snf.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is rediected to $ofile"
echo "....monitoring subset in temp/atf_snf.dat . "
tag=all
sudo ~/arnd/bin/atf_snf -dev:data0-8 -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$tag > $ofile 2>&1; tail -n 20 $ofile
exit

#to be issued form a separate terminal
omcli -omnode:dev.ak-8.% -start_clean
omcli -omnode:dev.ak-8.kafka-% -status
omcli -omnode:dev.ak-8.kafka-% -stop

omcli -omnode:dev.x2-4% -start_clean
#  gdb --args /home/avorovich/arnd/temp/sandbox.abt_md/build/Linux-g++.debug-x86_64/omcli -omnode:dev.ak-8.% -status