#!/bin/bash


ofile=~/av_openacr/sniffer_logs/atf_snf.log
tag=rdp
sudo chmod -R 777 ~/pcap/$tag
~/arnd/bin/atf_snf  -kapi:true  -in_file:$tag.pcap -out_solo_dir:$tag > $ofile 2>&1; tail -n 100 $ofile