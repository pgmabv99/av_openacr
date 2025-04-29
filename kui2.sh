#!/bin/bash



ofile=~/av_openacr/sniffer_logs/atf_snf.log
sudo ~/arnd/bin/atf_snf  -kapi:true  -in_file:o1.pcap > $ofile 2>&1; tail -n 100 $ofile