#!/bin/bash
set -x
set -e



#  set parms for atf_awcli
acr -merge  -write <<EOF
acr.delete  dkrdb.k8ns  k8ns:awsci1
EOF

acr -merge -write <<EOF
  dkrdb.k8ns  k8ns:awsci1  comment:""
  x2rdb.env  env:awsci1  envtype:aws_general  owner:x2admin  comment:"same as AWS VPC"
    awsdb.awvpc  awvpc:awsci1  awregion:us-east-1  cidr:10.0.0.0/16  comment:""
      awsdb.awsg  awsg:awsci1.sg-1  comment:"allow tcp/22 and icmp from 0.0.0.0/0"
        awsdb.awsgrule  awsgrule:awsci1.sg-1/icmp  ingress:Y  prot:icmp  ports:-1:-1  net:0.0.0.0/0  comment:""
        awsdb.awsgrule  awsgrule:awsci1.sg-1/ssh   ingress:Y  prot:tcp   ports:22:22  net:0.0.0.0/0  comment:""

    awsdb.envvtpath  envvtpath:awsci1.aws/awsx2admin  comment:"amazon keys to awsci1 env"
    x2rdb.device  device:awsci1.sv1  devtype:server  os:Linux  comment:"host on AWS"
      awsdb.devawspec  device:awsci1.sv1  awspec:test-1  comment:""
      awsdb.devebs  devebs:awsci1.sv1/sdf  size_gb:100  voltype:gp3  comment:""
      x2rdb.devintf  devintf:awsci1.sv1/ctrl  subnet:awsci1.ctrl  ip:10.0.10.11  comment:"control interface"
        x2rdb.devintfip  devintf:awsci1.sv1/ctrl  public_ip:54.211.255.69  comment:""

      x2rdb.devintf  devintf:awsci1.sv1/data0  subnet:awsci1.data0  ip:10.0.20.11  comment:"control interface"

    x2rdb.device  device:awsci1.sv2  devtype:server  os:Linux  comment:"host on AWS"
      awsdb.devawspec  device:awsci1.sv2  awspec:test-1  comment:""
      awsdb.devebs  devebs:awsci1.sv2/sdf  size_gb:100  voltype:gp3  comment:""
      x2rdb.devintf  devintf:awsci1.sv2/ctrl  subnet:awsci1.ctrl  ip:10.0.10.12  comment:"control interface"
        x2rdb.devintfip  devintf:awsci1.sv2/ctrl  public_ip:44.195.206.205  comment:""

      x2rdb.devintf  devintf:awsci1.sv2/data0  subnet:awsci1.data0  ip:10.0.20.12  comment:"control interface"

    x2rdb.node  node:awsci1.sn1.ec2vm  passive:N  comment:"amazon EC2VM host"
      x2rdb.nodeacct  nodeacct:awsci1.sn1.ec2vm.x2admin  active:Y  sudo:Y  dflt:Y  ws2ssh:N  comment:""
        x2rdb.nodeacctkey  nodeacctkey:awsci1.sn1.ec2vm.x2admin/vparizhs@dev.host  comment:""

      x2rdb.nodehost  node:awsci1.sn1.ec2vm  devintf:awsci1.sv1/ctrl  comment:""

    x2rdb.node  node:awsci1.sn2.ec2vm  passive:N  comment:"amazon EC2VM host"
      x2rdb.nodeacct  nodeacct:awsci1.sn2.ec2vm.x2admin  active:Y  sudo:Y  dflt:Y  ws2ssh:N  comment:""
        x2rdb.nodeacctkey  nodeacctkey:awsci1.sn2.ec2vm.x2admin/vparizhs@dev.host  comment:""

      x2rdb.nodehost  node:awsci1.sn2.ec2vm  devintf:awsci1.sv2/ctrl  comment:""

    x2rdb.subnet  subnet:awsci1.ctrl  net:ctrl-0  cidr:10.0.10.0/24  comment:""
      awsdb.subnetaz  subnet:awsci1.ctrl  awzone:use1-az1  comment:"access zone"
      awsdb.subnetrt  subnetrt:awsci1.ctrl/igw    dst:0.0.0.0/0    comment:"route to security gw"
      awsdb.subnetrt  subnetrt:awsci1.ctrl/local  dst:10.0.0.0/16  comment:route

    x2rdb.subnet  subnet:awsci1.data0  net:int-0  cidr:10.0.20.0/24  comment:""
      awsdb.subnetaz  subnet:awsci1.data0  awzone:use1-az1  comment:""
      awsdb.subnetrt  subnetrt:awsci1.data0/local  dst:10.0.0.0/16  comment:"vpc local route"

    x2rdb.subnet  subnet:awsci1.data2  net:ext-0  cidr:10.0.30.0/24  comment:""
      awsdb.subnetaz  subnet:awsci1.data2  awzone:use1-az1  comment:""
      awsdb.subnetrt  subnetrt:awsci1.data2/local  dst:10.0.0.0/16  comment:"vpc local route"

x2rdb.envtype  envtype:aws_general  comment:"aws hosts"
x2rdb.uid  uid:UID.1100  comment:"x2usr port22"
  x2rdb.user  user:x2admin  uid:UID.1100  active:Y  fullname:svc  email:vlad@algox2.com  comment:""

awsdb.awspecsg  awspecsg:test-1.awsci1.sg-1  comment:""
EOF



echo "done!!!!!!!!!!!!"
