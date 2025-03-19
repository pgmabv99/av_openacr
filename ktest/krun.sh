#!/bin/bash
set -x
#rebuild 
kbld.sh


# PCAP_FILE="/home/avorovich/pcap/klocal.pcap"
# interface="lo"
PCAP_FILE="/home/avorovich/pcap/klocal_dat0.pcap"
interface="data0"

# Stop any existing tcpdump instances
sudo pkill -INT -x tcpdump
sleep 1

# Remove old pcap file
rm -f "$PCAP_FILE"

# Start tcpdump in the background and capture the correct PID
echo "Starting tcpdump..."
sudo tcpdump -i $interface -w "$PCAP_FILE" port 9092 &
sleep 1

TCPDUMP_PID=$(pgrep -x tcpdump)
echo "tcpdump started with PID: $TCPDUMP_PID"


# Function to cleanup processes
cleanup() {
    echo "Stopping processes..."
    kill "$CONSUMER_PID" "$PRODUCER_PID"
    wait "$CONSUMER_PID" "$PRODUCER_PID" 2>/dev/null

    # Gracefully stop tcpdump
    echo "Stopping tcpdump (PID: $TCPDUMP_PID)..."
    sudo kill -INT "$TCPDUMP_PID"

    tcpdump -r $PCAP_FILE -c 10 -tttt
    exit 0
}

# Trap Ctrl+C and termination signals
trap cleanup SIGINT SIGTERM

# Start consumer
echo "Starting consumer..."
./consumer > logs/consumer.log 2>&1 &
CONSUMER_PID=$!
sleep 2

# Start producer
echo "Starting producer..."
./producer > logs/producer.log 2>&1 &
PRODUCER_PID=$!

# Show PIDs
echo "Producer PID: $PRODUCER_PID, Consumer PID: $CONSUMER_PID (tcpdump PID: $TCPDUMP_PID)"
echo "Press Ctrl+C to stop all processes."

# Wait for processes
wait "$PRODUCER_PID" "$CONSUMER_PID"
cleanup