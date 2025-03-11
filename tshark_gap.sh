#!/bin/bash
set -x

file1="/home/avorovich/av_openacr/sniffer_logs/tshark_gap"
file2="${file1}_analysis.log"

src_ip="192.168.110.61"
dst_ip="192.168.110.51"
src_port="41072"
dst_port="1096"

tshark -r /home/avorovich/pcap/rp_tap0.pcap \
-Y "ip.src == ${src_ip} && ip.dst == ${dst_ip} && tcp.srcport == ${src_port} && tcp.dstport == ${dst_port} && tcp.len > 0" \
-T fields \
-e frame.number \
-e tcp.seq \
-e tcp.len \
> "${file1}.log"


echo "Analyzing TCP sequence number gaps from '${file1}.log'..."
echo "----------------------------------------"

awk '
    BEGIN {
        gaps = 0
        print "Analyzing TCP sequence number gaps..."
        print "----------------------------------------"
    }
    NR > 1 {
        expected_seq = prev_seq + prev_len
        if ($2 > expected_seq) {
            gaps++
            gap_size = $2 - expected_seq
            print "Gap " gaps ": Frame " prev_frame " (seq " prev_seq ", len " prev_len ") -> Frame " $1 " (seq " $2 "), Gap size: " gap_size " bytes"
        }
    }
    {
        prev_frame = $1
        prev_seq = $2
        prev_len = $3
    }
    END {
        print "----------------------------------------"
        print "Total number of gaps: " gaps
        if (gaps == 0) {
            print "No gaps found in TCP sequence numbers."
        }
    }
' "${file1}.log" > "${file2}"