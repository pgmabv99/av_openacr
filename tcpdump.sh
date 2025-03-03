#!/bin/bash
set -e -x
# editcap -F pcap -C 100 /home/avorovich/pcap/rp_tap2.pcap /home/avorovich/pcap/rp_tap2_fixed.pcap
# tcpdump -r /home/avorovich/pcap/rp_tap2_fixed.pcap 'src host 192.168.210.21 and src port 62720 and dst host 192.168.210.51 and dst port 1092'

pair1="192.168.210.51:1092-192.168.210.21:62720"
pair2="192.168.210.51:1092-192.168.210.21:49413"
pair=$pair2
src_host=$(echo $pair | cut -d'-' -f1 | cut -d':' -f1)
src_port=$(echo $pair | cut -d'-' -f1 | cut -d':' -f2)
trg_host=$(echo $pair | cut -d'-' -f2 | cut -d':' -f1)
trg_port=$(echo $pair | cut -d'-' -f2 | cut -d':' -f2)
tcpdump -r /home/avorovich/pcap/rp_tap2.pcap \
    "src host $src_host and src port $src_port and dst host $trg_host and dst port $trg_port" \
    > /home/avorovich/av_openacr/sniffer_logs/tcp_pair2_tcpdump.log


# ~/arnd/bin/x2bm_pcap -files:%2% > ~/av_openacr/sniffer_logs/tcp_pair.log
# ~/arnd/bin/x2bm_pcap -files:%2% > ~/av_openacr/sniffer_logs/tcp_pair2.log
ofile=~/av_openacr/sniffer_logs/tcp_pair_f0_k1.log
~/arnd/bin/x2bm_pcap -files:%0% -ndisp:20> $ofile; tail -n 20 $ofile
