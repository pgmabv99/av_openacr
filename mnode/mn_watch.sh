
#!/bin/bash
watch -n 0.5 '
echo status | x2cli;
echo "------";
echo "Memory metrics:";
echo "at % metric -alloc %malloc" | x2cli -u
'


#!/usr/bin/env bash
set -u

# Interval in seconds (0.5s)
INTERVAL=0.5

# Infinite loop
while true; do
    clear

    # Timestamp
    echo "=== $(date +"%Y-%m-%d %H:%M:%S.%3N") ==="

    # Status section
    echo "=== Status ==="
    echo status | stdbuf -oL x2cli

    echo

    # Memory metrics section
    echo "=== Memory metrics ==="
    echo "at % metric -alloc %malloc" | stdbuf -oL x2cli -u

    # Sleep interval
    sleep $INTERVAL
done


watch -n 0.5 -t '
echo "$(date +"%Y-%m-%d %H:%M:%S.%3N")"
echo "=== Status ==="
echo status | stdbuf -oL x2cli
echo
echo "=== Memory metrics ==="
echo "at % metric -alloc %malloc" | stdbuf -oL x2cli -u
'

watch -n 0.5 -t '
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S.%3N")
echo "=== $TIMESTAMP ==="

# --- Status ---
START=$(date +%s%3N)
echo status | stdbuf -oL x2cli
END=$(date +%s%3N)
DURATION=$((END-START))
echo "Status runtime: ${DURATION} ms"

echo

# --- Memory metrics ---
START=$(date +%s%3N)
echo "at % metric -alloc %malloc" | stdbuf -oL x2cli -u
END=$(date +%s%3N)
DURATION=$((END-START))
echo "Memory metrics runtime: ${DURATION} ms"
'
