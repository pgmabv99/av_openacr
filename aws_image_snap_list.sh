#!/bin/bash

REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

IMG_RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeImages" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "Owner.1=self")

SNAP_RESPONSE=$(curl -sS --request POST \
    --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
    --aws-sigv4 "aws:amz:$REGION:ec2" \
    "https://ec2.$REGION.amazonaws.com/" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "Action=DescribeSnapshots" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "Owner.1=self")

echo "=== IMAGES (self-owned) ==="
echo "$IMG_RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
img_set = j.get("DescribeImagesResponse", {}).get("imagesSet") or {}
items = img_set.get("item")

if items is None:
    print("No images found.")
    sys.exit(0)

if not isinstance(items, list):
    items = [items]

for img in items:
    img_id  = img.get("imageId", "")
    name    = img.get("name", "")
    state   = img.get("imageState", "")
    arch    = img.get("architecture", "")
    created = img.get("creationDate", "")
    print(f"image_id:{img_id}  name:{name}  state:{state}  arch:{arch}  created:{created}")
    tags = img.get("tagSet") or {}
    tag_items = tags.get("item", [])
    if not isinstance(tag_items, list):
        tag_items = [tag_items]
    for t in tag_items:
        if t:
            k = t.get("key", "")
            v = t.get("value", "")
            print(f"  tag:{k}={v}")
'

echo ""
echo "=== SNAPSHOTS (self-owned) ==="
echo "$SNAP_RESPONSE" | python3 -c '
import sys, json, xmltodict

j = json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
snap_set = j.get("DescribeSnapshotsResponse", {}).get("snapshotSet") or {}
items = snap_set.get("item")

if items is None:
    print("No snapshots found.")
    sys.exit(0)

if not isinstance(items, list):
    items = [items]

for s in items:
    snap_id  = s.get("snapshotId", "")
    vol_id   = s.get("volumeId", "")
    size     = s.get("volumeSize", "")
    status   = s.get("status", "")
    progress = s.get("progress", "")
    started  = s.get("startTime", "")
    print(f"snap_id:{snap_id}  vol_id:{vol_id}  size:{size}GB  status:{status}  progress:{progress}  started:{started}")
    tags = s.get("tagSet") or {}
    tag_items = tags.get("item", [])
    if not isinstance(tag_items, list):
        tag_items = [tag_items]
    for t in tag_items:
        if t:
            k = t.get("key", "")
            v = t.get("value", "")
            print(f"  tag:{k}={v}")
'
