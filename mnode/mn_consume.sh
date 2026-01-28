#!/bin/bash

source mn_set.sh

echo "====================starting consume"
set -x
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server $server \
  --topic $topic \
  --group test-consumer-group \
  --from-beginning \
  --property print.timestamp=true \
  --property print.offset=true \
  --timeout-ms 5000 || true
  
exit
# =================
echo
sleep 2
source mn_set.sh
/opt/kafka/current/bin/kafka-consumer-groups.sh \
    --bootstrap-server $server \
    --group test-consumer-group \
    --describe
sleep 2
