#!/bin/bash
# echo "run tap locally"
# sudo ~/arnd/bin/atf_snf -dev:data0-4T  -kapi  -dir:local -timestamp_log:N

echo " run locally from pcap"
atf_snf -dev:data0-4T  -kapi  -dir:local  \
        -in_file:/home/avorovich/arnd/temp/atf_snf_logs/local/atf_snf.pcap
