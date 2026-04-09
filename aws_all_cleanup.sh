#!/bin/bash


source /home/avorovich/.ssh/awsx2admin.token

echo "=== Cleanup env: awsci1 ==="

# 1. Terminate instance
echo "--- terminating instance ---"
awcli -del -force -device:awsci1.sv1 -env:awsci1

# wait for instance to be gone
for i in $(seq 1 60); do
    OUT=$(awcli -describe -device:awsci1.sv1 -env:awsci1 2>&1)
    if echo "$OUT" | grep -q "instance not defined"; then break; fi
    printf "."
    sleep 2
done
echo ""

# 2. Force-delete ENIs (instance gone, ENIs may still be detaching)
echo "--- deleting ENIs ---"
awcli -del -force -devintf:awsci1.sv1/% -env:awsci1

# 3. Delete EBS volumes (awcli internally waits for deletion)
echo "--- deleting volumes ---"
awcli -del -devebs:awsci1.sv1/sda1 -env:awsci1
awcli -del -devebs:awsci1.sv1/sdf -env:awsci1

# 4. Delete EIP
echo "--- deleting EIP ---"
awcli -del -devintfip:awsci1.sv1/ctrl -env:awsci1

# 5. Delete security group
echo "--- deleting security group ---"
awcli -del -awsg -env:awsci1

# 6. Delete subnet
echo "--- deleting subnet ---"
awcli -del -subnet:awsci1.% -env:awsci1
    
# 7. Delete VPC
echo "--- deleting VPC ---"
awcli -del -awvpc:awsci1 -env:awsci1

echo "=== Done ==="
