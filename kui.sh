#!/bin/bash

omcli -omnode:dev.ak-8.% -stop
# omcli -omnode:dev.ak-8.kafka-% -start
omcli -omnode:dev.ak-8.kafka-% -start_clean
omcli -omnode:dev.ak-8.kafka-% -status



ofile=~/av_openacr/sniffer_logs/atf_snf.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is rediected to $ofile"
echo "....monitoring subset in temp/atf_snf.dat . "
sudo ~/arnd/bin/atf_snf -dev:data0-8 -kapi:true  -out_file:o1.pcap > $ofile 2>&1; tail -n 20 $ofile



exit
#to be issued form a separate terminal
omcli -omnode:dev.ak-8.kafkaui% -start
omcli -omnode:dev.ak-8.rdpui% -start