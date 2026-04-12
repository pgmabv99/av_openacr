#!/bin/bash

TAG_PATTERN="${1:-awsci1*}"
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

# Discover all instances matching the Name tag pattern
RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeInstances" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "MaxResults=100" \
    --data-urlencode "Filter.1.Name=tag:Name" \
    --data-urlencode "Filter.1.Value.1=$TAG_PATTERN")

INSTANCE_IDS=$(echo "$RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
res_set = j.get("DescribeInstancesResponse", {}).get("reservationSet") or {}
reservations = res_set.get("item", [])
if not isinstance(reservations, list):
    reservations = [reservations]

ids = []
for r in reservations:
    inst_set = r.get("instancesSet", {}) or {}
    instances = inst_set.get("item", [])
    if not isinstance(instances, list):
        instances = [instances]
    for inst in instances:
        state = (inst.get("instanceState") or {}).get("name", "")
        if state not in ("terminated", "shutting-down"):
            ids.append(inst.get("instanceId", ""))

print(" ".join(ids))
')

if [ -z "$INSTANCE_IDS" ]; then
    echo "No instances found for tag pattern: $TAG_PATTERN"
    exit 0
fi

echo "Terminating: $INSTANCE_IDS"

# Build InstanceId.N params
PARAMS="Action=TerminateInstances&Version=2016-11-15"
N=1
for ID in $INSTANCE_IDS; do
    PARAMS="$PARAMS&InstanceId.$N=$ID"
    N=$((N+1))
done

RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data "$PARAMS")

echo "$RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items = (j.get("TerminateInstancesResponse", {}).get("instancesSet") or {}).get("item", [])
if not isinstance(items, list):
    items = [items]

for inst in items:
    iid  = inst.get("instanceId", "")
    prev = (inst.get("previousState") or {}).get("name", "")
    curr = (inst.get("currentState")  or {}).get("name", "")
    print(f"id:{iid}  {prev} -> {curr}")
'
