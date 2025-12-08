#!/bin/bash
echo "====================collect logs"
source mn_set.sh
omcli dev.x2-4.x2% -omplat:$omplat  -stop
omcli dev.x2-4.kafkaui% -omplat:$omplat  -stop
omcli dev.x2-4.tap% -omplat:$omplat  -stop
omcli dev.x2-4.rdpui% -omplat:$omplat  -stop
sleep 2
omcli dev.x2-4.% -omplat:$omplat  -collect_logs

cd ~/arnd/temp/collect_logs/$omplat
cd "$(ls -dt */ | head -1)"
find . -type f -name "tcp_pairs_all.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > tcp_pairs_all_all.log
grep kafka-ui tcp_pairs_all_all.log  > tcp_pairs_all_all_kafkaui.log  
cd ~/arnd