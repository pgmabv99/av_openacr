#!/bin/bash

SNAP_TAG="${1:-awsci1.sv1/sdf}"
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeSnapshots" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "Owner.1=self" \
    --data-urlencode "Filter.1.Name=tag:Name" \
    --data-urlencode "Filter.1.Value.1=$SNAP_TAG")

SNAP_IDS=$(echo "$RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
snap_set = j.get("DescribeSnapshotsResponse", {}).get("snapshotSet") or {}
items = snap_set.get("item")

if items is None:
    pass
elif not isinstance(items, list):
    items = [items]

if items:
    for s in items:
        print(s["snapshotId"])
')

if [ -z "$SNAP_IDS" ]; then
    echo "No snapshots found with tag Name=$SNAP_TAG"
    exit 0
fi

for SNAP_ID in $SNAP_IDS; do
    echo "Deleting $SNAP_ID (tag=$SNAP_TAG)..."
    DEL_RESPONSE=$(curl -sS --request POST \
        --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
        --aws-sigv4 "aws:amz:$REGION:ec2" \
        "https://ec2.$REGION.amazonaws.com/" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "Action=DeleteSnapshot" \
        --data-urlencode "Version=2016-11-15" \
        --data-urlencode "SnapshotId=$SNAP_ID")

    RESULT=$(echo "$DEL_RESPONSE" | python3 -c '
import sys, json, xmltodict
j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
if "DeleteSnapshotResponse" in j:
    print("ok")
else:
    errs = j.get("Response", {}).get("Errors", {}).get("Error", {})
    print("ERROR: " + str(errs.get("Message", j)))
')
    echo "  $SNAP_ID: $RESULT"
done
