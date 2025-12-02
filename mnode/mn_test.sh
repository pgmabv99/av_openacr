#!/bin/bash
mn_clean.sh
mn_tap.sh
mn_brokers.sh
sleep 8
mn_produce.sh
mn_consume.sh
# loop in above
exit


source mn_set.sh
omcli dev.x2-4.x2% -omplat:$omplat  -stop
omcli dev.x2-4.tap% -omplat:$omplat  -stop
omcli dev.x2-4.rdpui% -omplat:$omplat  -stop
sleep 2
omcli dev.x2-4.% -omplat:$omplat  -collect_logs

find . -type f -name "tcp_pairs_all.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > tcp_pairs_all_all.log