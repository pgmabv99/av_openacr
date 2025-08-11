#!/bin/bash
omplat=ak
omplat=rp

if [[ "$omplat" == "ak" ]]; then
    echo "describe group"
    omcli dev.x2-4.kafka-1  -omplat:ak -shell_cmd:"kafka/bin/kafka-consumer-groups.sh   --bootstrap-server dev.x2-4.kafka-1.ext-0:1643   --describe --group my-group"
    echo "reset offsets"
    omcli dev.x2-4.kafka-1  -omplat:ak -shell_cmd:"kafka/bin/kafka-consumer-groups.sh   --bootstrap-server dev.x2-4.kafka-1.ext-0:1643   --group my-group   --topic my-test-topic   --reset-offsets --to-earliest --execute"
    echo "describe group"
    omcli dev.x2-4.kafka-1  -omplat:ak -shell_cmd:"kafka/bin/kafka-consumer-groups.sh   --bootstrap-server dev.x2-4.kafka-1.ext-0:1643   --describe --group my-group"
elif  [[ "$omplat" == "rp" ]]; then
    # echo "list topics"
    # omcli dev.x2-4.rdp-1  -omplat:rp -shell_cmd:"/opt/redpanda/bin/rpk topic list --brokers dev.x2-4.rdp-1.ext-0:1628"
    # echo "describe topic"
    # omcli dev.x2-4.rdp-1  -omplat:rp -shell_cmd:"/opt/redpanda/bin/rpk topic describe my-test-topic --brokers dev.x2-4.rdp-1.ext-0:1628"
    echo "describe group"
    omcli dev.x2-4.rdp-1  -omplat:rp -shell_cmd:"/opt/redpanda/bin/rpk group describe my-group --brokers dev.x2-4.rdp-1.ext-0:1628"
    echo "reset group"
    omcli dev.x2-4.rdp-1  -omplat:rp -shell_cmd:"rpk group seek my-group --to start --brokers dev.x2-4.rdp-1.ext-0:1628"
    echo "describe group"
    omcli dev.x2-4.rdp-1  -omplat:rp -shell_cmd:"/opt/redpanda/bin/rpk group describe my-group --brokers dev.x2-4.rdp-1.ext-0:1628"
        
fi

