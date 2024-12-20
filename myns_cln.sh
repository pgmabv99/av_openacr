#!/bin/bash
set -x
set -e
# Define the host and port
HOST="localhost"
PORT="8080"

# Define the input to be sent to the telnet session
# INPUTS=("part99 10" "part98 10")
INPUTS=("myns.NewOrderReqMsg part_key:part98  amt:10" "myns.NewOrderReqMsg part_key:part99  amt:10")

# Use netcat to connect to the host and port, send the inputs separately, and resume live input after
{
    for input in "${INPUTS[@]}"; do
        echo -e "$input"
        sleep 1
    done
    cat
} | nc $HOST $PORT
