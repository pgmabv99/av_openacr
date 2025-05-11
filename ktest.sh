#!/bin/bash
set -x

tag=rdp
# remove old tests
git restore --staged test/atf_comp/kapi.*ReqV*$tag
git restore --staged test/atf_comp/kapi.*RspV*$tag
acr atfdb.comptest:kapi.%ReqV%$tag -del -write
acr atfdb.comptest:kapi.%RspV%$tag -del -write
rm -rf test/atf_comp/kapi.*ReqV*$tag
rm -rf test/atf_comp/kapi.*RspV*$tag

# run test creation scripts( will do acr and run kapi with -capture)
for script in $(ls ~/pcap/$tag/*$tag.sh 2>/dev/null | sort); do

    if [ -f "$script" ]; then
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error occurred while executing $script"
            exit 1
        fi
    fi
done
git add .