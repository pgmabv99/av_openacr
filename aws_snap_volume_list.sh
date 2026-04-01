#!/bin/bash

REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeSnapshots" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "Owner.1=self")

VOL_RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeVolumes" \
    --data-urlencode "Version=2016-11-15")

echo "=== VOLUMES ==="
echo "$VOL_RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
vol_set = j.get("DescribeVolumesResponse", {}).get("volumeSet") or {}
items = vol_set.get("item")

if items is None:
    print("No volumes found.")
    sys.exit(0)

if not isinstance(items, list):
    items = [items]

print("{:<24} {:>6} {:<12} {:<12} {}".format("VOLUME ID", "SIZE", "STATUS", "TYPE", "NAME TAG"))
print("-" * 80)
for v in items:
    vol_id = v.get("volumeId", "")
    size   = v.get("size", "")
    status = v.get("status", "")
    vtype  = v.get("volumeType", "")
    tags = v.get("tagSet") or {}
    tag_items = tags.get("item", [])
    if not isinstance(tag_items, list):
        tag_items = [tag_items]
    name = next((t["value"] for t in tag_items if t.get("key") == "Name"), "")
    print("{:<24} {:>6} {:<12} {:<12} {}".format(vol_id, size, status, vtype, name))
'

echo ""
echo "=== SNAPSHOTS ==="
echo "$RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
snap_set = j.get("DescribeSnapshotsResponse", {}).get("snapshotSet") or {}
items = snap_set.get("item")

if items is None:
    print("No snapshots found.")
    sys.exit(0)

if not isinstance(items, list):
    items = [items]

print("{:<25} {:<22} {:>6} {:<12} {:>9}  {}".format("SNAPSHOT ID", "VOLUME ID", "SIZE", "STATUS", "PROGRESS", "NAME TAG"))
print("-" * 100)
for s in items:
    snap_id   = s.get("snapshotId", "")
    vol_id    = s.get("volumeId", "")
    size      = s.get("volumeSize", "")
    status    = s.get("status", "")
    progress  = s.get("progress", "")
    tags = s.get("tagSet") or {}
    tag_items = tags.get("item", [])
    if not isinstance(tag_items, list):
        tag_items = [tag_items]
    name = next((t["value"] for t in tag_items if t.get("key") == "Name"), "")
    print(f"{snap_id:<25} {vol_id:<22} {size:>6} {status:<12} {progress:>9}  {name}")
'
