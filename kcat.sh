#!/bin/bash


cd ~/arnd
omcli -omnode:dev.ak-8.% -stop
omcli -omnode:dev.ak-8.% -start_clean
ofile=~/av_openacr/sniffer_logs/atf_snf.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is rediected to $ofile"
echo "....monitoring subset in temp/atf_snf.dat . "
tag=cat
sudo ~/arnd/bin/atf_snf -dev:data0-8 -kapi:true  -out_file:$tag.pcap  -out_solo_dir:$tag > $ofile 2>&1; tail -n 20 $ofile
exit

q
