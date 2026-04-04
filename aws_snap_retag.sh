#!/bin/bash
# Usage: aws_snap_retag.sh <snap-id> <new-name-tag>
# Example: aws_snap_retag.sh snap-02b7a1fa7aa7bbc06 awsci1.sv1/sda1

SNAP_ID="${1:?usage: aws_snap_retag.sh <snap-id> <new-name-tag>}"
NEW_TAG="${2:?usage: aws_snap_retag.sh <snap-id> <new-name-tag>}"
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=CreateTags" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "ResourceId.1=$SNAP_ID" \
    --data-urlencode "Tag.1.Key=Name" \
    --data-urlencode "Tag.1.Value=$NEW_TAG" | python3 -c '
import sys, json, xmltodict
j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
print(json.dumps(j, indent=2))
'
