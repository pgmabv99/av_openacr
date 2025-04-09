#!/bin/bash

omcli -omnode:dev.ak-8.uip -stop
omcli -omnode:dev.ak-8.uip -start
omcli -omnode:dev.ak-8.uip -status
ofile=~/av_openacr/sniffer_logs/atf_snf.log
sudo ~/arnd/bin/atf_snf -dev:data0-8 > $ofile 2>&1; tail -n 20 $ofile