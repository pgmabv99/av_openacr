#!/bin/bash

# omcli -omnode:dev.ak-8.uip -stop
# omcli -omnode:dev.ak-8.uip -start
# omcli -omnode:dev.ak-8.uip -status

omcli -omnode:dev.ak-8.uir -stop
omcli -omnode:dev.ak-8.uir -start
omcli -omnode:dev.ak-8.uir -status

# omcli -omnode:dev.ak-8.ui% -stop
# omcli -omnode:dev.ak-8.ui% -start
# omcli -omnode:dev.ak-8.ui% -status
ofile=~/av_openacr/sniffer_logs/atf_snf.log
export LIBIBVERBS_DEBUG=1
sudo ~/arnd/bin/atf_snf -dev:data0-8  -out_file:o1.pcap > $ofile 2>&1; tail -n 20 $ofile
exit
sudo ~/arnd/bin/atf_snf -dev:data0-8   > $ofile 2>&1; tail -n 20 $ofile