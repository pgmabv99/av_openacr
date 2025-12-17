#!/bin/bash
echo "=====================================stop and collect logs"


source mn_set.sh
echo "====================stopping  brokers"
if [ "$omplat" = "ak" ]; then
  echo "stop kafka brokers"
#   omcli dev.x2-4.kafka-% -omplat:$omplat  -stop
elif [ "$omplat" = "x2" ]; then
  echo "stop x2"
#   omcli dev.x2-4.x2% -omplat:$omplat  -stop
else
  echo "unknown omplat:$omplat - no action"
fi

echo "====================stopping tap"
omcli dev.x2-4.tap% -omplat:$omplat  -stop
sleep 2
omcli dev.x2-4.% -omplat:$omplat  -collect_logs

source mn_set.sh
cd ~/arnd/temp/collect_logs/$omplat
cd "$(ls -dt */ | head -1)"
pwd
find . -type f -name "tcp_pairs_all.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > tcp_pairs_all_all.log
grep kafka-ui tcp_pairs_all_all.log  > tcp_pairs_all_all_kafkaui.log 

find . -type f -name "dev.x2-4.tap*.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > x2-4.tap_all.log

set -x
echo " grep for produce/fetch responses in current log dir $(pwd) "
grep "KafkaStorePayLoad" -rnI .
grep "!seq_gap" -rnI .
grep "atf_snf.error" -rnI .
echo "  "
grep x2msg.info x2-4.tap_all.log
echo "  "
# grep calibration  x2-4.tap_all.log
set +x 
cd ~/arnd

atf_lat -omenv:dev.x2-4 