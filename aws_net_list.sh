#!/bin/bash

PREFIX=${1:-awsci1}
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

awscurl() {
    curl -sS --request POST \
        --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
        --aws-sigv4 "aws:amz:$REGION:ec2" \
        "https://ec2.$REGION.amazonaws.com/" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        "$@"
}

echo "=== Network objects for prefix: $PREFIX ==="

echo "--- VPCs ---"
awscurl --data-urlencode "Action=DescribeVpcs" \
        --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeVpcsResponse",{}).get("vpcSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for v in items:
    tags=(v.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if name.startswith(prefix): print(v.get("vpcId",""), v.get("state",""), v.get("cidrBlock",""), "Name:"+name)
'

echo "--- Subnets ---"
awscurl --data-urlencode "Action=DescribeSubnets" \
        --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeSubnetsResponse",{}).get("subnetSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for s in items:
    tags=(s.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if name.startswith(prefix): print(s.get("subnetId",""), s.get("state",""), s.get("cidrBlock",""), "Name:"+name)
'

echo "--- Route tables ---"
awscurl --data-urlencode "Action=DescribeRouteTables" \
        --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeRouteTablesResponse",{}).get("routeTableSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for r in items:
    tags=(r.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if name.startswith(prefix): print(r.get("routeTableId",""), r.get("vpcId",""), "Name:"+name)
'

echo "--- Security groups ---"
awscurl --data-urlencode "Action=DescribeSecurityGroups" \
        --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeSecurityGroupsResponse",{}).get("securityGroupInfo") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for s in items:
    name=s.get("groupName","")
    if name.startswith(prefix): print(s.get("groupId",""), "Name:"+name, s.get("vpcId",""))
'

echo "--- ENIs ---"
awscurl --data-urlencode "Action=DescribeNetworkInterfaces" \
        --data-urlencode "Version=2016-11-15" \
        --data-urlencode "Filter.1.Name=tag:Name" \
        --data-urlencode "Filter.1.Value.1=$PREFIX*" | python3 -c '
import sys,json,xmltodict
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeNetworkInterfacesResponse",{}).get("networkInterfaceSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
for e in items:
    tags=(e.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    print(e.get("networkInterfaceId",""), e.get("status",""), e.get("privateIpAddress",""), "Name:"+name)
'

echo "=== Done ==="
