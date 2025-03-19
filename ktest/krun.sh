#!/bin/bash
set -x
#rebuild 
kbld.sh


# pcap_file="/home/avorovich/pcap/klocal.pcap"
# interface="lo"
# ip="localhost:9092"
# tcpdump_bin="tcpdump"

pcap_file="/home/avorovich/pcap/klocal_dat0.pcap"
interface="data0"
ip="192.168.110.11:9092"
tcpdump_bin="tcpdump"

echo "rebuild topics"
/opt/kafka/bin/kafka-topics.sh --delete --topic test-topic --bootstrap-server $ip
/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server $ip --partitions 1 --replication-factor 1
/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server $ip

# Stop any existing tcpdump instances
sudo pkill -INT -x $tcpdump_bin
sleep 1

# Remove old pcap file
rm -f "$pcap_file"

# Start tcpdump in the background and capture the correct PID
echo "Starting $tcpdump_bin on interface $interface, capturing to $pcap_file..."
sudo $tcpdump_bin -i $interface -w "$pcap_file" port 9092 &
sleep 1

tcpdump_pid=$(pgrep -x $tcpdump_bin)
echo "tcpdump started with PID: $tcpdump_pid"


# Function to cleanup processes
cleanup() {
    echo "Stopping processes..."
    kill "$consumer_pid" "$producer_pid"
    wait "$consumer_pid" "$producer_pid" 2>/dev/null

    # Gracefully stop tcpdump
    echo "Stopping $tcpdump_bin (PID: $tcpdump_pid)..."
    sudo kill -INT "$tcpdump_pid"

    $tcpdump_bin -r $pcap_file -c 10 -tttt
    exit 0
}

# Trap Ctrl+C and termination signals
trap cleanup SIGINT SIGTERM

# Start consumer
echo "Starting consumer..."
./consumer > logs/consumer.log 2>&1 &
consumer_pid=$!
sleep 2

# Start producer
echo "Starting producer..."
./producer > logs/producer.log 2>&1 &
producer_pid=$!

# Show PIDs
echo "Producer PID: $producer_pid, Consumer PID: $consumer_pid (tcpdump PID: $tcpdump_pid)"
echo "Press Ctrl+C to stop all processes."

# Wait for processes
wait "$producer_pid" "$consumer_pid"
cleanup