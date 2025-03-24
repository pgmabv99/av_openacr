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

exit
# tshark -r /home/avorovich/pcap/rp_tap0.pcap \
#     -Y "((ip.src == 192.168.110.61 && ip.dst == 192.168.110.51 && tcp.srcport == 41072 && tcp.dstport == 1096) || \
#         (ip.src == 192.168.110.51 && ip.dst == 192.168.110.61 && tcp.srcport == 1096 && tcp.dstport == 41072)) && \
#         tcp.flags.reset == 1"

# ~/arnd/bin/x2bm_pcap -files:%2% > ~/av_openacr/sniffer_logs/tcp_pair.log
# ~/arnd/bin/x2bm_pcap -files:%2% > ~/av_openacr/sniffer_logs/tcp_pair2.log






ofile=~/av_openacr/sniffer_logs/tcp_pair_f0_all_mult_true.log
~/arnd/bin/atf_snf -use_files:true -files:%klocal_dat0% -mult_req_per_frame:true > $ofile 2>&1; tail -n 20 $ofile

ofile=~/av_openacr/sniffer_logs/tcp_pair_f0_all_mult_true.log
~/arnd/bin/atf_snf -use_files:true -files:%tap0% -mult_req_per_frame:true > $ofile 2>&1; tail -n 20 $ofile

ofile=~/av_openacr/sniffer_logs/tcp_pair_f0_one_mult_true.log
~/arnd/bin/atf_snf -use_files:true -files:%tap0% -mult_req_per_frame:true > $ofile 2>&1; tail -n 20 $ofile