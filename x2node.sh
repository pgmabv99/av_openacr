#!/usr/bin/env bash
set -e
x2node \
    -node:'dev.kafkaui-5|dev.kafkaw-04|dev.kafkaw-12|dev.kcat-08|dev.rdpui-5|dev.x2-17|dev.x2-18|dev.x2-19|dev.x2-20' \
    -cmd:pwd \
    -q:Y \
    -fail_on_error:Y

x2node \
    -node:'dev.kafkaui-5|dev.kafkaw-04|dev.kafkaw-12|dev.kcat-08|dev.rdpui-5|dev.x2-17|dev.x2-18|dev.x2-19|dev.x2-20' \
    -cmd:'bash  \$HOSTNAME status' \
    -q:Y \
    -fail_on_error:N