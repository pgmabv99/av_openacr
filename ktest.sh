#!/bin/bash
# atf_comp -e kapi.DecodeApiVersionsRequestV3rdp

# test=kapi.MetadataReqV9Rdp
# atf_comp -e $test
# atf_comp -capture  $test
# atf_comp -run   $test
# acr % -check -x
# git-add-to-last-commit

for script in ~/pcap/cap/*.sh; do
    if [ -f "$script" ]; then
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error occurred while executing $script"
            exit 1
        fi
    fi
done