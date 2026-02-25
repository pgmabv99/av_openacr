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