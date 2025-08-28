#!/bin/bash
kc2-kc2_clean.sh
# 1st step "Populate Kafka Cluster with the data"
# it runs for 6 minutes...
omcli  dev.x2-4 -omtest:om_benchmark -omplat:ak

# load into s3
omcli  dev.x2-4 -omtest:s3sink_manual -omplat:ak  -omrun_connect:aiven-s3sink.dflt -omrun_worker:kafka-connect.dflt 

# load back into the same topic  s3
omcli  dev.x2-4 -omtest:s3sink_manual -omplat:ak  -omrun_connect:aiven-s3source.dflt -omrun_worker:kafka-connect.dflt 



