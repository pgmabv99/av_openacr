#!/bin/bash



ifile=o1_missed_produce
ofile=~/av_openacr/sniffer_logs/atf_snf.log
sudo ~/arnd/bin/atf_snf  -kapi:true  -in_file:$ifile.pcap > $ofile 2>&1; tail -n 100 $ofile