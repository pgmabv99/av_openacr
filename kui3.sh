#!/bin/bash

set -x
tag=wrk_full2
ofile=~/av_openacr/sniffer_logs/tcpdump_$tag.log
frame_count=$(tcpdump -nn -r ~/pcap/$tag.pcap 2>/dev/null | wc -l)
echo "Total frames in pcap: $frame_count"
# sudo tcpdump -nn -r ~/pcap/$tag.pcap \
# '(src host 192.168.108.7 and dst host 192.168.108.5 )' > $ofile 2>&1; tail -n 100 $ofile 
# sudo tcpdump -nn -r ~/pcap/$tag.pcap \
# '(src host 192.168.108.5 and src port 1047 and dst host 192.168.108.1 and dst port 42192)' > $ofile 2>&1; tail -n 100 $ofile 