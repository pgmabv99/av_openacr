#!/bin/bash

TAG_PATTERN="${1:-awsci1*}"
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

# Describe all instances matching the Name tag pattern
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

echo "$RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
res_set = j.get("DescribeInstancesResponse", {}).get("reservationSet") or {}
reservations = res_set.get("item", [])
if not isinstance(reservations, list):
    reservations = [reservations]

for r in reservations:
    inst_set = r.get("instancesSet", {}) or {}
    instances = inst_set.get("item", [])
    if not isinstance(instances, list):
        instances = [instances]
    for inst in instances:
        iid   = inst.get("instanceId", "")
        state = (inst.get("instanceState") or {}).get("name", "")
        itype = inst.get("instanceType", "")
        az    = (inst.get("placement") or {}).get("availabilityZone", "")
        pub   = inst.get("ipAddress", "")

        # name tag
        name = ""
        tags = inst.get("tagSet") or {}
        tag_items = tags.get("item", [])
        if not isinstance(tag_items, list):
            tag_items = [tag_items]
        for t in tag_items:
            if (t or {}).get("key") == "Name":
                name = t.get("value", "")

        print(f"instance:{name}  id:{iid}  state:{state}  type:{itype}  az:{az}  public_ip:{pub}")

        # ENIs
        eni_set = inst.get("networkInterfaceSet") or {}
        enis = eni_set.get("item", [])
        if not isinstance(enis, list):
            enis = [enis]
        for eni in enis:
            if not eni:
                continue
            eni_id    = eni.get("networkInterfaceId", "")
            eni_desc  = eni.get("description", "")
            eni_priv  = eni.get("privateIpAddress", "")
            eni_stat  = eni.get("status", "")
            eni_dev   = (eni.get("attachment") or {}).get("deviceIndex", "")
            eni_pub   = (eni.get("association") or {}).get("publicIp", "")
            print(f"  eni:{eni_id}  desc:{eni_desc}  dev:{eni_dev}  status:{eni_stat}  private_ip:{eni_priv}  public_ip:{eni_pub}")
'
