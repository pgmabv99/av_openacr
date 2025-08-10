kafka/bin/kafka-consumer-groups.sh   --bootstrap-server dev.x2-4.kafka-1.ext-0:1643   --group my-group   --topic my-test-topic:   --reset-offsets --to-earliest --execute

Error: Assignments can only be reset if the group 'my-group' is inactive, but the current state is Stable.
