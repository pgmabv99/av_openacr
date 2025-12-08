
#!/bin/bash

# cfg=debug
cfg=release

omplat=ak
# omplat=x2
# omplat=local

tap_omnnode=dev.x2-4.tap-1_ext_0  # device:nj1.sv2  omnode:kafka-1 node:dev.kafka-13
# tap_omnnode=dev.x2-4.tap-4_ext_0  # device:nj1.sv5 omnode:kafka-4 node:dev.kafka-16

if [ "$omplat" = "ak" ]; then
  server="dev.x2-4.kafka-1.ext-0:1643"
elif [ "$omplat" = "x2" ]; then
  server="192.168.104.5:1558"
elif [ "$omplat" = "local" ]; then
  server=localhost:9092
else
  echo "unknown omplat:$omplat - no action"
fi
topic=test-topic
echo "setup  omplat:$omplat server:$server topic:$topic tap_omnnode:$tap_omnnode"