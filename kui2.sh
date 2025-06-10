#!/bin/bash

set -x
tag=wrk
ofile=~/av_openacr/sniffer_logs/atf_snf_$tag.log
sudo mkdir -p ~/pcap/$tag
sudo chmod -R 777 ~/pcap/$tag
atf_snf  -kapi:true  -in_file:$tag.pcap -out_solo_dir:$tag > $ofile 2>&1; tail -n 100 $ofile