#!/bin/bash
set -x
set -e

cd $HOME/arnd

# acr_ed -del -target:x2bm_pcap -write 
# acr_ed -create -target:x2bm_pcap -write 
# acr_compl -install
# amc

#  del
acr_ed -del  -ctype x2bm_pcap.FMac -write

#  create ctype with one field and index on it 
acr_ed -create -ctype x2bm_pcap.FMac -pooltype Tpool -indexed -write  -comment "mac entry"

acr_ed -create -field x2bm_pcap.FMac.count -arg i32  -write
acr_ed -create -field x2bm_pcap.FDb.zd_mac -cascdel -write -comment ""
amc 
ai 