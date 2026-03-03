#!/bin/bash

run_test() {
    local test=$1
    echo ""
    echo "=====================================running test $test"
    atf_comp "$test"
    ps -aux | grep java | grep -v grep || echo "java not found"
}

pkill -f java || true
run_test "atf_exp.RecoverAftPSSPlusRestart"
run_test "atf_exp.KafkaClient"
run_test "atf_exp.KafkaPubPart10x8KB"
run_test "atf_exp.KafkaPub2000x1MB"


atf_comp "atf_exp.KafkaPubPart10x8KB|atf_exp.KafkaPub2000x1MB"
atf_comp "atf_exp.RecoverAftPSSPlusRestart|atf_exp.KafkaClient|atf_exp.KafkaPubPart10x8KB|atf_exp.KafkaPub2000x1MB"
atf_comp "atf_exp.RecoverAftPSSPlusRestart|atf_exp.KafkaClient"
atf_comp "atf_exp.KafkaClient"  
atf_comp "atf_exp.RecoverAftPSSPlusRestart"
atf_comp "atf_exp.KafkaPubPart10x8KB"
 ps -aux | grep java | grep -v grep || echo "java not found"

kafkaport=5405
 /opt/kafka/current/bin/kafka-console-consumer.sh  --bootstrap-server 127.0.0.1:$kafkaport --topic demo10 --group demo10-kafka-g  --from-beginning \
  --property print.key=true --property print.value=true --property print.timestamp=true --property print.partition=true \
  --max-messages 100 2>/dev/null | wc -l

pkill -f java
x22sup_start.sh
echo "started x22sup, "
sleep 1
bash --noprofile --norc -c '
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server 127.0.0.1:'"$kafkaport"' \
  --topic demo10 \
  --group demo10-kafka-g \
  --from-beginning \
  --property print.key=true \
  --property print.value=true \
  --property print.timestamp=true \
  --property print.partition=true \
  --max-messages 100 2>/dev/null 
'

ps -e -o pid,ppid,cmd --forest