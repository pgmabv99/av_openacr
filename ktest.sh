#!/bin/bash
set -x

tag=rdp
git restore --staged test/atf_comp/kapi.*ReqV*$tag
git restore --staged test/atf_comp/kapi.*RspV*$tag
acr atfdb.comptest:kapi.%ReqV%$tag -del -write
acr atfdb.comptest:kapi.%RspV%$tag -del -write
rm -rf test/atf_comp/kapi.*ReqV*$tag
rm -rf test/atf_comp/kapi.*RspV*$tag
for script in ~/pcap/cap/*$tag.sh; do
    if [ -f "$script" ]; then
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error occurred while executing $script"
            exit 1
        fi
    fi
done