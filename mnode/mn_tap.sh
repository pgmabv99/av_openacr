#!/bin/bash
source mn_set.sh
# echo "run tap locally"
# sudo ~/arnd/bin/atf_snf -dev:data0-4T  -kapi  -dir:local -timestamp_log:N
# sudo ~/release/bin/atf_snf -dev:data0-4T  -kapi  -dir:local -timestamp_log:N

# echo " run locally from pcap"
# atf_snf -dev:data0-4T  -kapi  -dir:local  \
#         -in_file:/home/avorovich/arnd/temp/atf_snf_logs/local/atf_snf.pcap

# #
source mn_set.sh
echo "====================starting tap"
x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y
omcli dev.x2-4.tap% -start_clean
exit

omcli dev.x2-4.tap% -status
omcli dev.x2-4.tap% -stop
sleep 2
omcli dev.x2-4.tap% -collect_logs
omcli dev.x2-4.x2% -collect_logs



exit



echo "collect tap logs"
omcli $tap_omnnode -ignore_omnode_use -status
omcli $tap_omnnode -ignore_omnode_use -stop
sleep 4
omcli $tap_omnnode -ignore_omnode_use -collect_logs
atf_lat -omenv:dev.x2-4  

