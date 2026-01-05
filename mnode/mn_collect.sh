#!/bin/bash
echo "=====================================stop and collect logs"


source mn_set.sh
echo "====================stopping  brokers and taps"
if [ "$omplat" = "ak" ]; then
  echo "stop kafka brokers"mn_c
  # omcli nj1-4.kafka-% -omplat:$omplat  -stop
  omcli nj1-4.kafka-% -omplat:$omplat  -stop_tap
elif [ "$omplat" = "x2" ]; then
  echo "stop x2"
  omcli nj1-4.x2% -omplat:$omplat  -stop
  omcli nj1-4.x2% -omplat:$omplat  -stop_tap
else
  echo "unknown omplat:$omplat - no action"
fi

sleep 2
omcli nj1-4.% -omplat:$omplat  -collect_logs

source mn_set.sh
cd ~/arnd/temp/collect_logs/$omplat
cd "$(ls -dt */ | head -1)"
pwd
find . -type f -name "tcp_pairs_all.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > tcp_pairs_all_all.log
grep kafka-ui tcp_pairs_all_all.log  > tcp_pairs_all_all_kafkaui.log 

find . -type f -name "atf_snf_stdout.log" | sort | while read -r f; do
    printf "\n===== FILE: %s =====\n" "$f"
    cat "$f"
done > tap_all.log

set -x
echo " grep for produce/fetch responses in current log dir $(pwd) "
grep "KafkaStorePayLoad" -rnI .
grep "!seq_gap" -rnI .
grep "atf_snf.error" -rnI .
echo "  "
grep x2msg.info tap_all.log
grep mono tap_all.log_db.mcb.delta1_run_cur_len
grep atf_snf.session_stats tap_all.log
grep q50% tap_all.log
grep atf_snf.session_stats tap_all.log > atf_snf_session_stats.log
# grep calibration tap_all.log
set +x 
cd ~/arnd

# atf
# less "$(ls -dt /home/avorovich/arnd/temp/collect_logs/ak/*/ | head -n 1)/tap_all.log"