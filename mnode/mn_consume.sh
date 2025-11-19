#!/bin/bash

source mn_set.sh
echo "consume  "
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server $server \
  --topic test-topic \
  --group test-consumer-group \
  --from-beginning \
  --property print.timestamp=true
  
exit
# =================
echo
sleep 2
/opt/kafka/current/bin/kafka-consumer-groups.sh \
    --bootstrap-server $server \
    --group test-consumer-group \
    --describe
sleep 2
