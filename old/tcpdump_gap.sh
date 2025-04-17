#!/bin/bash
set -e -x
# editcap -F pcap -C 100 /home/avorovich/pcap/rp_tap2.pcap /home/avorovich/pcap/rp_tap2_fixed.pcap
# tcpdump -r /home/avorovich/pcap/rp_tap2_fixed.pcap 'src host 192.168.210.21 and src port 62720 and dst host 192.168.210.51 and dst port 1092'
src_host=192.168.110.61
src_port=41072
trg_host=192.168.110.51
trg_port=1096
tcpdump -r /home/avorovich/pcap/rp_tap0.pcap \
    "src host $src_host and src port $src_port and dst host $trg_host and dst port $trg_port" \
    > /home/avorovich/av_openacr/sniffer_logs/tcp_pair_f0_rst.log

exit

