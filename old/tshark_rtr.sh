#!/bin/bash
set -x

file1="/home/avorovich/av_openacr/sniffer_logs/tshark_rtr"
file2="${file1}_analysis.log"

src_ip="192.168.110.61"
dst_ip="192.168.110.51"
src_port="41072"
dst_port="1096"
# tshark -r /home/avorovich/pcap/rp_tap0.pcap \
#     -Y "ip.src == ${src_ip} && ip.dst == ${dst_ip} && tcp.srcport == ${src_port} && tcp.dstport == ${dst_port} && tcp.analysis.retransmission  && tcp.analysis.lost_segment" \
#     -T fields \
#     -e frame.number \
#     -e tcp.seq \
#     -e tcp.len \
#     -e tcp.ack \
#     -e tcp.analysis.retransmission \
#     -e tcp.analysis.lost_segment \
#     > ${file1}.log
tshark -r /home/avorovich/pcap/rp_tap0.pcap \
    -Y "tcp.analysis.retransmission  && tcp.analysis.lost_segment" \
    -T fields \
    -e ip.src \
    -e tcp.srcport \
    -e ip.dst \
    -e tcp.dstport \
    -e frame.number \
    -e tcp.seq \
    -e tcp.len \
    -e tcp.ack \
    -e tcp.analysis.retransmission \
    -e tcp.analysis.lost_segment \
    > ${file1}.log
