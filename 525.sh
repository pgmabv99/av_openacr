#!/bin/bash
set -x
set -e

acr_ed -create -target:x2bm_pcap -write 
acr_compl -install
amc
ai x2bm_pcap