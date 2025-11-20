#!/bin/bash
source mn_set.sh
# echo "run tap locally"
# sudo ~/arnd/bin/atf_snf -dev:data0-4T  -kapi  -dir:local -timestamp_log:N

echo " run locally from pcap"
atf_snf -dev:data0-4T  -kapi  -dir:local  \
        -in_file:/home/avorovich/arnd/temp/atf_snf_logs/local/atf_snf.pcap

#

exit



echo "collect tap logs"
omcli $tap_omnnode -ignore_omnode_use -status
omcli $tap_omnnode -ignore_omnode_use -stop
sleep 4
omcli $tap_omnnode -ignore_omnode_use -collect_logs
atf_lat -omenv:dev.x2-4  

