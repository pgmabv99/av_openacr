#!/bin/bash


sudo rm -rf ~/pcap/cap 
ofile=~/av_openacr/sniffer_logs/atf_snf.log
~/arnd/bin/atf_snf  -kapi:true  -in_file:rdp.pcap > $ofile 2>&1; tail -n 100 $ofile