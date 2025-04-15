#!/bin/bash



ifile=o1_fixed_redp_lost_rsp
ofile=~/av_openacr/sniffer_logs/$ifile.log
sudo ~/arnd/bin/atf_snf   -in_file:$ifile.pcap > $ofile 2>&1; tail -n 100 $ofile