#!/bin/bash
#rebuild 
kbld.sh
# Paths to executables
PRODUCER_BIN="./producer"
CONSUMER_BIN="./consumer"

# Log files
PRODUCER_LOG="logs/producer.log"
CONSUMER_LOG="logs/consumer.log"

# Remove old log files
rm -f $PRODUCER_LOG $CONSUMER_LOG
# recreate the topic
/opt/kafka/bin/kafka-topics.sh --delete --topic test-topic --bootstrap-server localhost:9092
/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# Check if executables exist
if [ ! -f "$PRODUCER_BIN" ] || [ ! -f "$CONSUMER_BIN" ]; then
    echo "Error: $PRODUCER_BIN or $CONSUMER_BIN not found. Compile them first."
    exit 1
fi

# Start consumer in background
echo "Starting consumer..."
$CONSUMER_BIN > $CONSUMER_LOG 2>&1 &
CONSUMER_PID=$!
sleep 4  # Give consumer time to start

# Start producer in background
echo "Starting producer..."
$PRODUCER_BIN > $PRODUCER_LOG 2>&1 &
PRODUCER_PID=$!

# Function to handle cleanup
cleanup() {
    echo "Shutting down..."
    if ps -p $PRODUCER_PID > /dev/null; then
        kill $PRODUCER_PID
    fi
    kill   $CONSUMER_PID
    wait $PRODUCER_PID $CONSUMER_PID
    exit 0
}

# Trap signals for cleanup
trap cleanup SIGINT SIGTERM

# Monitor processes
echo "Producer PID: $PRODUCER_PID, Consumer PID: $CONSUMER_PID"
echo "Press Ctrl+C to stop both processes."
echo "Logs: $PRODUCER_LOG, $CONSUMER_LOG"

# Wait for processes to exit
wait $PRODUCER_PID $CONSUMER_PID