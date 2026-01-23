#!/bin/bash
# Measure peak memory usage for a group of processes

POD_CGROUP=$(cat /proc/self/cgroup | head -1 | cut -d: -f3)
CGROUP_PATH="/sys/fs/cgroup${POD_CGROUP}"

echo "Monitoring memory in: $CGROUP_PATH"
echo "Starting monitoring..."

# Initial memory
INITIAL_FILE=$(cat $CGROUP_PATH/memory.stat | grep "^file " | awk '{print $2}')
INITIAL_SLAB=$(cat $CGROUP_PATH/memory.stat | grep "^slab " | awk '{print $2}')
INITIAL_TOTAL=$((INITIAL_FILE + INITIAL_SLAB))

echo "Initial memory: $(numfmt --to=iec $INITIAL_TOTAL 2>/dev/null || echo $INITIAL_TOTAL) bytes"
echo ""
echo "Run your processes now. This script will monitor in background."
echo "Press Ctrl+C when done, or wait for processes to complete."
echo ""

# Monitor memory in background
while true; do
    FILE=$(cat $CGROUP_PATH/memory.stat | grep "^file " | awk '{print $2}')
    SLAB=$(cat $CGROUP_PATH/memory.stat | grep "^slab " | awk '{print $2}')
    TOTAL=$((FILE + SLAB))
    DELTA=$((TOTAL - INITIAL_TOTAL))
    
    echo -ne "\rCurrent: $(numfmt --to=iec $TOTAL 2>/dev/null || echo $TOTAL) bytes | Delta: $(numfmt --to=iec $DELTA 2>/dev/null || echo $DELTA) bytes"
    sleep 1
done