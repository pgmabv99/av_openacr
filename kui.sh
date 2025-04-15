#!/bin/bash

# omcli -omnode:dev.ak-8.uip -stop
# omcli -omnode:dev.ak-8.uip -start
# omcli -omnode:dev.ak-8.uip -status

omcli -omnode:dev.ak-8.% -stop
omcli -omnode:dev.ak-8.b% -start
omcli -omnode:dev.ak-8.b% -status
# omcli -omnode:dev.ak-8.uir -start

ofile=~/av_openacr/sniffer_logs/atf_snf.log
echo "....starting atf_snf. use ctrl+C to enter commands . stdout is rediected to $ofile"
echo "....monitoring subset in temp/atf_snf.dat . "
sudo ~/arnd/bin/atf_snf -dev:data0-8  -out_file:o1.pcap > $ofile 2>&1; tail -n 20 $ofile

