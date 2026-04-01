#!/bin/bash

# VOL_NAME="awsci1.sv1/sdf"
VOL_NAME="awsci1.sv1/sda1"
REGION="us-east-1"
MAX_WAIT=1200
INTERVAL=10
ELAPSED=0

while true; do
    source /home/avorovich/.ssh/awsx2admin.token

    VOL_RESPONSE=$(curl -sS --request POST \
        --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
        --aws-sigv4 "aws:amz:$REGION:ec2" \
        "https://ec2.$REGION.amazonaws.com/" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "Action=DescribeVolumes" \
        --data-urlencode "Version=2016-11-15" \
        --data-urlencode "Filter.1.Name=tag:Name" \
        --data-urlencode "Filter.1.Value.1=$VOL_NAME")

    VOL_INFO=$(echo "$VOL_RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
vol_set = j.get("DescribeVolumesResponse", {}).get("volumeSet") or {}
items = vol_set.get("item")

if items is None:
    print("")
elif isinstance(items, list):
    for v in items:
        print(v["volumeId"] + ":" + v["status"])
else:
    print(items["volumeId"] + ":" + items["status"])
')

    if [ -z "$VOL_INFO" ]; then
        echo "Volume $VOL_NAME is deleted."
        break
    fi

    VOLUME_IDS=$(echo "$VOL_INFO" | cut -d: -f1 | tr '\n' ',')
    VOL_STATES=$(echo "$VOL_INFO" | cut -d: -f2 | tr '\n' ',')

    # Check for pending/in-progress snapshots for this volume
    SNAP_RESPONSE=$(curl -sS --request POST \
        --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
        --aws-sigv4 "aws:amz:$REGION:ec2" \
        "https://ec2.$REGION.amazonaws.com/" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "Action=DescribeSnapshots" \
        --data-urlencode "Version=2016-11-15" \
        --data-urlencode "Filter.1.Name=tag:Name" \
        --data-urlencode "Filter.1.Value.1=$VOL_NAME" \
        --data-urlencode "Filter.2.Name=status" \
        --data-urlencode "Filter.2.Value.1=pending")

    SNAP_INFO=$(echo "$SNAP_RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
snap_set = j.get("DescribeSnapshotsResponse", {}).get("snapshotSet") or {}
items = snap_set.get("item")

if items is None:
    print("")
elif isinstance(items, list):
    for s in items:
        print(s["snapshotId"] + ":" + s["status"] + ":" + s.get("progress","?"))
else:
    print(items["snapshotId"] + ":" + items["status"] + ":" + items.get("progress","?"))
')

    if [ -n "$SNAP_INFO" ]; then
        echo "[${ELAPSED}s] Volume $VOL_NAME state=$VOL_STATES ids=$VOLUME_IDS | BLOCKING SNAPSHOT: $SNAP_INFO — waiting..."
    else
        echo "[${ELAPSED}s] Volume $VOL_NAME state=$VOL_STATES ids=$VOLUME_IDS | no pending snapshots, waiting..."
    fi

    sleep $INTERVAL
    ELAPSED=$((ELAPSED + INTERVAL))
    if [ $ELAPSED -ge $MAX_WAIT ]; then
        echo "Timeout waiting for volume deletion."
        exit 1
    fi
done
