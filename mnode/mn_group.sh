#!/bin/bash

source mn_set.sh
/opt/kafka/current/bin/kafka-consumer-groups.sh \
    --bootstrap-server $server \
    --group test-consumer-group \
    --describe
