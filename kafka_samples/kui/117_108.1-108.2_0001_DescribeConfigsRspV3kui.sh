#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsRspV3kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsRspV3kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsRspV3kui
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsRspV3kui args:"-decode -hex -rsp:- -apiver:1.32.3"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100000.in  istuple:N  msg:"00 00 6b e6 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00 00 04 00 01 31 00 00 01 3d 00 21 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100010.in  istuple:N  msg:"67 2e 63 6c 65 61 6e 65 72 2e 6d 69 6e 2e 63 6f 6d 70 61 63 74 69 6f 6e 2e 6c 61 67 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100020.in  istuple:N  msg:"01 30 00 05 00 00 00 00 01 00 21 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 6d 69 6e 2e 63 6f 6d 70 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100030.in  istuple:N  msg:"63 74 69 6f 6e 2e 6c 61 67 2e 6d 73 00 01 30 05 05 ff ff 00 1c 6f 66 66 73 65 74 73 2e 74 6f 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100040.in  istuple:N  msg:"69 63 2e 6e 75 6d 2e 70 61 72 74 69 74 69 6f 6e 73 00 02 35 30 01 05 00 00 00 00 01 00 1c 6f 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100050.in  istuple:N  msg:"66 73 65 74 73 2e 74 6f 70 69 63 2e 6e 75 6d 2e 70 61 72 74 69 74 69 6f 6e 73 00 02 35 30 05 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100060.in  istuple:N  msg:"ff ff 00 29 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100070.in  istuple:N  msg:"6e 74 2e 72 65 66 72 65 73 68 2e 6d 73 00 07 33 36 30 30 30 30 30 01 05 00 00 00 00 01 00 29 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100080.in  istuple:N  msg:"61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74 2e 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100090.in  istuple:N  msg:"66 72 65 73 68 2e 6d 73 00 07 33 36 30 30 30 30 30 05 05 ff ff 00 29 72 65 6d 6f 74 65 2e 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100100.in  istuple:N  msg:"67 2e 6d 65 74 61 64 61 74 61 2e 6d 61 6e 61 67 65 72 2e 6c 69 73 74 65 6e 65 72 2e 6e 61 6d 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100110.in  istuple:N  msg:"ff ff 01 05 00 00 00 00 00 02 ff ff 00 1b 6c 6f 67 2e 66 6c 75 73 68 2e 69 6e 74 65 72 76 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100120.in  istuple:N  msg:"2e 6d 65 73 73 61 67 65 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100130.in  istuple:N  msg:"00 00 00 00 01 00 1b 6c 6f 67 2e 66 6c 75 73 68 2e 69 6e 74 65 72 76 61 6c 2e 6d 65 73 73 61 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100140.in  istuple:N  msg:"65 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05 05 ff ff 00 1c 63 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100150.in  istuple:N  msg:"74 72 6f 6c 6c 65 72 2e 73 6f 63 6b 65 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 33 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100160.in  istuple:N  msg:"01 05 00 00 00 00 01 00 1c 63 6f 6e 74 72 6f 6c 6c 65 72 2e 73 6f 63 6b 65 74 2e 74 69 6d 65 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100170.in  istuple:N  msg:"75 74 2e 6d 73 00 05 33 30 30 30 30 05 03 ff ff 00 17 70 72 69 6e 63 69 70 61 6c 2e 62 75 69 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100180.in  istuple:N  msg:"64 65 72 2e 63 6c 61 73 73 00 4b 6f 72 67 2e 61 70 61 63 68 65 2e 6b 61 66 6b 61 2e 63 6f 6d 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100190.in  istuple:N  msg:"6f 6e 2e 73 65 63 75 72 69 74 79 2e 61 75 74 68 65 6e 74 69 63 61 74 6f 72 2e 44 65 66 61 75 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100200.in  istuple:N  msg:"74 4b 61 66 6b 61 50 72 69 6e 63 69 70 61 6c 42 75 69 6c 64 65 72 00 05 00 00 00 00 01 00 17 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100210.in  istuple:N  msg:"72 69 6e 63 69 70 61 6c 2e 62 75 69 6c 64 65 72 2e 63 6c 61 73 73 00 4b 6f 72 67 2e 61 70 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100220.in  istuple:N  msg:"68 65 2e 6b 61 66 6b 61 2e 63 6f 6d 6d 6f 6e 2e 73 65 63 75 72 69 74 79 2e 61 75 74 68 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100230.in  istuple:N  msg:"69 63 61 74 6f 72 2e 44 65 66 61 75 6c 74 4b 61 66 6b 61 50 72 69 6e 63 69 70 61 6c 42 75 69 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100240.in  istuple:N  msg:"64 65 72 05 08 ff ff 00 15 6c 6f 67 2e 66 6c 75 73 68 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100250.in  istuple:N  msg:"00 05 00 00 00 00 00 05 ff ff 00 24 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100260.in  istuple:N  msg:"71 75 65 73 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 04 32 30 30 30 01 05 00 00 00 00 01 00 24 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100270.in  istuple:N  msg:"6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 72 65 71 75 65 73 74 2e 74 69 6d 65 6f 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100280.in  istuple:N  msg:"2e 6d 73 00 04 32 30 30 30 05 03 ff ff 00 22 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100290.in  istuple:N  msg:"65 78 70 65 63 74 65 64 2e 61 75 64 69 65 6e 63 65 ff ff 01 05 00 00 00 00 00 07 ff ff 00 13 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100300.in  istuple:N  msg:"69 6e 2e 69 6e 73 79 6e 63 2e 72 65 70 6c 69 63 61 73 00 01 31 00 05 00 00 00 00 01 00 13 6d 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100310.in  istuple:N  msg:"6e 2e 69 6e 73 79 6e 63 2e 72 65 70 6c 69 63 61 73 00 01 31 05 03 ff ff 00 23 72 65 6d 6f 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100320.in  istuple:N  msg:"2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 74 68 72 65 61 64 2e 70 6f 6f 6c 2e 73 69 7a 65 00 02 31"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100330.in  istuple:N  msg:"30 01 05 00 00 00 00 01 00 23 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 74 68 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100340.in  istuple:N  msg:"65 61 64 2e 70 6f 6f 6c 2e 73 69 7a 65 00 02 31 30 05 03 ff ff 00 25 67 72 6f 75 70 2e 63 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100350.in  istuple:N  msg:"73 75 6d 65 72 2e 6d 61 78 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 36 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100360.in  istuple:N  msg:"30 30 30 01 05 00 00 00 00 01 00 25 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 6d 61 78 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100370.in  istuple:N  msg:"65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 36 30 30 30 30 05 03 ff ff 00 21 6e 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100380.in  istuple:N  msg:"6d 2e 72 65 63 6f 76 65 72 79 2e 74 68 72 65 61 64 73 2e 70 65 72 2e 64 61 74 61 2e 64 69 72 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100390.in  istuple:N  msg:"01 31 00 04 00 00 00 00 02 00 21 6e 75 6d 2e 72 65 63 6f 76 65 72 79 2e 74 68 72 65 61 64 73 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100400.in  istuple:N  msg:"70 65 72 2e 64 61 74 61 2e 64 69 72 00 01 31 04 00 21 6e 75 6d 2e 72 65 63 6f 76 65 72 79 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100410.in  istuple:N  msg:"68 72 65 61 64 73 2e 70 65 72 2e 64 61 74 61 2e 64 69 72 00 01 31 05 03 ff ff 00 11 73 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100420.in  istuple:N  msg:"6b 65 79 73 74 6f 72 65 2e 74 79 70 65 00 03 4a 4b 53 00 05 00 00 00 00 01 00 11 73 73 6c 2e 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100430.in  istuple:N  msg:"65 79 73 74 6f 72 65 2e 74 79 70 65 00 03 4a 4b 53 05 02 ff ff 00 16 7a 6f 6f 6b 65 65 70 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100440.in  istuple:N  msg:"2e 73 73 6c 2e 70 72 6f 74 6f 63 6f 6c 00 07 54 4c 53 76 31 2e 32 01 05 00 00 00 00 01 00 16 7a"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100450.in  istuple:N  msg:"6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 70 72 6f 74 6f 63 6f 6c 00 07 54 4c 53 76 31 2e 32 05 02"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100460.in  istuple:N  msg:"ff ff 00 0b 73 75 70 65 72 2e 75 73 65 72 73 ff ff 01 04 01 00 00 00 01 00 0b 73 75 70 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100470.in  istuple:N  msg:"75 73 65 72 73 ff ff 04 00 ff ff 00 23 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100480.in  istuple:N  msg:"6f 6f 74 73 74 72 61 70 2e 73 65 72 76 65 72 73 00 00 01 05 00 00 00 00 01 00 23 63 6f 6e 74 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100490.in  istuple:N  msg:"6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 62 6f 6f 74 73 74 72 61 70 2e 73 65 72 76 65 72 73 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100500.in  istuple:N  msg:"05 07 ff ff 00 24 73 61 73 6c 2e 6d 65 63 68 61 6e 69 73 6d 2e 69 6e 74 65 72 2e 62 72 6f 6b 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100510.in  istuple:N  msg:"72 2e 70 72 6f 74 6f 63 6f 6c 00 06 47 53 53 41 50 49 00 05 00 00 00 00 01 00 24 73 61 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100520.in  istuple:N  msg:"6d 65 63 68 61 6e 69 73 6d 2e 69 6e 74 65 72 2e 62 72 6f 6b 65 72 2e 70 72 6f 74 6f 63 6f 6c 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100530.in  istuple:N  msg:"06 47 53 53 41 50 49 05 02 ff ff 00 23 67 72 6f 75 70 2e 73 68 61 72 65 2e 72 65 63 6f 72 64 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100540.in  istuple:N  msg:"6c 6f 63 6b 2e 64 75 72 61 74 69 6f 6e 2e 6d 73 00 05 33 30 30 30 30 01 05 00 00 00 00 01 00 23"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100550.in  istuple:N  msg:"67 72 6f 75 70 2e 73 68 61 72 65 2e 72 65 63 6f 72 64 2e 6c 6f 63 6b 2e 64 75 72 61 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100560.in  istuple:N  msg:"2e 6d 73 00 05 33 30 30 30 30 05 03 ff ff 00 1a 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 73 65 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100570.in  istuple:N  msg:"6d 65 6e 74 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 01 05 00 00 00 00 01 00 1a 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100580.in  istuple:N  msg:"65 74 61 64 61 74 61 2e 6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 0a 31 30 37 33 37"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100590.in  istuple:N  msg:"34 31 38 32 34 05 03 ff ff 00 27 66 65 74 63 68 2e 70 75 72 67 61 74 6f 72 79 2e 70 75 72 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100600.in  istuple:N  msg:"2e 69 6e 74 65 72 76 61 6c 2e 72 65 71 75 65 73 74 73 00 04 31 30 30 30 01 05 00 00 00 00 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100610.in  istuple:N  msg:"27 66 65 74 63 68 2e 70 75 72 67 61 74 6f 72 79 2e 70 75 72 67 65 2e 69 6e 74 65 72 76 61 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100620.in  istuple:N  msg:"72 65 71 75 65 73 74 73 00 04 31 30 30 30 05 03 ff ff 00 25 73 73 6c 2e 65 6e 64 70 6f 69 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100630.in  istuple:N  msg:"2e 69 64 65 6e 74 69 66 69 63 61 74 69 6f 6e 2e 61 6c 67 6f 72 69 74 68 6d 00 05 68 74 74 70 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100640.in  istuple:N  msg:"00 05 00 00 00 00 01 00 25 73 73 6c 2e 65 6e 64 70 6f 69 6e 74 2e 69 64 65 6e 74 69 66 69 63 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100650.in  istuple:N  msg:"74 69 6f 6e 2e 61 6c 67 6f 72 69 74 68 6d 00 05 68 74 74 70 73 05 02 ff ff 00 1f 7a 6f 6f 6b 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100660.in  istuple:N  msg:"65 70 65 72 2e 73 73 6c 2e 6b 65 79 73 74 6f 72 65 2e 6c 6f 63 61 74 69 6f 6e ff ff 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100670.in  istuple:N  msg:"00 00 00 02 ff ff 00 19 72 65 70 6c 69 63 61 2e 73 6f 63 6b 65 74 2e 74 69 6d 65 6f 75 74 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100680.in  istuple:N  msg:"73 00 05 33 30 30 30 30 01 05 00 00 00 00 01 00 19 72 65 70 6c 69 63 61 2e 73 6f 63 6b 65 74 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100690.in  istuple:N  msg:"74 69 6d 65 6f 75 74 2e 6d 73 00 05 33 30 30 30 30 05 03 ff ff 00 11 6d 65 73 73 61 67 65 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100700.in  istuple:N  msg:"61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37 36 30 00 04 00 00 00 00 02 00 11 6d 65 73 73 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100710.in  istuple:N  msg:"67 65 2e 6d 61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37 36 30 04 00 11 6d 65 73 73 61 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100720.in  istuple:N  msg:"2e 6d 61 78 2e 62 79 74 65 73 00 07 31 30 34 38 35 38 38 05 03 ff ff 00 2d 72 65 6d 6f 74 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100730.in  istuple:N  msg:"6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 6d 61 78 2e 62 79 74 65 73 2e 70 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100740.in  istuple:N  msg:"73 65 63 6f 6e 64 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100750.in  istuple:N  msg:"00 01 00 2d 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 6d 61 78"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100760.in  istuple:N  msg:"2e 62 79 74 65 73 2e 70 65 72 2e 73 65 63 6f 6e 64 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100770.in  istuple:N  msg:"37 37 35 38 30 37 05 05 ff ff 00 1e 67 72 6f 75 70 2e 73 68 61 72 65 2e 73 65 73 73 69 6f 6e 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100780.in  istuple:N  msg:"74 69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 01 05 00 00 00 00 01 00 1e 67 72 6f 75 70 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100790.in  istuple:N  msg:"73 68 61 72 65 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100800.in  istuple:N  msg:"03 ff ff 00 1c 6d 61 78 2e 63 6f 6e 6e 65 63 74 69 6f 6e 2e 63 72 65 61 74 69 6f 6e 2e 72 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100810.in  istuple:N  msg:"65 00 0a 32 31 34 37 34 38 33 36 34 37 00 05 00 00 00 00 01 00 1c 6d 61 78 2e 63 6f 6e 6e 65 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100820.in  istuple:N  msg:"74 69 6f 6e 2e 63 72 65 61 74 69 6f 6e 2e 72 61 74 65 00 0a 32 31 34 37 34 38 33 36 34 37 05 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100830.in  istuple:N  msg:"ff ff 00 19 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 6d 61 78 2e 72 65 61 75 74 68 2e 6d 73 00 01 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100840.in  istuple:N  msg:"01 05 00 00 00 00 01 00 19 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 6d 61 78 2e 72 65 61 75 74 68 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100850.in  istuple:N  msg:"6d 73 00 01 30 05 05 ff ff 00 31 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100860.in  istuple:N  msg:"70 79 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100870.in  istuple:N  msg:"05 00 00 00 00 01 00 31 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f 70 79 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100880.in  istuple:N  msg:"71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100890.in  istuple:N  msg:"00 27 6c 6f 67 2e 66 6c 75 73 68 2e 6f 66 66 73 65 74 2e 63 68 65 63 6b 70 6f 69 6e 74 2e 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100900.in  istuple:N  msg:"74 65 72 76 61 6c 2e 6d 73 00 05 36 30 30 30 30 01 05 00 00 00 00 01 00 27 6c 6f 67 2e 66 6c 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100910.in  istuple:N  msg:"73 68 2e 6f 66 66 73 65 74 2e 63 68 65 63 6b 70 6f 69 6e 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100920.in  istuple:N  msg:"00 05 36 30 30 30 30 05 03 ff ff 00 1a 7a 6f 6f 6b 65 65 70 65 72 2e 63 6c 69 65 6e 74 43 6e 78"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100930.in  istuple:N  msg:"6e 53 6f 63 6b 65 74 ff ff 01 05 00 00 00 00 00 02 ff ff 00 1b 7a 6f 6f 6b 65 65 70 65 72 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100940.in  istuple:N  msg:"73 6c 2e 63 6c 69 65 6e 74 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 1b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100950.in  istuple:N  msg:"7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 63 6c 69 65 6e 74 2e 65 6e 61 62 6c 65 00 05 66 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100960.in  istuple:N  msg:"73 65 05 01 ff ff 00 10 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100970.in  istuple:N  msg:"00 00 01 00 10 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 05 03 ff ff 00 23 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100980.in  istuple:N  msg:"61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 63 6c 6f 63 6b 2e 73 6b 65 77 2e 73 65 63 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/100990.in  istuple:N  msg:"64 73 00 02 33 30 01 05 00 00 00 00 01 00 23 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101000.in  istuple:N  msg:"63 6c 6f 63 6b 2e 73 6b 65 77 2e 73 65 63 6f 6e 64 73 00 02 33 30 05 03 ff ff 00 25 67 72 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101010.in  istuple:N  msg:"70 2e 63 6f 6e 73 75 6d 65 72 2e 6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101020.in  istuple:N  msg:"73 00 05 34 35 30 30 30 01 05 00 00 00 00 01 00 25 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101030.in  istuple:N  msg:"6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 05 03 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101040.in  istuple:N  msg:"ff 00 11 7a 6f 6f 6b 65 65 70 65 72 2e 63 6f 6e 6e 65 63 74 ff ff 01 05 00 00 00 00 00 02 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101050.in  istuple:N  msg:"00 15 61 75 74 68 6f 72 69 7a 65 72 2e 63 6c 61 73 73 2e 6e 61 6d 65 00 37 6f 72 67 2e 61 70 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101060.in  istuple:N  msg:"63 68 65 2e 6b 61 66 6b 61 2e 6d 65 74 61 64 61 74 61 2e 61 75 74 68 6f 72 69 7a 65 72 2e 53 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101070.in  istuple:N  msg:"61 6e 64 61 72 64 41 75 74 68 6f 72 69 7a 65 72 01 04 00 00 00 00 02 00 15 61 75 74 68 6f 72 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101080.in  istuple:N  msg:"7a 65 72 2e 63 6c 61 73 73 2e 6e 61 6d 65 00 37 6f 72 67 2e 61 70 61 63 68 65 2e 6b 61 66 6b 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101090.in  istuple:N  msg:"2e 6d 65 74 61 64 61 74 61 2e 61 75 74 68 6f 72 69 7a 65 72 2e 53 74 61 6e 64 61 72 64 41 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101100.in  istuple:N  msg:"68 6f 72 69 7a 65 72 04 00 15 61 75 74 68 6f 72 69 7a 65 72 2e 63 6c 61 73 73 2e 6e 61 6d 65 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101110.in  istuple:N  msg:"00 05 02 ff ff 00 17 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 73 65 63 72 65 74 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101120.in  istuple:N  msg:"01 05 01 00 00 00 00 09 ff ff 00 14 6e 75 6d 2e 72 65 70 6c 69 63 61 2e 66 65 74 63 68 65 72 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101130.in  istuple:N  msg:"00 01 38 00 04 00 00 00 00 02 00 14 6e 75 6d 2e 72 65 70 6c 69 63 61 2e 66 65 74 63 68 65 72 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101140.in  istuple:N  msg:"00 01 38 04 00 14 6e 75 6d 2e 72 65 70 6c 69 63 61 2e 66 65 74 63 68 65 72 73 00 01 31 05 03 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101150.in  istuple:N  msg:"ff 00 34 61 6c 74 65 72 2e 6c 6f 67 2e 64 69 72 73 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101160.in  istuple:N  msg:"6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101170.in  istuple:N  msg:"01 00 34 61 6c 74 65 72 2e 6c 6f 67 2e 64 69 72 73 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101180.in  istuple:N  msg:"6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff 00 22"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101190.in  istuple:N  msg:"73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74 2e 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101200.in  istuple:N  msg:"72 6c ff ff 01 05 00 00 00 00 00 02 ff ff 00 2d 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101210.in  istuple:N  msg:"61 74 61 2e 63 75 73 74 6f 6d 2e 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 62 79 74 65 73 00 03 31"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101220.in  istuple:N  msg:"32 38 01 05 00 00 00 00 01 00 2d 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101230.in  istuple:N  msg:"75 73 74 6f 6d 2e 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 62 79 74 65 73 00 03 31 32 38 05 03 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101240.in  istuple:N  msg:"ff 00 19 61 75 74 6f 2e 69 6e 63 6c 75 64 65 2e 6a 6d 78 2e 72 65 70 6f 72 74 65 72 00 04 74 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101250.in  istuple:N  msg:"75 65 01 05 00 00 00 00 01 00 19 61 75 74 6f 2e 69 6e 63 6c 75 64 65 2e 6a 6d 78 2e 72 65 70 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101260.in  istuple:N  msg:"72 74 65 72 00 04 74 72 75 65 05 01 ff ff 00 15 6c 6f 67 2e 72 6f 6c 6c 2e 6a 69 74 74 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101270.in  istuple:N  msg:"68 6f 75 72 73 00 01 30 01 05 00 00 00 00 01 00 15 6c 6f 67 2e 72 6f 6c 6c 2e 6a 69 74 74 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101280.in  istuple:N  msg:"2e 68 6f 75 72 73 00 01 30 05 03 ff ff 00 13 74 65 6c 65 6d 65 74 72 79 2e 6d 61 78 2e 62 79 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101290.in  istuple:N  msg:"65 73 00 07 31 30 34 38 35 37 36 01 05 00 00 00 00 01 00 13 74 65 6c 65 6d 65 74 72 79 2e 6d 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101300.in  istuple:N  msg:"78 2e 62 79 74 65 73 00 07 31 30 34 38 35 37 36 05 03 ff ff 00 1b 70 61 73 73 77 6f 72 64 2e 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101310.in  istuple:N  msg:"6e 63 6f 64 65 72 2e 6f 6c 64 2e 73 65 63 72 65 74 ff ff 01 05 01 00 00 00 00 09 ff ff 00 1f 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101320.in  istuple:N  msg:"6f 67 2e 63 6c 65 61 6e 65 72 2e 64 65 6c 65 74 65 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73 00 08"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101330.in  istuple:N  msg:"38 36 34 30 30 30 30 30 00 05 00 00 00 00 01 00 1f 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 64 65 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101340.in  istuple:N  msg:"65 74 65 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73 00 08 38 36 34 30 30 30 30 30 05 05 ff ff 00 1b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101350.in  istuple:N  msg:"73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 73 00 03 31 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101360.in  istuple:N  msg:"01 05 00 00 00 00 01 00 1b 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 74 72 79 2e 62 61 63 6b 6f 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101370.in  istuple:N  msg:"66 2e 6d 73 00 03 31 30 30 05 05 ff ff 00 13 71 75 65 75 65 64 2e 6d 61 78 2e 72 65 71 75 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101380.in  istuple:N  msg:"74 73 00 03 35 30 30 01 05 00 00 00 00 01 00 13 71 75 65 75 65 64 2e 6d 61 78 2e 72 65 71 75 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101390.in  istuple:N  msg:"73 74 73 00 03 35 30 30 05 03 ff ff 00 13 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 74 68 72 65 61 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101400.in  istuple:N  msg:"73 00 01 31 00 05 00 00 00 00 01 00 13 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 74 68 72 65 61 64 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101410.in  istuple:N  msg:"00 01 31 05 03 ff ff 00 1a 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 73 65 72 76 69 63 65 2e 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101420.in  istuple:N  msg:"61 6d 65 ff ff 00 05 00 00 00 00 00 02 ff ff 00 18 73 6f 63 6b 65 74 2e 72 65 71 75 65 73 74 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101430.in  istuple:N  msg:"6d 61 78 2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30 01 04 00 00 00 00 02 00 18 73 6f 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101440.in  istuple:N  msg:"6b 65 74 2e 72 65 71 75 65 73 74 2e 6d 61 78 2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101450.in  istuple:N  msg:"04 00 18 73 6f 63 6b 65 74 2e 72 65 71 75 65 73 74 2e 6d 61 78 2e 62 79 74 65 73 00 09 31 30 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101460.in  istuple:N  msg:"38 35 37 36 30 30 05 03 ff ff 00 17 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 6d 61 78 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101470.in  istuple:N  msg:"69 7a 65 00 0a 32 31 34 37 34 38 33 36 34 37 01 05 00 00 00 00 01 00 17 67 72 6f 75 70 2e 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101480.in  istuple:N  msg:"6e 73 75 6d 65 72 2e 6d 61 78 2e 73 69 7a 65 00 0a 32 31 34 37 34 38 33 36 34 37 05 03 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101490.in  istuple:N  msg:"18 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 61 73 73 69 67 6e 6f 72 73 00 75 6f 72 67 2e 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101500.in  istuple:N  msg:"70 61 63 68 65 2e 6b 61 66 6b 61 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 67 72 6f 75 70 2e 61 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101510.in  istuple:N  msg:"73 69 67 6e 6f 72 2e 55 6e 69 66 6f 72 6d 41 73 73 69 67 6e 6f 72 2c 6f 72 67 2e 61 70 61 63 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101520.in  istuple:N  msg:"65 2e 6b 61 66 6b 61 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 67 72 6f 75 70 2e 61 73 73 69 67 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101530.in  istuple:N  msg:"6f 72 2e 52 61 6e 67 65 41 73 73 69 67 6e 6f 72 01 05 00 00 00 00 01 00 18 67 72 6f 75 70 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101540.in  istuple:N  msg:"6f 6e 73 75 6d 65 72 2e 61 73 73 69 67 6e 6f 72 73 00 75 6f 72 67 2e 61 70 61 63 68 65 2e 6b 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101550.in  istuple:N  msg:"66 6b 61 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 67 72 6f 75 70 2e 61 73 73 69 67 6e 6f 72 2e 55"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101560.in  istuple:N  msg:"6e 69 66 6f 72 6d 41 73 73 69 67 6e 6f 72 2c 6f 72 67 2e 61 70 61 63 68 65 2e 6b 61 66 6b 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101570.in  istuple:N  msg:"63 6f 6f 72 64 69 6e 61 74 6f 72 2e 67 72 6f 75 70 2e 61 73 73 69 67 6e 6f 72 2e 52 61 6e 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101580.in  istuple:N  msg:"41 73 73 69 67 6e 6f 72 05 07 ff ff 00 20 72 65 6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f 72 61 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101590.in  istuple:N  msg:"2e 73 79 73 74 65 6d 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 20 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101600.in  istuple:N  msg:"6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f 72 61 67 65 2e 73 79 73 74 65 6d 2e 65 6e 61 62 6c 65 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101610.in  istuple:N  msg:"66 61 6c 73 65 05 01 ff ff 00 1a 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101620.in  istuple:N  msg:"2e 74 79 70 65 00 0a 43 72 65 61 74 65 54 69 6d 65 00 05 00 00 00 00 01 00 1a 6c 6f 67 2e 6d 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101630.in  istuple:N  msg:"73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 74 79 70 65 00 0a 43 72 65 61 74 65 54 69 6d 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101640.in  istuple:N  msg:"05 02 ff ff 00 1b 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 6b 65 79 73 74 6f 72 65 2e 74 79 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101650.in  istuple:N  msg:"65 ff ff 01 05 00 00 00 00 00 02 ff ff 00 17 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 6d 61 78 2e 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101660.in  istuple:N  msg:"64 6c 65 2e 6d 73 00 06 36 30 30 30 30 30 01 05 00 00 00 00 01 00 17 63 6f 6e 6e 65 63 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101670.in  istuple:N  msg:"6e 73 2e 6d 61 78 2e 69 64 6c 65 2e 6d 73 00 06 36 30 30 30 30 30 05 05 ff ff 00 11 7a 6f 6f 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101680.in  istuple:N  msg:"65 65 70 65 72 2e 73 65 74 2e 61 63 6c 00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 11 7a 6f 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101690.in  istuple:N  msg:"6b 65 65 70 65 72 2e 73 65 74 2e 61 63 6c 00 05 66 61 6c 73 65 05 01 ff ff 00 1f 64 65 6c 65 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101700.in  istuple:N  msg:"61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 65 78 70 69 72 79 2e 74 69 6d 65 2e 6d 73 00 08 38 36 34 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101710.in  istuple:N  msg:"30 30 30 30 01 05 00 00 00 00 01 00 1f 64 65 6c 65 67 61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 65 78"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101720.in  istuple:N  msg:"70 69 72 79 2e 74 69 6d 65 2e 6d 73 00 08 38 36 34 30 30 30 30 30 05 05 ff ff 00 0f 6d 61 78 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101730.in  istuple:N  msg:"63 6f 6e 6e 65 63 74 69 6f 6e 73 00 0a 32 31 34 37 34 38 33 36 34 37 00 05 00 00 00 00 01 00 0f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101740.in  istuple:N  msg:"6d 61 78 2e 63 6f 6e 6e 65 63 74 69 6f 6e 73 00 0a 32 31 34 37 34 38 33 36 34 37 05 03 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101750.in  istuple:N  msg:"24 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 6e 75 6d 2e 70 61 72 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101760.in  istuple:N  msg:"74 69 6f 6e 73 00 02 35 30 01 05 00 00 00 00 01 00 24 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101770.in  istuple:N  msg:"61 74 65 2e 6c 6f 67 2e 6e 75 6d 2e 70 61 72 74 69 74 69 6f 6e 73 00 02 35 30 05 03 ff ff 00 25"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101780.in  istuple:N  msg:"63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 65 6c 65 63 74 69 6f 6e 2e 74 69 6d 65 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101790.in  istuple:N  msg:"75 74 2e 6d 73 00 05 32 30 30 30 30 01 04 00 00 00 00 02 00 25 63 6f 6e 74 72 6f 6c 6c 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101800.in  istuple:N  msg:"71 75 6f 72 75 6d 2e 65 6c 65 63 74 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 32 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101810.in  istuple:N  msg:"30 04 00 25 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 65 6c 65 63 74 69 6f 6e 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101820.in  istuple:N  msg:"69 6d 65 6f 75 74 2e 6d 73 00 04 31 30 30 30 05 03 ff ff 00 1e 6c 69 73 74 65 6e 65 72 2e 73 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101830.in  istuple:N  msg:"63 75 72 69 74 79 2e 70 72 6f 74 6f 63 6f 6c 2e 6d 61 70 00 73 43 4f 4e 54 52 4f 4c 4c 45 52 3a"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101840.in  istuple:N  msg:"50 4c 41 49 4e 54 45 58 54 2c 49 4e 54 45 52 4e 41 4c 3a 50 4c 41 49 4e 54 45 58 54 2c 50 4c 41"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101850.in  istuple:N  msg:"49 4e 54 45 58 54 3a 50 4c 41 49 4e 54 45 58 54 2c 53 53 4c 3a 53 53 4c 2c 53 41 53 4c 5f 50 4c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101860.in  istuple:N  msg:"41 49 4e 54 45 58 54 3a 53 41 53 4c 5f 50 4c 41 49 4e 54 45 58 54 2c 53 41 53 4c 5f 53 53 4c 3a"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101870.in  istuple:N  msg:"53 41 53 4c 5f 53 53 4c 00 04 00 00 00 00 02 00 1e 6c 69 73 74 65 6e 65 72 2e 73 65 63 75 72 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101880.in  istuple:N  msg:"74 79 2e 70 72 6f 74 6f 63 6f 6c 2e 6d 61 70 00 73 43 4f 4e 54 52 4f 4c 4c 45 52 3a 50 4c 41 49"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101890.in  istuple:N  msg:"4e 54 45 58 54 2c 49 4e 54 45 52 4e 41 4c 3a 50 4c 41 49 4e 54 45 58 54 2c 50 4c 41 49 4e 54 45"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101900.in  istuple:N  msg:"58 54 3a 50 4c 41 49 4e 54 45 58 54 2c 53 53 4c 3a 53 53 4c 2c 53 41 53 4c 5f 50 4c 41 49 4e 54"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101910.in  istuple:N  msg:"45 58 54 3a 53 41 53 4c 5f 50 4c 41 49 4e 54 45 58 54 2c 53 41 53 4c 5f 53 53 4c 3a 53 41 53 4c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101920.in  istuple:N  msg:"5f 53 53 4c 04 00 1e 6c 69 73 74 65 6e 65 72 2e 73 65 63 75 72 69 74 79 2e 70 72 6f 74 6f 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101930.in  istuple:N  msg:"6c 2e 6d 61 70 00 4b 53 41 53 4c 5f 53 53 4c 3a 53 41 53 4c 5f 53 53 4c 2c 50 4c 41 49 4e 54 45"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101940.in  istuple:N  msg:"58 54 3a 50 4c 41 49 4e 54 45 58 54 2c 53 53 4c 3a 53 53 4c 2c 53 41 53 4c 5f 50 4c 41 49 4e 54"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101950.in  istuple:N  msg:"45 58 54 3a 53 41 53 4c 5f 50 4c 41 49 4e 54 45 58 54 05 02 ff ff 00 13 6c 6f 67 2e 72 65 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101960.in  istuple:N  msg:"6e 74 69 6f 6e 2e 68 6f 75 72 73 00 03 31 36 38 01 04 00 00 00 00 02 00 13 6c 6f 67 2e 72 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101970.in  istuple:N  msg:"65 6e 74 69 6f 6e 2e 68 6f 75 72 73 00 03 31 36 38 04 00 13 6c 6f 67 2e 72 65 74 65 6e 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101980.in  istuple:N  msg:"6e 2e 68 6f 75 72 73 00 03 31 36 38 05 03 ff ff 00 1b 63 6c 69 65 6e 74 2e 71 75 6f 74 61 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/101990.in  istuple:N  msg:"61 6c 6c 62 61 63 6b 2e 63 6c 61 73 73 ff ff 01 05 00 00 00 00 00 08 ff ff 00 11 61 75 64 69 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102000.in  istuple:N  msg:"2e 6c 6f 67 2e 65 6e 61 62 6c 65 64 ff ff 01 04 01 00 00 00 01 00 11 61 75 64 69 74 2e 6c 6f 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102010.in  istuple:N  msg:"2e 65 6e 61 62 6c 65 64 ff ff 04 00 ff ff 00 26 72 65 6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f 72 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102020.in  istuple:N  msg:"67 65 2e 6d 61 6e 61 67 65 72 2e 69 6d 70 6c 2e 70 72 65 66 69 78 00 0b 72 73 6d 2e 63 6f 6e 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102030.in  istuple:N  msg:"69 67 2e 01 05 00 00 00 00 01 00 26 72 65 6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f 72 61 67 65 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102040.in  istuple:N  msg:"61 6e 61 67 65 72 2e 69 6d 70 6c 2e 70 72 65 66 69 78 00 0b 72 73 6d 2e 63 6f 6e 66 69 67 2e 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102050.in  istuple:N  msg:"02 ff ff 00 0c 73 73 6c 2e 70 72 6f 76 69 64 65 72 ff ff 00 05 00 00 00 00 00 02 ff ff 00 30 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102060.in  istuple:N  msg:"65 6c 65 74 65 2e 72 65 63 6f 72 64 73 2e 70 75 72 67 61 74 6f 72 79 2e 70 75 72 67 65 2e 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102070.in  istuple:N  msg:"74 65 72 76 61 6c 2e 72 65 71 75 65 73 74 73 00 01 31 01 05 00 00 00 00 01 00 30 64 65 6c 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102080.in  istuple:N  msg:"65 2e 72 65 63 6f 72 64 73 2e 70 75 72 67 61 74 6f 72 79 2e 70 75 72 67 65 2e 69 6e 74 65 72 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102090.in  istuple:N  msg:"61 6c 2e 72 65 71 75 65 73 74 73 00 01 31 05 03 ff ff 00 19 70 72 6f 64 75 63 65 72 2e 69 64 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102100.in  istuple:N  msg:"65 78 70 69 72 61 74 69 6f 6e 2e 6d 73 00 08 38 36 34 30 30 30 30 30 00 05 00 00 00 00 01 00 19"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102110.in  istuple:N  msg:"70 72 6f 64 75 63 65 72 2e 69 64 2e 65 78 70 69 72 61 74 69 6f 6e 2e 6d 73 00 08 38 36 34 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102120.in  istuple:N  msg:"30 30 30 05 03 ff ff 00 0b 6c 6f 67 2e 72 6f 6c 6c 2e 6d 73 ff ff 00 05 00 00 00 00 00 05 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102130.in  istuple:N  msg:"00 11 73 73 6c 2e 63 69 70 68 65 72 2e 73 75 69 74 65 73 00 00 00 05 00 00 00 00 01 00 11 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102140.in  istuple:N  msg:"6c 2e 63 69 70 68 65 72 2e 73 75 69 74 65 73 00 00 05 07 ff ff 00 22 63 6f 6e 74 72 6f 6c 6c 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102150.in  istuple:N  msg:"72 2e 71 75 6f 72 75 6d 2e 72 65 74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 73 00 02 32 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102160.in  istuple:N  msg:"00 00 00 01 00 22 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 72 65 74 72 79 2e 62 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102170.in  istuple:N  msg:"63 6b 6f 66 66 2e 6d 73 00 02 32 30 05 03 ff ff 00 2c 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102180.in  istuple:N  msg:"61 67 65 72 2e 63 6f 70 79 2e 6d 61 78 2e 62 79 74 65 73 2e 70 65 72 2e 73 65 63 6f 6e 64 00 13"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102190.in  istuple:N  msg:"39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 00 00 01 00 2c 72 65 6d 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102200.in  istuple:N  msg:"74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f 70 79 2e 6d 61 78 2e 62 79 74 65 73 2e 70 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102210.in  istuple:N  msg:"72 2e 73 65 63 6f 6e 64 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05 05 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102220.in  istuple:N  msg:"ff 00 1f 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 6b 65 79 73 74 6f 72 65 2e 70 61 73 73 77 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102230.in  istuple:N  msg:"72 64 ff ff 01 05 01 00 00 00 00 09 ff ff 00 19 62 72 6f 6b 65 72 2e 73 65 73 73 69 6f 6e 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102240.in  istuple:N  msg:"69 6d 65 6f 75 74 2e 6d 73 00 04 39 30 30 30 01 05 00 00 00 00 01 00 19 62 72 6f 6b 65 72 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102250.in  istuple:N  msg:"65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 04 39 30 30 30 05 03 ff ff 00 1e 73 65 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102260.in  istuple:N  msg:"75 72 69 74 79 2e 69 6e 74 65 72 2e 62 72 6f 6b 65 72 2e 70 72 6f 74 6f 63 6f 6c 00 09 50 4c 41"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102270.in  istuple:N  msg:"49 4e 54 45 58 54 01 05 00 00 00 00 01 00 1e 73 65 63 75 72 69 74 79 2e 69 6e 74 65 72 2e 62 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102280.in  istuple:N  msg:"6f 6b 65 72 2e 70 72 6f 74 6f 63 6f 6c 00 09 50 4c 41 49 4e 54 45 58 54 05 02 ff ff 00 21 67 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102290.in  istuple:N  msg:"6f 75 70 2e 73 68 61 72 65 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102300.in  istuple:N  msg:"04 35 30 30 30 01 05 00 00 00 00 01 00 21 67 72 6f 75 70 2e 73 68 61 72 65 2e 68 65 61 72 74 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102310.in  istuple:N  msg:"65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 05 03 ff ff 00 1b 64 65 6c 65 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102320.in  istuple:N  msg:"61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 73 65 63 72 65 74 2e 6b 65 79 ff ff 01 05 01 00 00 00 00 09"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102330.in  istuple:N  msg:"ff ff 00 29 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 71 75 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102340.in  istuple:N  msg:"74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 01 05 00 00 00 00 01 00 29 72 65 6d 6f 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102350.in  istuple:N  msg:"2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102360.in  istuple:N  msg:"6e 75 6d 00 02 31 31 05 03 ff ff 00 18 72 65 6d 6f 74 65 2e 66 65 74 63 68 2e 6d 61 78 2e 77 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102370.in  istuple:N  msg:"69 74 2e 6d 73 00 03 35 30 30 00 05 00 00 00 00 01 00 18 72 65 6d 6f 74 65 2e 66 65 74 63 68 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102380.in  istuple:N  msg:"6d 61 78 2e 77 61 69 74 2e 6d 73 00 03 35 30 30 05 03 ff ff 00 07 6e 6f 64 65 2e 69 64 00 01 31"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102390.in  istuple:N  msg:"01 04 00 00 00 00 02 00 07 6e 6f 64 65 2e 69 64 00 01 31 04 00 07 6e 6f 64 65 2e 69 64 00 02 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102400.in  istuple:N  msg:"31 05 03 ff ff 00 2d 72 65 70 6c 69 63 61 2e 68 69 67 68 2e 77 61 74 65 72 6d 61 72 6b 2e 63 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102410.in  istuple:N  msg:"65 63 6b 70 6f 69 6e 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102420.in  istuple:N  msg:"01 00 2d 72 65 70 6c 69 63 61 2e 68 69 67 68 2e 77 61 74 65 72 6d 61 72 6b 2e 63 68 65 63 6b 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102430.in  istuple:N  msg:"6f 69 6e 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 05 05 ff ff 00 25 72 65 70 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102440.in  istuple:N  msg:"69 63 61 74 69 6f 6e 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102450.in  istuple:N  msg:"73 00 01 31 01 05 00 00 00 00 01 00 25 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75 6f 74 61 2e 77"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102460.in  istuple:N  msg:"69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff 00 1f 65 6c 69 67 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102470.in  istuple:N  msg:"62 6c 65 2e 6c 65 61 64 65 72 2e 72 65 70 6c 69 63 61 73 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102480.in  istuple:N  msg:"65 01 05 00 00 00 00 01 00 1f 65 6c 69 67 69 62 6c 65 2e 6c 65 61 64 65 72 2e 72 65 70 6c 69 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102490.in  istuple:N  msg:"61 73 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 05 01 ff ff 00 16 6c 6f 67 2e 6c 6f 63 61 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102500.in  istuple:N  msg:"72 65 74 65 6e 74 69 6f 6e 2e 6d 73 00 02 2d 32 00 05 00 00 00 00 01 00 16 6c 6f 67 2e 6c 6f 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102510.in  istuple:N  msg:"61 6c 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73 00 02 2d 32 05 05 ff ff 00 19 72 65 6d 6f 74 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102520.in  istuple:N  msg:"6c 6f 67 2e 72 65 61 64 65 72 2e 74 68 72 65 61 64 73 00 02 31 30 01 05 00 00 00 00 01 00 19 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102530.in  istuple:N  msg:"65 6d 6f 74 65 2e 6c 6f 67 2e 72 65 61 64 65 72 2e 74 68 72 65 61 64 73 00 02 31 30 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102540.in  istuple:N  msg:"00 28 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 74 69 63 6b 65 74 2e 72 65 6e 65 77 2e 77 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102550.in  istuple:N  msg:"64 6f 77 2e 66 61 63 74 6f 72 00 03 30 2e 38 00 05 00 00 00 00 01 00 28 73 61 73 6c 2e 6b 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102560.in  istuple:N  msg:"62 65 72 6f 73 2e 74 69 63 6b 65 74 2e 72 65 6e 65 77 2e 77 69 6e 64 6f 77 2e 66 61 63 74 6f 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102570.in  istuple:N  msg:"00 03 30 2e 38 05 06 ff ff 00 19 67 72 6f 75 70 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 74 68 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102580.in  istuple:N  msg:"65 61 64 73 00 01 31 01 05 00 00 00 00 01 00 19 67 72 6f 75 70 2e 63 6f 6f 72 64 69 6e 61 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102590.in  istuple:N  msg:"72 2e 74 68 72 65 61 64 73 00 01 31 05 03 ff ff 00 1f 7a 6f 6f 6b 65 65 70 65 72 2e 63 6f 6e 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102600.in  istuple:N  msg:"65 63 74 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 ff ff 01 05 00 00 00 00 00 03 ff ff 00 17 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102610.in  istuple:N  msg:"65 74 72 69 63 73 2e 72 65 63 6f 72 64 69 6e 67 2e 6c 65 76 65 6c 00 04 49 4e 46 4f 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102620.in  istuple:N  msg:"00 00 01 00 17 6d 65 74 72 69 63 73 2e 72 65 63 6f 72 64 69 6e 67 2e 6c 65 76 65 6c 00 04 49 4e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102630.in  istuple:N  msg:"46 4f 05 02 ff ff 00 21 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 63 69 70 68 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102640.in  istuple:N  msg:"61 6c 67 6f 72 69 74 68 6d 00 14 41 45 53 2f 43 42 43 2f 50 4b 43 53 35 50 61 64 64 69 6e 67 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102650.in  istuple:N  msg:"05 00 00 00 00 01 00 21 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 63 69 70 68 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102660.in  istuple:N  msg:"61 6c 67 6f 72 69 74 68 6d 00 14 41 45 53 2f 43 42 43 2f 50 4b 43 53 35 50 61 64 64 69 6e 67 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102670.in  istuple:N  msg:"02 ff ff 00 1a 6c 6f 67 2e 64 69 72 2e 66 61 69 6c 75 72 65 2e 74 69 6d 65 6f 75 74 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102680.in  istuple:N  msg:"05 33 30 30 30 30 01 05 00 00 00 00 01 00 1a 6c 6f 67 2e 64 69 72 2e 66 61 69 6c 75 72 65 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102690.in  istuple:N  msg:"69 6d 65 6f 75 74 2e 6d 73 00 05 33 30 30 30 30 05 05 ff ff 00 29 74 72 61 6e 73 61 63 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102700.in  istuple:N  msg:"6e 2e 70 61 72 74 69 74 69 6f 6e 2e 76 65 72 69 66 69 63 61 74 69 6f 6e 2e 65 6e 61 62 6c 65 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102710.in  istuple:N  msg:"04 74 72 75 65 00 05 00 00 00 00 01 00 29 74 72 61 6e 73 61 63 74 69 6f 6e 2e 70 61 72 74 69 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102720.in  istuple:N  msg:"69 6f 6e 2e 76 65 72 69 66 69 63 61 74 69 6f 6e 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102730.in  istuple:N  msg:"ff 00 25 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 69 6e 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102740.in  istuple:N  msg:"65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 01 05 00 00 00 00 01 00 25 67 72 6f 75 70 2e 73 68 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102750.in  istuple:N  msg:"72 65 2e 6d 69 6e 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102760.in  istuple:N  msg:"30 30 05 03 ff ff 00 1b 73 73 6c 2e 70 72 69 6e 63 69 70 61 6c 2e 6d 61 70 70 69 6e 67 2e 72 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102770.in  istuple:N  msg:"6c 65 73 00 07 44 45 46 41 55 4c 54 01 05 00 00 00 00 01 00 1b 73 73 6c 2e 70 72 69 6e 63 69 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102780.in  istuple:N  msg:"61 6c 2e 6d 61 70 70 69 6e 67 2e 72 75 6c 65 73 00 07 44 45 46 41 55 4c 54 05 02 ff ff 00 16 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102790.in  istuple:N  msg:"65 70 6c 69 63 61 2e 73 65 6c 65 63 74 6f 72 2e 63 6c 61 73 73 ff ff 01 05 00 00 00 00 00 02 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102800.in  istuple:N  msg:"ff 00 32 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 71 75 6f 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102810.in  istuple:N  msg:"61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 01 05 00 00 00 00 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102820.in  istuple:N  msg:"32 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 66 65 74 63 68 2e 71 75 6f 74 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102830.in  istuple:N  msg:"77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff 00 16 6d 61 78 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102840.in  istuple:N  msg:"63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 70 65 72 2e 69 70 00 0a 32 31 34 37 34 38 33 36 34 37 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102850.in  istuple:N  msg:"00 00 00 00 01 00 16 6d 61 78 2e 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 70 65 72 2e 69 70 00 0a 32"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102860.in  istuple:N  msg:"31 34 37 34 38 33 36 34 37 05 03 ff ff 00 12 62 61 63 6b 67 72 6f 75 6e 64 2e 74 68 72 65 61 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102870.in  istuple:N  msg:"73 00 02 31 30 00 05 00 00 00 00 01 00 12 62 61 63 6b 67 72 6f 75 6e 64 2e 74 68 72 65 61 64 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102880.in  istuple:N  msg:"00 02 31 30 05 03 ff ff 00 12 72 65 71 75 65 73 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 33 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102890.in  istuple:N  msg:"30 30 30 01 05 00 00 00 00 01 00 12 72 65 71 75 65 73 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102900.in  istuple:N  msg:"33 30 30 30 30 05 03 ff ff 00 1a 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 66 6f 72 6d 61 74 2e 76 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102910.in  istuple:N  msg:"72 73 69 6f 6e 00 07 33 2e 30 2d 49 56 31 01 05 00 00 00 00 01 00 1a 6c 6f 67 2e 6d 65 73 73 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102920.in  istuple:N  msg:"67 65 2e 66 6f 72 6d 61 74 2e 76 65 72 73 69 6f 6e 00 07 33 2e 30 2d 49 56 31 05 02 ff ff 00 10"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102930.in  istuple:N  msg:"73 61 73 6c 2e 6c 6f 67 69 6e 2e 63 6c 61 73 73 ff ff 01 05 00 00 00 00 00 08 ff ff 00 2c 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102940.in  istuple:N  msg:"6d 6f 74 65 2e 6c 6f 67 2e 69 6e 64 65 78 2e 66 69 6c 65 2e 63 61 63 68 65 2e 74 6f 74 61 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102950.in  istuple:N  msg:"73 69 7a 65 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 00 05 00 00 00 00 01 00 2c 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102960.in  istuple:N  msg:"65 6d 6f 74 65 2e 6c 6f 67 2e 69 6e 64 65 78 2e 66 69 6c 65 2e 63 61 63 68 65 2e 74 6f 74 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102970.in  istuple:N  msg:"2e 73 69 7a 65 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 05 05 ff ff 00 07 6c 6f 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102980.in  istuple:N  msg:"2e 64 69 72 00 0f 2f 74 6d 70 2f 6b 61 66 6b 61 2d 6c 6f 67 73 01 05 00 00 00 00 01 00 07 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/102990.in  istuple:N  msg:"67 2e 64 69 72 00 0f 2f 74 6d 70 2f 6b 61 66 6b 61 2d 6c 6f 67 73 05 02 ff ff 00 11 6c 6f 67 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103000.in  istuple:N  msg:"73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 00 04 00 00 00 00 02"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103010.in  istuple:N  msg:"00 11 6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 04"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103020.in  istuple:N  msg:"00 11 6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 0a 31 30 37 33 37 34 31 38 32 34 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103030.in  istuple:N  msg:"03 ff ff 00 20 72 65 70 6c 69 63 61 2e 66 65 74 63 68 2e 72 65 73 70 6f 6e 73 65 2e 6d 61 78 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103040.in  istuple:N  msg:"62 79 74 65 73 00 08 31 30 34 38 35 37 36 30 01 05 00 00 00 00 01 00 20 72 65 70 6c 69 63 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103050.in  istuple:N  msg:"66 65 74 63 68 2e 72 65 73 70 6f 6e 73 65 2e 6d 61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103060.in  istuple:N  msg:"36 30 05 03 ff ff 00 24 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 68 65 61 72 74 62 65 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103070.in  istuple:N  msg:"2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 01 05 00 00 00 00 01 00 24 67 72 6f 75 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103080.in  istuple:N  msg:"2e 63 6f 6e 73 75 6d 65 72 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103090.in  istuple:N  msg:"04 35 30 30 30 05 03 ff ff 00 1c 67 72 6f 75 70 2e 6d 61 78 2e 73 65 73 73 69 6f 6e 2e 74 69 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103100.in  istuple:N  msg:"65 6f 75 74 2e 6d 73 00 07 31 38 30 30 30 30 30 01 05 00 00 00 00 01 00 1c 67 72 6f 75 70 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103110.in  istuple:N  msg:"61 78 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 07 31 38 30 30 30 30 30 05 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103120.in  istuple:N  msg:"ff ff 00 19 63 6f 6e 74 72 6f 6c 6c 65 72 2e 6c 69 73 74 65 6e 65 72 2e 6e 61 6d 65 73 00 0a 43"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103130.in  istuple:N  msg:"4f 4e 54 52 4f 4c 4c 45 52 01 04 00 00 00 00 01 00 19 63 6f 6e 74 72 6f 6c 6c 65 72 2e 6c 69 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103140.in  istuple:N  msg:"74 65 6e 65 72 2e 6e 61 6d 65 73 00 0a 43 4f 4e 54 52 4f 4c 4c 45 52 04 02 ff ff 00 22 6c 6f 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103150.in  istuple:N  msg:"2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 61 66 74 65 72 2e 6d 61 78 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103160.in  istuple:N  msg:"13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 00 00 01 00 22 6c 6f 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103170.in  istuple:N  msg:"2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 61 66 74 65 72 2e 6d 61 78 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103180.in  istuple:N  msg:"13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05 05 ff ff 00 22 63 6f 6e 74 72 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103190.in  istuple:N  msg:"6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 61 70 70 65 6e 64 2e 6c 69 6e 67 65 72 2e 6d 73 00 02 32 35"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103200.in  istuple:N  msg:"01 05 00 00 00 00 01 00 22 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 61 70 70 65 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103210.in  istuple:N  msg:"64 2e 6c 69 6e 67 65 72 2e 6d 73 00 02 32 35 05 03 ff ff 00 1b 6c 6f 67 2e 73 65 67 6d 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103220.in  istuple:N  msg:"2e 64 65 6c 65 74 65 2e 64 65 6c 61 79 2e 6d 73 00 05 36 30 30 30 30 00 05 00 00 00 00 01 00 1b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103230.in  istuple:N  msg:"6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 64 65 6c 65 74 65 2e 64 65 6c 61 79 2e 6d 73 00 05 36 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103240.in  istuple:N  msg:"30 30 05 05 ff ff 00 15 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 69 6e 75 74 65 73 ff ff 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103250.in  istuple:N  msg:"05 00 00 00 00 00 03 ff ff 00 08 6c 6f 67 2e 64 69 72 73 00 53 2f 6d 6e 74 2f 64 61 74 61 2d 31"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103260.in  istuple:N  msg:"2f 64 65 76 2e 61 6b 2d 38 2c 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 2c 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103270.in  istuple:N  msg:"6d 6e 74 2f 64 61 74 61 2d 33 2f 64 65 76 2e 61 6b 2d 38 2c 2f 6d 6e 74 2f 64 61 74 61 2d 34 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103280.in  istuple:N  msg:"64 65 76 2e 61 6b 2d 38 01 04 00 00 00 00 01 00 08 6c 6f 67 2e 64 69 72 73 00 53 2f 6d 6e 74 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103290.in  istuple:N  msg:"64 61 74 61 2d 31 2f 64 65 76 2e 61 6b 2d 38 2c 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103300.in  istuple:N  msg:"61 6b 2d 38 2c 2f 6d 6e 74 2f 64 61 74 61 2d 33 2f 64 65 76 2e 61 6b 2d 38 2c 2f 6d 6e 74 2f 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103310.in  istuple:N  msg:"61 74 61 2d 34 2f 64 65 76 2e 61 6b 2d 38 04 02 ff ff 00 1a 63 6f 6e 74 72 6f 6c 6c 65 64 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103320.in  istuple:N  msg:"68 75 74 64 6f 77 6e 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 01 05 00 00 00 00 01 00 1a 63 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103330.in  istuple:N  msg:"74 72 6f 6c 6c 65 64 2e 73 68 75 74 64 6f 77 6e 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103340.in  istuple:N  msg:"ff 00 15 65 61 72 6c 79 2e 73 74 61 72 74 2e 6c 69 73 74 65 6e 65 72 73 ff ff 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103350.in  istuple:N  msg:"00 02 ff ff 00 23 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 62 65 66 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103360.in  istuple:N  msg:"72 65 2e 6d 61 78 2e 6d 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103370.in  istuple:N  msg:"00 00 00 00 01 00 23 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 62 65 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103380.in  istuple:N  msg:"6f 72 65 2e 6d 61 78 2e 6d 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103390.in  istuple:N  msg:"05 ff ff 00 2a 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f 70 69 65 72 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103400.in  istuple:N  msg:"68 72 65 61 64 2e 70 6f 6f 6c 2e 73 69 7a 65 00 02 2d 31 01 05 00 00 00 00 01 00 2a 72 65 6d 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103410.in  istuple:N  msg:"74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f 70 69 65 72 2e 74 68 72 65 61 64 2e 70 6f 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103420.in  istuple:N  msg:"6c 2e 73 69 7a 65 00 02 2d 31 05 03 ff ff 00 26 73 6f 63 6b 65 74 2e 63 6f 6e 6e 65 63 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103430.in  istuple:N  msg:"6e 2e 73 65 74 75 70 2e 74 69 6d 65 6f 75 74 2e 6d 61 78 2e 6d 73 00 05 33 30 30 30 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103440.in  istuple:N  msg:"00 00 00 01 00 26 73 6f 63 6b 65 74 2e 63 6f 6e 6e 65 63 74 69 6f 6e 2e 73 65 74 75 70 2e 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103450.in  istuple:N  msg:"6d 65 6f 75 74 2e 6d 61 78 2e 6d 73 00 05 33 30 30 30 30 05 05 ff ff 00 27 6c 6f 67 2e 6d 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103460.in  istuple:N  msg:"73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 64 69 66 66 65 72 65 6e 63 65 2e 6d 61 78 2e 6d 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103470.in  istuple:N  msg:"00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 00 00 01 00 27 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103480.in  istuple:N  msg:"67 2e 6d 65 73 73 61 67 65 2e 74 69 6d 65 73 74 61 6d 70 2e 64 69 66 66 65 72 65 6e 63 65 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103490.in  istuple:N  msg:"61 78 2e 6d 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05 05 ff ff 00 21"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103500.in  istuple:N  msg:"73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 73 63 6f 70 65 2e 63 6c 61 69 6d 2e 6e 61 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103510.in  istuple:N  msg:"65 00 05 73 63 6f 70 65 01 05 00 00 00 00 01 00 21 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103520.in  istuple:N  msg:"72 2e 73 63 6f 70 65 2e 63 6c 61 69 6d 2e 6e 61 6d 65 00 05 73 63 6f 70 65 05 02 ff ff 00 1b 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103530.in  istuple:N  msg:"61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 6b 65 79 2e 6c 65 6e 67 74 68 00 03 31 32 38 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103540.in  istuple:N  msg:"05 00 00 00 00 01 00 1b 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 6b 65 79 2e 6c 65 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103550.in  istuple:N  msg:"67 74 68 00 03 31 32 38 05 03 ff ff 00 25 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103560.in  istuple:N  msg:"2e 6d 69 6e 2e 70 65 72 69 6f 64 2e 73 65 63 6f 6e 64 73 00 02 36 30 00 05 00 00 00 00 01 00 25"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103570.in  istuple:N  msg:"73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68 2e 6d 69 6e 2e 70 65 72 69 6f 64 2e 73 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103580.in  istuple:N  msg:"63 6f 6e 64 73 00 02 36 30 05 04 ff ff 00 20 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103590.in  istuple:N  msg:"65 78 70 65 63 74 65 64 2e 69 73 73 75 65 72 ff ff 01 05 00 00 00 00 00 02 ff ff 00 1a 73 61 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103600.in  istuple:N  msg:"6c 2e 6c 6f 67 69 6e 2e 72 65 61 64 2e 74 69 6d 65 6f 75 74 2e 6d 73 ff ff 01 05 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103610.in  istuple:N  msg:"03 ff ff 00 3b 74 72 61 6e 73 61 63 74 69 6f 6e 2e 61 62 6f 72 74 2e 74 69 6d 65 64 2e 6f 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103620.in  istuple:N  msg:"2e 74 72 61 6e 73 61 63 74 69 6f 6e 2e 63 6c 65 61 6e 75 70 2e 69 6e 74 65 72 76 61 6c 2e 6d 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103630.in  istuple:N  msg:"00 05 31 30 30 30 30 01 05 00 00 00 00 01 00 3b 74 72 61 6e 73 61 63 74 69 6f 6e 2e 61 62 6f 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103640.in  istuple:N  msg:"74 2e 74 69 6d 65 64 2e 6f 75 74 2e 74 72 61 6e 73 61 63 74 69 6f 6e 2e 63 6c 65 61 6e 75 70 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103650.in  istuple:N  msg:"69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 31 30 30 30 30 05 03 ff ff 00 17 73 61 73 6c 2e 6b 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103660.in  istuple:N  msg:"62 65 72 6f 73 2e 6b 69 6e 69 74 2e 63 6d 64 00 0e 2f 75 73 72 2f 62 69 6e 2f 6b 69 6e 69 74 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103670.in  istuple:N  msg:"05 00 00 00 00 01 00 17 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 6b 69 6e 69 74 2e 63 6d 64 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103680.in  istuple:N  msg:"0e 2f 75 73 72 2f 62 69 6e 2f 6b 69 6e 69 74 05 02 ff ff 00 23 6c 6f 67 2e 63 6c 65 61 6e 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103690.in  istuple:N  msg:"2e 69 6f 2e 6d 61 78 2e 62 79 74 65 73 2e 70 65 72 2e 73 65 63 6f 6e 64 00 16 31 2e 37 39 37 36"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103700.in  istuple:N  msg:"39 33 31 33 34 38 36 32 33 31 35 37 45 33 30 38 00 05 00 00 00 00 01 00 23 6c 6f 67 2e 63 6c 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103710.in  istuple:N  msg:"61 6e 65 72 2e 69 6f 2e 6d 61 78 2e 62 79 74 65 73 2e 70 65 72 2e 73 65 63 6f 6e 64 00 16 31 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103720.in  istuple:N  msg:"37 39 37 36 39 33 31 33 34 38 36 32 33 31 35 37 45 33 30 38 05 06 ff ff 00 1c 61 75 74 6f 2e 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103730.in  istuple:N  msg:"65 61 64 65 72 2e 72 65 62 61 6c 61 6e 63 65 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103740.in  istuple:N  msg:"00 00 01 00 1c 61 75 74 6f 2e 6c 65 61 64 65 72 2e 72 65 62 61 6c 61 6e 63 65 2e 65 6e 61 62 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103750.in  istuple:N  msg:"65 00 04 74 72 75 65 05 01 ff ff 00 27 6c 65 61 64 65 72 2e 69 6d 62 61 6c 61 6e 63 65 2e 63 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103760.in  istuple:N  msg:"65 63 6b 2e 69 6e 74 65 72 76 61 6c 2e 73 65 63 6f 6e 64 73 00 03 33 30 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103770.in  istuple:N  msg:"00 27 6c 65 61 64 65 72 2e 69 6d 62 61 6c 61 6e 63 65 2e 63 68 65 63 6b 2e 69 6e 74 65 72 76 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103780.in  istuple:N  msg:"6c 2e 73 65 63 6f 6e 64 73 00 03 33 30 30 05 05 ff ff 00 1f 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103790.in  istuple:N  msg:"6d 69 6e 2e 63 6c 65 61 6e 61 62 6c 65 2e 72 61 74 69 6f 00 03 30 2e 35 00 05 00 00 00 00 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103800.in  istuple:N  msg:"1f 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 6d 69 6e 2e 63 6c 65 61 6e 61 62 6c 65 2e 72 61 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103810.in  istuple:N  msg:"00 03 30 2e 35 05 06 ff ff 00 27 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 69 6e 2e 72 65 63 6f 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103820.in  istuple:N  msg:"64 2e 6c 6f 63 6b 2e 64 75 72 61 74 69 6f 6e 2e 6d 73 00 05 31 35 30 30 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103830.in  istuple:N  msg:"00 27 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 69 6e 2e 72 65 63 6f 72 64 2e 6c 6f 63 6b 2e 64 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103840.in  istuple:N  msg:"72 61 74 69 6f 6e 2e 6d 73 00 05 31 35 30 30 30 05 03 ff ff 00 17 72 65 70 6c 69 63 61 2e 6c 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103850.in  istuple:N  msg:"67 2e 74 69 6d 65 2e 6d 61 78 2e 6d 73 00 05 33 30 30 30 30 01 05 00 00 00 00 01 00 17 72 65 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103860.in  istuple:N  msg:"6c 69 63 61 2e 6c 61 67 2e 74 69 6d 65 2e 6d 61 78 2e 6d 73 00 05 33 30 30 30 30 05 05 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103870.in  istuple:N  msg:"13 6e 75 6d 2e 6e 65 74 77 6f 72 6b 2e 74 68 72 65 61 64 73 00 01 38 00 04 00 00 00 00 02 00 13"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103880.in  istuple:N  msg:"6e 75 6d 2e 6e 65 74 77 6f 72 6b 2e 74 68 72 65 61 64 73 00 01 38 04 00 13 6e 75 6d 2e 6e 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103890.in  istuple:N  msg:"77 6f 72 6b 2e 74 68 72 65 61 64 73 00 01 33 05 03 ff ff 00 22 67 72 6f 75 70 2e 73 68 61 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103900.in  istuple:N  msg:"2e 6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 01 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103910.in  istuple:N  msg:"00 00 00 00 01 00 22 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103920.in  istuple:N  msg:"69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 05 03 ff ff 00 10 73 73 6c 2e 6b 65 79 73 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103930.in  istuple:N  msg:"72 65 2e 6b 65 79 ff ff 00 05 01 00 00 00 00 09 ff ff 00 22 73 61 73 6c 2e 63 6c 69 65 6e 74 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103940.in  istuple:N  msg:"63 61 6c 6c 62 61 63 6b 2e 68 61 6e 64 6c 65 72 2e 63 6c 61 73 73 ff ff 01 05 00 00 00 00 00 08"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103950.in  istuple:N  msg:"ff ff 00 16 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 67 7a 69 70 2e 6c 65 76 65 6c 00 02 2d 31 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103960.in  istuple:N  msg:"00 00 00 00 01 00 16 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 67 7a 69 70 2e 6c 65 76 65 6c 00 02 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103970.in  istuple:N  msg:"31 05 03 ff ff 00 13 6d 65 74 72 69 63 73 2e 6e 75 6d 2e 73 61 6d 70 6c 65 73 00 01 32 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103980.in  istuple:N  msg:"00 00 00 01 00 13 6d 65 74 72 69 63 73 2e 6e 75 6d 2e 73 61 6d 70 6c 65 73 00 01 32 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/103990.in  istuple:N  msg:"00 18 73 6f 63 6b 65 74 2e 73 65 6e 64 2e 62 75 66 66 65 72 2e 62 79 74 65 73 00 06 31 30 32 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104000.in  istuple:N  msg:"30 30 01 04 00 00 00 00 02 00 18 73 6f 63 6b 65 74 2e 73 65 6e 64 2e 62 75 66 66 65 72 2e 62 79"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104010.in  istuple:N  msg:"74 65 73 00 06 31 30 32 34 30 30 04 00 18 73 6f 63 6b 65 74 2e 73 65 6e 64 2e 62 75 66 66 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104020.in  istuple:N  msg:"2e 62 79 74 65 73 00 06 31 30 32 34 30 30 05 03 ff ff 00 25 67 72 6f 75 70 2e 63 6f 6f 72 64 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104030.in  istuple:N  msg:"6e 61 74 6f 72 2e 72 65 62 61 6c 61 6e 63 65 2e 70 72 6f 74 6f 63 6f 6c 73 00 07 63 6c 61 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104040.in  istuple:N  msg:"69 63 01 05 00 00 00 00 01 00 25 67 72 6f 75 70 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 72 65 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104050.in  istuple:N  msg:"61 6c 61 6e 63 65 2e 70 72 6f 74 6f 63 6f 6c 73 00 07 63 6c 61 73 73 69 63 05 07 ff ff 00 25 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104060.in  istuple:N  msg:"61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 6b 65 79 66 61 63 74 6f 72 79 2e 61 6c 67 6f 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104070.in  istuple:N  msg:"69 74 68 6d ff ff 01 05 00 00 00 00 00 02 ff ff 00 25 72 65 6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104080.in  istuple:N  msg:"72 61 67 65 2e 6d 61 6e 61 67 65 72 2e 63 6c 61 73 73 2e 6e 61 6d 65 ff ff 01 05 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104090.in  istuple:N  msg:"02 ff ff 00 1b 73 6f 63 6b 65 74 2e 72 65 63 65 69 76 65 2e 62 75 66 66 65 72 2e 62 79 74 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104100.in  istuple:N  msg:"00 06 31 30 32 34 30 30 01 04 00 00 00 00 02 00 1b 73 6f 63 6b 65 74 2e 72 65 63 65 69 76 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104110.in  istuple:N  msg:"62 75 66 66 65 72 2e 62 79 74 65 73 00 06 31 30 32 34 30 30 04 00 1b 73 6f 63 6b 65 74 2e 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104120.in  istuple:N  msg:"63 65 69 76 65 2e 62 75 66 66 65 72 2e 62 79 74 65 73 00 06 31 30 32 34 30 30 05 03 ff ff 00 1f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104130.in  istuple:N  msg:"73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 73 75 62 2e 63 6c 61 69 6d 2e 6e 61 6d 65 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104140.in  istuple:N  msg:"03 73 75 62 01 05 00 00 00 00 01 00 1f 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 73 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104150.in  istuple:N  msg:"62 2e 63 6c 61 69 6d 2e 6e 61 6d 65 00 03 73 75 62 05 02 ff ff 00 17 72 65 70 6c 69 63 61 2e 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104160.in  istuple:N  msg:"65 74 63 68 2e 6d 69 6e 2e 62 79 74 65 73 00 01 31 01 05 00 00 00 00 01 00 17 72 65 70 6c 69 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104170.in  istuple:N  msg:"61 2e 66 65 74 63 68 2e 6d 69 6e 2e 62 79 74 65 73 00 01 31 05 03 ff ff 00 0b 62 72 6f 6b 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104180.in  istuple:N  msg:"2e 72 61 63 6b ff ff 01 05 00 00 00 00 00 02 ff ff 00 21 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104190.in  istuple:N  msg:"2e 74 72 75 73 74 73 74 6f 72 65 2e 70 61 73 73 77 6f 72 64 ff ff 01 05 01 00 00 00 00 09 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104200.in  istuple:N  msg:"00 1e 75 6e 63 6c 65 61 6e 2e 6c 65 61 64 65 72 2e 65 6c 65 63 74 69 6f 6e 2e 65 6e 61 62 6c 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104210.in  istuple:N  msg:"00 05 66 61 6c 73 65 00 05 00 00 00 00 01 00 1e 75 6e 63 6c 65 61 6e 2e 6c 65 61 64 65 72 2e 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104220.in  istuple:N  msg:"6c 65 63 74 69 6f 6e 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 05 01 ff ff 00 2f 73 61 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104230.in  istuple:N  msg:"6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74 2e 72 65 74 72 79 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104240.in  istuple:N  msg:"62 61 63 6b 6f 66 66 2e 6d 73 00 03 31 30 30 01 05 00 00 00 00 01 00 2f 73 61 73 6c 2e 6f 61 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104250.in  istuple:N  msg:"74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74 2e 72 65 74 72 79 2e 62 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104260.in  istuple:N  msg:"6b 6f 66 66 2e 6d 73 00 03 31 30 30 05 05 ff ff 00 23 6f 66 66 73 65 74 73 2e 72 65 74 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104270.in  istuple:N  msg:"69 6f 6e 2e 63 68 65 63 6b 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 06 36 30 30 30 30 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104280.in  istuple:N  msg:"00 00 00 01 00 23 6f 66 66 73 65 74 73 2e 72 65 74 65 6e 74 69 6f 6e 2e 63 68 65 63 6b 2e 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104290.in  istuple:N  msg:"74 65 72 76 61 6c 2e 6d 73 00 06 36 30 30 30 30 30 05 05 ff ff 00 2a 70 72 6f 64 75 63 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104300.in  istuple:N  msg:"70 75 72 67 61 74 6f 72 79 2e 70 75 72 67 65 2e 69 6e 74 65 72 76 61 6c 2e 72 65 71 75 65 73 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104310.in  istuple:N  msg:"73 00 04 31 30 30 30 01 05 00 00 00 00 01 00 2a 70 72 6f 64 75 63 65 72 2e 70 75 72 67 61 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104320.in  istuple:N  msg:"72 79 2e 70 75 72 67 65 2e 69 6e 74 65 72 76 61 6c 2e 72 65 71 75 65 73 74 73 00 04 31 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104330.in  istuple:N  msg:"05 03 ff ff 00 18 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 76 6f 74 65 72 73 00 53"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104340.in  istuple:N  msg:"31 40 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 30 34 39 2c 32 40 64 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104350.in  istuple:N  msg:"76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 32 2e 69 6e 74 3a 31 30 35 31 2c 33 40 64 65 76 2e 61 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104360.in  istuple:N  msg:"2d 38 2e 6b 61 66 6b 61 2d 33 2e 69 6e 74 3a 31 30 35 33 01 04 00 00 00 00 02 00 18 63 6f 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104370.in  istuple:N  msg:"72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 76 6f 74 65 72 73 00 53 31 40 64 65 76 2e 61 6b 2d 38"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104380.in  istuple:N  msg:"2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 30 34 39 2c 32 40 64 65 76 2e 61 6b 2d 38 2e 6b 61 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104390.in  istuple:N  msg:"6b 61 2d 32 2e 69 6e 74 3a 31 30 35 31 2c 33 40 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 33"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104400.in  istuple:N  msg:"2e 69 6e 74 3a 31 30 35 33 04 00 18 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 76 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104410.in  istuple:N  msg:"74 65 72 73 00 00 05 07 ff ff 00 18 6d 65 74 72 69 63 73 2e 73 61 6d 70 6c 65 2e 77 69 6e 64 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104420.in  istuple:N  msg:"77 2e 6d 73 00 05 33 30 30 30 30 01 05 00 00 00 00 01 00 18 6d 65 74 72 69 63 73 2e 73 61 6d 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104430.in  istuple:N  msg:"6c 65 2e 77 69 6e 64 6f 77 2e 6d 73 00 05 33 30 30 30 30 05 05 ff ff 00 1f 6c 6f 67 2e 72 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104440.in  istuple:N  msg:"65 6e 74 69 6f 6e 2e 63 68 65 63 6b 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 06 33 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104450.in  istuple:N  msg:"01 04 00 00 00 00 02 00 1f 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e 2e 63 68 65 63 6b 2e 69 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104460.in  istuple:N  msg:"65 72 76 61 6c 2e 6d 73 00 06 33 30 30 30 30 30 04 00 1f 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104470.in  istuple:N  msg:"2e 63 68 65 63 6b 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 06 33 30 30 30 30 30 05 05 ff ff 00 21"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104480.in  istuple:N  msg:"67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104490.in  istuple:N  msg:"73 00 05 34 35 30 30 30 01 05 00 00 00 00 01 00 21 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104500.in  istuple:N  msg:"73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 34 35 30 30 30 05 03 ff ff 00 20 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104510.in  istuple:N  msg:"61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68 2e 77 69 6e 64 6f 77 2e 6a 69 74 74 65 72 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104520.in  istuple:N  msg:"04 30 2e 30 35 00 05 00 00 00 00 01 00 20 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104530.in  istuple:N  msg:"2e 77 69 6e 64 6f 77 2e 6a 69 74 74 65 72 00 04 30 2e 30 35 05 06 ff ff 00 26 6c 65 61 64 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104540.in  istuple:N  msg:"2e 69 6d 62 61 6c 61 6e 63 65 2e 70 65 72 2e 62 72 6f 6b 65 72 2e 70 65 72 63 65 6e 74 61 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104550.in  istuple:N  msg:"00 02 31 30 01 05 00 00 00 00 01 00 26 6c 65 61 64 65 72 2e 69 6d 62 61 6c 61 6e 63 65 2e 70 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104560.in  istuple:N  msg:"72 2e 62 72 6f 6b 65 72 2e 70 65 72 63 65 6e 74 61 67 65 00 02 31 30 05 03 ff ff 00 1b 63 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104570.in  istuple:N  msg:"74 72 6f 6c 6c 65 72 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104580.in  istuple:N  msg:"00 00 01 00 1b 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104590.in  istuple:N  msg:"00 02 31 31 05 03 ff ff 00 10 6d 65 74 72 69 63 2e 72 65 70 6f 72 74 65 72 73 00 00 00 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104600.in  istuple:N  msg:"00 00 01 00 10 6d 65 74 72 69 63 2e 72 65 70 6f 72 74 65 72 73 00 00 05 07 ff ff 00 23 73 61 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104610.in  istuple:N  msg:"6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 74 6f 6b 65 6e 2e 65 6e 64 70 6f 69 6e 74 2e 75 72 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104620.in  istuple:N  msg:"ff ff 01 05 00 00 00 00 00 02 ff ff 00 19 61 75 74 6f 2e 63 72 65 61 74 65 2e 74 6f 70 69 63 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104630.in  istuple:N  msg:"2e 65 6e 61 62 6c 65 00 04 74 72 75 65 01 05 00 00 00 00 01 00 19 61 75 74 6f 2e 63 72 65 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104640.in  istuple:N  msg:"65 2e 74 6f 70 69 63 73 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff ff 00 26 67 72 6f 75 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104650.in  istuple:N  msg:"2e 73 68 61 72 65 2e 70 61 72 74 69 74 69 6f 6e 2e 6d 61 78 2e 72 65 63 6f 72 64 2e 6c 6f 63 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104660.in  istuple:N  msg:"73 00 03 32 30 30 01 05 00 00 00 00 01 00 26 67 72 6f 75 70 2e 73 68 61 72 65 2e 70 61 72 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104670.in  istuple:N  msg:"74 69 6f 6e 2e 6d 61 78 2e 72 65 63 6f 72 64 2e 6c 6f 63 6b 73 00 03 32 30 30 05 03 ff ff 00 18"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104680.in  istuple:N  msg:"73 73 6c 2e 65 6e 67 69 6e 65 2e 66 61 63 74 6f 72 79 2e 63 6c 61 73 73 ff ff 00 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104690.in  istuple:N  msg:"00 08 ff ff 00 23 72 65 70 6c 69 63 61 2e 73 6f 63 6b 65 74 2e 72 65 63 65 69 76 65 2e 62 75 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104700.in  istuple:N  msg:"66 65 72 2e 62 79 74 65 73 00 05 36 35 35 33 36 01 05 00 00 00 00 01 00 23 72 65 70 6c 69 63 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104710.in  istuple:N  msg:"2e 73 6f 63 6b 65 74 2e 72 65 63 65 69 76 65 2e 62 75 66 66 65 72 2e 62 79 74 65 73 00 05 36 35"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104720.in  istuple:N  msg:"35 33 36 05 03 ff ff 00 21 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 74 72 75 73 74 73 74 6f 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104730.in  istuple:N  msg:"65 2e 6c 6f 63 61 74 69 6f 6e ff ff 01 05 00 00 00 00 00 02 ff ff 00 14 73 73 6c 2e 61 6c 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104740.in  istuple:N  msg:"77 2e 64 6e 2e 63 68 61 6e 67 65 73 00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 14 73 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104750.in  istuple:N  msg:"61 6c 6c 6f 77 2e 64 6e 2e 63 68 61 6e 67 65 73 00 05 66 61 6c 73 65 05 01 ff ff 00 19 72 65 70"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104760.in  istuple:N  msg:"6c 69 63 61 2e 66 65 74 63 68 2e 77 61 69 74 2e 6d 61 78 2e 6d 73 00 03 35 30 30 01 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104770.in  istuple:N  msg:"00 01 00 19 72 65 70 6c 69 63 61 2e 66 65 74 63 68 2e 77 61 69 74 2e 6d 61 78 2e 6d 73 00 03 35"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104780.in  istuple:N  msg:"30 30 05 03 ff ff 00 1b 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64 65 72 2e 69 74 65 72 61 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104790.in  istuple:N  msg:"6f 6e 73 00 04 34 30 39 36 01 05 00 00 00 00 01 00 1b 70 61 73 73 77 6f 72 64 2e 65 6e 63 6f 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104800.in  istuple:N  msg:"65 72 2e 69 74 65 72 61 74 69 6f 6e 73 00 04 34 30 39 36 05 03 ff ff 00 28 67 72 6f 75 70 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104810.in  istuple:N  msg:"6f 6e 73 75 6d 65 72 2e 6d 69 6e 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104820.in  istuple:N  msg:"73 00 04 35 30 30 30 01 05 00 00 00 00 01 00 28 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104830.in  istuple:N  msg:"69 6e 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 35 30 30 30 05 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104840.in  istuple:N  msg:"ff ff 00 1a 64 65 66 61 75 6c 74 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 66 61 63 74 6f 72 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104850.in  istuple:N  msg:"31 01 05 00 00 00 00 01 00 1a 64 65 66 61 75 6c 74 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 66 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104860.in  istuple:N  msg:"63 74 6f 72 00 01 31 05 03 ff ff 00 17 73 73 6c 2e 74 72 75 73 74 73 74 6f 72 65 2e 70 61 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104870.in  istuple:N  msg:"77 6f 72 64 ff ff 00 05 01 00 00 00 00 09 ff ff 00 26 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104880.in  istuple:N  msg:"70 72 69 6e 63 69 70 61 6c 2e 74 6f 2e 6c 6f 63 61 6c 2e 72 75 6c 65 73 00 07 44 45 46 41 55 4c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104890.in  istuple:N  msg:"54 00 05 00 00 00 00 01 00 26 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 70 72 69 6e 63 69 70 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104900.in  istuple:N  msg:"6c 2e 74 6f 2e 6c 6f 63 61 6c 2e 72 75 6c 65 73 00 07 44 45 46 41 55 4c 54 05 07 ff ff 00 0f 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104910.in  istuple:N  msg:"6f 67 2e 70 72 65 61 6c 6c 6f 63 61 74 65 00 05 66 61 6c 73 65 00 05 00 00 00 00 01 00 0f 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104920.in  istuple:N  msg:"67 2e 70 72 65 61 6c 6c 6f 63 61 74 65 00 05 66 61 6c 73 65 05 01 ff ff 00 23 72 65 6d 6f 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104930.in  istuple:N  msg:"2e 6c 6f 67 2e 72 65 61 64 65 72 2e 6d 61 78 2e 70 65 6e 64 69 6e 67 2e 74 61 73 6b 73 00 03 31"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104940.in  istuple:N  msg:"30 30 01 05 00 00 00 00 01 00 23 72 65 6d 6f 74 65 2e 6c 6f 67 2e 72 65 61 64 65 72 2e 6d 61 78"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104950.in  istuple:N  msg:"2e 70 65 6e 64 69 6e 67 2e 74 61 73 6b 73 00 03 31 30 30 05 03 ff ff 00 1e 74 72 61 6e 73 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104960.in  istuple:N  msg:"74 69 6f 6e 61 6c 2e 69 64 2e 65 78 70 69 72 61 74 69 6f 6e 2e 6d 73 00 09 36 30 34 38 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104970.in  istuple:N  msg:"30 30 01 05 00 00 00 00 01 00 1e 74 72 61 6e 73 61 63 74 69 6f 6e 61 6c 2e 69 64 2e 65 78 70 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104980.in  istuple:N  msg:"72 61 74 69 6f 6e 2e 6d 73 00 09 36 30 34 38 30 30 30 30 30 05 03 ff ff 00 1b 63 6f 6e 74 72 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/104990.in  istuple:N  msg:"6c 2e 70 6c 61 6e 65 2e 6c 69 73 74 65 6e 65 72 2e 6e 61 6d 65 ff ff 01 05 00 00 00 00 00 02 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105000.in  istuple:N  msg:"ff 00 28 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 72 65 70 6c 69 63 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105010.in  istuple:N  msg:"74 69 6f 6e 2e 66 61 63 74 6f 72 00 01 31 01 04 00 00 00 00 02 00 28 74 72 61 6e 73 61 63 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105020.in  istuple:N  msg:"6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 66 61 63 74 6f 72 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105030.in  istuple:N  msg:"01 31 04 00 28 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 72 65 70 6c 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105040.in  istuple:N  msg:"63 61 74 69 6f 6e 2e 66 61 63 74 6f 72 00 01 33 05 04 ff ff 00 0e 6e 75 6d 2e 69 6f 2e 74 68 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105050.in  istuple:N  msg:"65 61 64 73 00 01 38 00 04 00 00 00 00 02 00 0e 6e 75 6d 2e 69 6f 2e 74 68 72 65 61 64 73 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105060.in  istuple:N  msg:"38 04 00 0e 6e 75 6d 2e 69 6f 2e 74 68 72 65 61 64 73 00 01 38 05 03 ff ff 00 21 73 61 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105070.in  istuple:N  msg:"6c 6f 67 69 6e 2e 72 65 66 72 65 73 68 2e 62 75 66 66 65 72 2e 73 65 63 6f 6e 64 73 00 03 33 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105080.in  istuple:N  msg:"30 00 05 00 00 00 00 01 00 21 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68 2e 62 75 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105090.in  istuple:N  msg:"66 65 72 2e 73 65 63 6f 6e 64 73 00 03 33 30 30 05 04 ff ff 00 25 67 72 6f 75 70 2e 73 68 61 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105100.in  istuple:N  msg:"65 2e 6d 61 78 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 31 35 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105110.in  istuple:N  msg:"30 30 01 05 00 00 00 00 01 00 25 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61 78 2e 68 65 61 72 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105120.in  istuple:N  msg:"62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 31 35 30 30 30 05 03 ff ff 00 1c 6f 66 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105130.in  istuple:N  msg:"73 65 74 73 2e 63 6f 6d 6d 69 74 2e 72 65 71 75 69 72 65 64 2e 61 63 6b 73 00 02 2d 31 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105140.in  istuple:N  msg:"00 00 00 01 00 1c 6f 66 66 73 65 74 73 2e 63 6f 6d 6d 69 74 2e 72 65 71 75 69 72 65 64 2e 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105150.in  istuple:N  msg:"6b 73 00 02 2d 31 05 04 ff ff 00 29 63 6f 6e 6e 65 63 74 69 6f 6e 2e 66 61 69 6c 65 64 2e 61 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105160.in  istuple:N  msg:"74 68 65 6e 74 69 63 61 74 69 6f 6e 2e 64 65 6c 61 79 2e 6d 73 00 03 31 30 30 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105170.in  istuple:N  msg:"01 00 29 63 6f 6e 6e 65 63 74 69 6f 6e 2e 66 61 69 6c 65 64 2e 61 75 74 68 65 6e 74 69 63 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105180.in  istuple:N  msg:"69 6f 6e 2e 64 65 6c 61 79 2e 6d 73 00 03 31 30 30 05 03 ff ff 00 13 64 65 6c 65 74 65 2e 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105190.in  istuple:N  msg:"70 69 63 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 01 05 00 00 00 00 01 00 13 64 65 6c 65 74 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105200.in  istuple:N  msg:"74 6f 70 69 63 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff ff 00 19 71 75 6f 74 61 2e 77 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105210.in  istuple:N  msg:"6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 01 05 00 00 00 00 01 00 19 71 75 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105220.in  istuple:N  msg:"74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff 00 13 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105230.in  istuple:N  msg:"73 6c 2e 74 72 75 73 74 73 74 6f 72 65 2e 74 79 70 65 00 03 4a 4b 53 00 05 00 00 00 00 01 00 13"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105240.in  istuple:N  msg:"73 73 6c 2e 74 72 75 73 74 73 74 6f 72 65 2e 74 79 70 65 00 03 4a 4b 53 05 02 ff ff 00 19 6f 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105250.in  istuple:N  msg:"66 73 65 74 73 2e 63 6f 6d 6d 69 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 04 35 30 30 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105260.in  istuple:N  msg:"00 00 00 01 00 19 6f 66 66 73 65 74 73 2e 63 6f 6d 6d 69 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105270.in  istuple:N  msg:"04 35 30 30 30 05 03 ff ff 00 19 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 6f 63 73 70 2e 65 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105280.in  istuple:N  msg:"61 62 6c 65 00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 19 7a 6f 6f 6b 65 65 70 65 72 2e 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105290.in  istuple:N  msg:"6c 2e 6f 63 73 70 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 05 01 ff ff 00 1c 62 72 6f 6b 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105300.in  istuple:N  msg:"2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 04 32 30 30 30 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105310.in  istuple:N  msg:"00 00 01 00 1c 62 72 6f 6b 65 72 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105320.in  istuple:N  msg:"73 00 04 32 30 30 30 05 03 ff ff 00 27 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61 78 2e 72 65 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105330.in  istuple:N  msg:"6f 72 64 2e 6c 6f 63 6b 2e 64 75 72 61 74 69 6f 6e 2e 6d 73 00 05 36 30 30 30 30 01 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105340.in  istuple:N  msg:"00 01 00 27 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61 78 2e 72 65 63 6f 72 64 2e 6c 6f 63 6b 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105350.in  istuple:N  msg:"64 75 72 61 74 69 6f 6e 2e 6d 73 00 05 36 30 30 30 30 05 03 ff ff 00 22 73 61 73 6c 2e 6d 65 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105360.in  istuple:N  msg:"68 61 6e 69 73 6d 2e 63 6f 6e 74 72 6f 6c 6c 65 72 2e 70 72 6f 74 6f 63 6f 6c 00 06 47 53 53 41"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105370.in  istuple:N  msg:"50 49 01 05 00 00 00 00 01 00 22 73 61 73 6c 2e 6d 65 63 68 61 6e 69 73 6d 2e 63 6f 6e 74 72 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105380.in  istuple:N  msg:"6c 6c 65 72 2e 70 72 6f 74 6f 63 6f 6c 00 06 47 53 53 41 50 49 05 02 ff ff 00 21 6c 6f 67 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105390.in  istuple:N  msg:"6c 65 61 6e 65 72 2e 6d 61 78 2e 63 6f 6d 70 61 63 74 69 6f 6e 2e 6c 61 67 2e 6d 73 00 13 39 32"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105400.in  istuple:N  msg:"32 33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 00 05 00 00 00 00 01 00 21 6c 6f 67 2e 63 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105410.in  istuple:N  msg:"65 61 6e 65 72 2e 6d 61 78 2e 63 6f 6d 70 61 63 74 69 6f 6e 2e 6c 61 67 2e 6d 73 00 13 39 32 32"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105420.in  istuple:N  msg:"33 33 37 32 30 33 36 38 35 34 37 37 35 38 30 37 05 05 ff ff 00 1f 7a 6f 6f 6b 65 65 70 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105430.in  istuple:N  msg:"73 73 6c 2e 65 6e 61 62 6c 65 64 2e 70 72 6f 74 6f 63 6f 6c 73 ff ff 01 05 00 00 00 00 00 07 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105440.in  istuple:N  msg:"ff 00 1e 61 6c 6c 6f 77 2e 65 76 65 72 79 6f 6e 65 2e 69 66 2e 6e 6f 2e 61 63 6c 2e 66 6f 75 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105450.in  istuple:N  msg:"64 ff ff 01 04 01 00 00 00 01 00 1e 61 6c 6c 6f 77 2e 65 76 65 72 79 6f 6e 65 2e 69 66 2e 6e 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105460.in  istuple:N  msg:"2e 61 63 6c 2e 66 6f 75 6e 64 ff ff 04 00 ff ff 00 25 72 65 6d 6f 74 65 2e 6c 6f 67 2e 73 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105470.in  istuple:N  msg:"72 61 67 65 2e 6d 61 6e 61 67 65 72 2e 63 6c 61 73 73 2e 70 61 74 68 ff ff 01 05 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105480.in  istuple:N  msg:"02 ff ff 00 10 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73 ff ff 00 05 00 00 00 00 00 05 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105490.in  istuple:N  msg:"ff 00 2b 61 6c 74 65 72 2e 6c 6f 67 2e 64 69 72 73 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105500.in  istuple:N  msg:"6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 01 05 00 00 00 00 01 00 2b 61 6c 74 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105510.in  istuple:N  msg:"2e 6c 6f 67 2e 64 69 72 73 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75 6f 74 61 2e 77 69 6e 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105520.in  istuple:N  msg:"6f 77 2e 6e 75 6d 00 02 31 31 05 03 ff ff 00 12 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 65 6e 61 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105530.in  istuple:N  msg:"6c 65 00 04 74 72 75 65 01 05 00 00 00 00 01 00 12 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 65 6e 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105540.in  istuple:N  msg:"62 6c 65 00 04 74 72 75 65 05 01 ff ff 00 22 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105550.in  istuple:N  msg:"2e 66 65 74 63 68 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 31 30 30 30 30 01 04 00 00 00 00 02 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105560.in  istuple:N  msg:"22 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 66 65 74 63 68 2e 74 69 6d 65 6f 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105570.in  istuple:N  msg:"2e 6d 73 00 05 31 30 30 30 30 04 00 22 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105580.in  istuple:N  msg:"65 74 63 68 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 04 32 30 30 30 05 03 ff ff 00 18 6f 66 66 73 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105590.in  istuple:N  msg:"74 73 2e 6c 6f 61 64 2e 62 75 66 66 65 72 2e 73 69 7a 65 00 07 35 32 34 32 38 38 30 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105600.in  istuple:N  msg:"00 00 01 00 18 6f 66 66 73 65 74 73 2e 6c 6f 61 64 2e 62 75 66 66 65 72 2e 73 69 7a 65 00 07 35"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105610.in  istuple:N  msg:"32 34 32 38 38 30 05 03 ff ff 00 0f 73 73 6c 2e 63 6c 69 65 6e 74 2e 61 75 74 68 00 04 6e 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105620.in  istuple:N  msg:"65 00 05 00 00 00 00 01 00 0f 73 73 6c 2e 63 6c 69 65 6e 74 2e 61 75 74 68 00 04 6e 6f 6e 65 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105630.in  istuple:N  msg:"02 ff ff 00 1f 63 6f 6e 74 72 6f 6c 6c 65 64 2e 73 68 75 74 64 6f 77 6e 2e 6d 61 78 2e 72 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105640.in  istuple:N  msg:"72 69 65 73 00 01 33 01 05 00 00 00 00 01 00 1f 63 6f 6e 74 72 6f 6c 6c 65 64 2e 73 68 75 74 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105650.in  istuple:N  msg:"6f 77 6e 2e 6d 61 78 2e 72 65 74 72 69 65 73 00 01 33 05 03 ff ff 00 20 6f 66 66 73 65 74 73 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105660.in  istuple:N  msg:"74 6f 70 69 63 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 66 61 63 74 6f 72 00 01 31 01 04 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105670.in  istuple:N  msg:"00 02 00 20 6f 66 66 73 65 74 73 2e 74 6f 70 69 63 2e 72 65 70 6c 69 63 61 74 69 6f 6e 2e 66 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105680.in  istuple:N  msg:"63 74 6f 72 00 01 31 04 00 20 6f 66 66 73 65 74 73 2e 74 6f 70 69 63 2e 72 65 70 6c 69 63 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105690.in  istuple:N  msg:"69 6f 6e 2e 66 61 63 74 6f 72 00 01 33 05 04 ff ff 00 1d 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105700.in  istuple:N  msg:"2e 74 72 75 73 74 73 74 6f 72 65 2e 74 79 70 65 ff ff 01 05 00 00 00 00 00 02 ff ff 00 1d 74 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105710.in  istuple:N  msg:"61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 6d 69 6e 2e 69 73 72 00 01 31 01 04"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105720.in  istuple:N  msg:"00 00 00 00 02 00 1d 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 6d 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105730.in  istuple:N  msg:"2e 69 73 72 00 01 31 04 00 1d 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105740.in  istuple:N  msg:"6d 69 6e 2e 69 73 72 00 01 32 05 03 ff ff 00 20 73 73 6c 2e 73 65 63 75 72 65 2e 72 61 6e 64 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105750.in  istuple:N  msg:"6d 2e 69 6d 70 6c 65 6d 65 6e 74 61 74 69 6f 6e ff ff 00 05 00 00 00 00 00 02 ff ff 00 21 73 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105760.in  istuple:N  msg:"73 6c 2e 6b 65 72 62 65 72 6f 73 2e 74 69 63 6b 65 74 2e 72 65 6e 65 77 2e 6a 69 74 74 65 72 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105770.in  istuple:N  msg:"04 30 2e 30 35 00 05 00 00 00 00 01 00 21 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 74 69 63 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105780.in  istuple:N  msg:"65 74 2e 72 65 6e 65 77 2e 6a 69 74 74 65 72 00 04 30 2e 30 35 05 06 ff ff 00 1a 73 73 6c 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105790.in  istuple:N  msg:"72 75 73 74 6d 61 6e 61 67 65 72 2e 61 6c 67 6f 72 69 74 68 6d 00 04 50 4b 49 58 00 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105800.in  istuple:N  msg:"00 01 00 1a 73 73 6c 2e 74 72 75 73 74 6d 61 6e 61 67 65 72 2e 61 6c 67 6f 72 69 74 68 6d 00 04"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105810.in  istuple:N  msg:"50 4b 49 58 05 02 ff ff 00 1c 7a 6f 6f 6b 65 65 70 65 72 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105820.in  istuple:N  msg:"6f 75 74 2e 6d 73 00 05 31 38 30 30 30 01 05 00 00 00 00 01 00 1c 7a 6f 6f 6b 65 65 70 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105830.in  istuple:N  msg:"73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 31 38 30 30 30 05 03 ff ff 00 19 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105840.in  istuple:N  msg:"6f 67 2e 6c 6f 63 61 6c 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 00 02 2d 32 00 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105850.in  istuple:N  msg:"00 00 01 00 19 6c 6f 67 2e 6c 6f 63 61 6c 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 00 02"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105860.in  istuple:N  msg:"2d 32 05 05 ff ff 00 13 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 00 02 2d 31 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105870.in  istuple:N  msg:"05 00 00 00 00 01 00 13 6c 6f 67 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 00 02 2d 31 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105880.in  istuple:N  msg:"05 ff ff 00 24 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105890.in  istuple:N  msg:"65 2e 73 65 63 6f 6e 64 73 00 01 31 01 05 00 00 00 00 01 00 24 63 6f 6e 74 72 6f 6c 6c 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105900.in  istuple:N  msg:"71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 73 69 7a 65 2e 73 65 63 6f 6e 64 73 00 01 31 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105910.in  istuple:N  msg:"00 27 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e 6d 61 6e 61 67 65 72 2e 69 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105920.in  istuple:N  msg:"70 6c 2e 70 72 65 66 69 78 00 0c 72 6c 6d 6d 2e 63 6f 6e 66 69 67 2e 01 05 00 00 00 00 01 00 27"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105930.in  istuple:N  msg:"72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e 6d 61 6e 61 67 65 72 2e 69 6d 70 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105940.in  istuple:N  msg:"2e 70 72 65 66 69 78 00 0c 72 6c 6d 6d 2e 63 6f 6e 66 69 67 2e 05 02 ff ff 00 10 73 61 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105950.in  istuple:N  msg:"6a 61 61 73 2e 63 6f 6e 66 69 67 ff ff 00 05 01 00 00 00 00 09 ff ff 00 25 73 61 73 6c 2e 6b 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105960.in  istuple:N  msg:"72 62 65 72 6f 73 2e 6d 69 6e 2e 74 69 6d 65 2e 62 65 66 6f 72 65 2e 72 65 6c 6f 67 69 6e 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105970.in  istuple:N  msg:"36 30 30 30 30 00 05 00 00 00 00 01 00 25 73 61 73 6c 2e 6b 65 72 62 65 72 6f 73 2e 6d 69 6e 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105980.in  istuple:N  msg:"74 69 6d 65 2e 62 65 66 6f 72 65 2e 72 65 6c 6f 67 69 6e 00 05 36 30 30 30 30 05 05 ff ff 00 19"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/105990.in  istuple:N  msg:"6f 66 66 73 65 74 73 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 69 6e 75 74 65 73 00 05 31 30 30 38 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106000.in  istuple:N  msg:"01 05 00 00 00 00 01 00 19 6f 66 66 73 65 74 73 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 69 6e 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106010.in  istuple:N  msg:"65 73 00 05 31 30 30 38 30 05 03 ff ff 00 18 72 65 70 6c 69 63 61 2e 66 65 74 63 68 2e 62 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106020.in  istuple:N  msg:"6b 6f 66 66 2e 6d 73 00 04 31 30 30 30 01 05 00 00 00 00 01 00 18 72 65 70 6c 69 63 61 2e 66 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106030.in  istuple:N  msg:"74 63 68 2e 62 61 63 6b 6f 66 66 2e 6d 73 00 04 31 30 30 30 05 03 ff ff 00 1d 69 6e 74 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106040.in  istuple:N  msg:"62 72 6f 6b 65 72 2e 70 72 6f 74 6f 63 6f 6c 2e 76 65 72 73 69 6f 6e 00 07 33 2e 39 2d 49 56 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106050.in  istuple:N  msg:"01 05 00 00 00 00 01 00 1d 69 6e 74 65 72 2e 62 72 6f 6b 65 72 2e 70 72 6f 74 6f 63 6f 6c 2e 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106060.in  istuple:N  msg:"65 72 73 69 6f 6e 00 07 33 2e 39 2d 49 56 30 05 02 ff ff 00 17 6b 61 66 6b 61 2e 6d 65 74 72 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106070.in  istuple:N  msg:"63 73 2e 72 65 70 6f 72 74 65 72 73 00 00 01 05 00 00 00 00 01 00 17 6b 61 66 6b 61 2e 6d 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106080.in  istuple:N  msg:"72 69 63 73 2e 72 65 70 6f 72 74 65 72 73 00 00 05 07 ff ff 00 20 67 72 6f 75 70 2e 73 68 61 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106090.in  istuple:N  msg:"65 2e 64 65 6c 69 76 65 72 79 2e 63 6f 75 6e 74 2e 6c 69 6d 69 74 00 01 35 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106100.in  istuple:N  msg:"00 20 67 72 6f 75 70 2e 73 68 61 72 65 2e 64 65 6c 69 76 65 72 79 2e 63 6f 75 6e 74 2e 6c 69 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106110.in  istuple:N  msg:"69 74 00 01 35 05 03 ff ff 00 15 73 73 6c 2e 61 6c 6c 6f 77 2e 73 61 6e 2e 63 68 61 6e 67 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106120.in  istuple:N  msg:"00 05 66 61 6c 73 65 01 05 00 00 00 00 01 00 15 73 73 6c 2e 61 6c 6c 6f 77 2e 73 61 6e 2e 63 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106130.in  istuple:N  msg:"61 6e 67 65 73 00 05 66 61 6c 73 65 05 01 ff ff 00 16 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 7a 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106140.in  istuple:N  msg:"74 64 2e 6c 65 76 65 6c 00 01 33 00 05 00 00 00 00 01 00 16 63 6f 6d 70 72 65 73 73 69 6f 6e 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106150.in  istuple:N  msg:"7a 73 74 64 2e 6c 65 76 65 6c 00 01 33 05 03 ff ff 00 28 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106160.in  istuple:N  msg:"6e 61 67 65 72 2e 63 6f 70 79 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106170.in  istuple:N  msg:"05 00 00 00 00 01 00 28 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 63 6f 70 79 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106180.in  istuple:N  msg:"71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 05 03 ff ff 00 0e 6e 75 6d 2e 70 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106190.in  istuple:N  msg:"72 74 69 74 69 6f 6e 73 00 01 33 01 04 00 00 00 00 02 00 0e 6e 75 6d 2e 70 61 72 74 69 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106200.in  istuple:N  msg:"6e 73 00 01 33 04 00 0e 6e 75 6d 2e 70 61 72 74 69 74 69 6f 6e 73 00 01 31 05 03 ff ff 00 1e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106210.in  istuple:N  msg:"73 6c 2e 6b 65 79 73 74 6f 72 65 2e 63 65 72 74 69 66 69 63 61 74 65 2e 63 68 61 69 6e ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106220.in  istuple:N  msg:"05 01 00 00 00 00 09 ff ff 00 22 73 6f 63 6b 65 74 2e 63 6f 6e 6e 65 63 74 69 6f 6e 2e 73 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106230.in  istuple:N  msg:"75 70 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 31 30 30 30 30 01 05 00 00 00 00 01 00 22 73 6f 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106240.in  istuple:N  msg:"6b 65 74 2e 63 6f 6e 6e 65 63 74 69 6f 6e 2e 73 65 74 75 70 2e 74 69 6d 65 6f 75 74 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106250.in  istuple:N  msg:"05 31 30 30 30 30 05 05 ff ff 00 1b 62 72 6f 6b 65 72 2e 69 64 2e 67 65 6e 65 72 61 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106260.in  istuple:N  msg:"2e 65 6e 61 62 6c 65 00 04 74 72 75 65 01 05 00 00 00 00 01 00 1b 62 72 6f 6b 65 72 2e 69 64 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106270.in  istuple:N  msg:"67 65 6e 65 72 61 74 69 6f 6e 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff ff 00 09 6c 69 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106280.in  istuple:N  msg:"74 65 6e 65 72 73 00 91 50 4c 41 49 4e 54 45 58 54 3a 2f 2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106290.in  istuple:N  msg:"6b 61 2d 31 2e 65 78 74 3a 31 30 33 31 2c 53 53 4c 3a 2f 2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106300.in  istuple:N  msg:"6b 61 2d 31 2e 65 78 74 3a 31 30 33 34 2c 49 4e 54 45 52 4e 41 4c 3a 2f 2f 64 65 76 2e 61 6b 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106310.in  istuple:N  msg:"38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 31 30 34 2c 43 4f 4e 54 52 4f 4c 4c 45 52 3a 2f 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106320.in  istuple:N  msg:"64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 30 34 39 00 04 00 00 00 00 02"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106330.in  istuple:N  msg:"00 09 6c 69 73 74 65 6e 65 72 73 00 91 50 4c 41 49 4e 54 45 58 54 3a 2f 2f 64 65 76 2e 61 6b 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106340.in  istuple:N  msg:"38 2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 31 2c 53 53 4c 3a 2f 2f 64 65 76 2e 61 6b 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106350.in  istuple:N  msg:"38 2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 34 2c 49 4e 54 45 52 4e 41 4c 3a 2f 2f 64 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106360.in  istuple:N  msg:"76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 31 30 34 2c 43 4f 4e 54 52 4f 4c 4c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106370.in  istuple:N  msg:"45 52 3a 2f 2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 30 34 39 04 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106380.in  istuple:N  msg:"09 6c 69 73 74 65 6e 65 72 73 00 11 50 4c 41 49 4e 54 45 58 54 3a 2f 2f 3a 39 30 39 32 05 02 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106390.in  istuple:N  msg:"ff 00 15 73 73 6c 2e 65 6e 61 62 6c 65 64 2e 70 72 6f 74 6f 63 6f 6c 73 00 0f 54 4c 53 76 31 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106400.in  istuple:N  msg:"32 2c 54 4c 53 76 31 2e 33 00 05 00 00 00 00 01 00 15 73 73 6c 2e 65 6e 61 62 6c 65 64 2e 70 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106410.in  istuple:N  msg:"6f 74 6f 63 6f 6c 73 00 0f 54 4c 53 76 31 2e 32 2c 54 4c 53 76 31 2e 33 05 07 ff ff 00 1a 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106420.in  istuple:N  msg:"74 65 72 2e 62 72 6f 6b 65 72 2e 6c 69 73 74 65 6e 65 72 2e 6e 61 6d 65 00 08 49 4e 54 45 52 4e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106430.in  istuple:N  msg:"41 4c 01 04 00 00 00 00 01 00 1a 69 6e 74 65 72 2e 62 72 6f 6b 65 72 2e 6c 69 73 74 65 6e 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106440.in  istuple:N  msg:"2e 6e 61 6d 65 00 08 49 4e 54 45 52 4e 41 4c 04 02 ff ff 00 1e 61 6c 74 65 72 2e 63 6f 6e 66 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106450.in  istuple:N  msg:"67 2e 70 6f 6c 69 63 79 2e 63 6c 61 73 73 2e 6e 61 6d 65 ff ff 01 05 00 00 00 00 00 08 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106460.in  istuple:N  msg:"29 64 65 6c 65 67 61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 65 78 70 69 72 79 2e 63 68 65 63 6b 2e 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106470.in  istuple:N  msg:"6e 74 65 72 76 61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 01 05 00 00 00 00 01 00 29 64 65 6c 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106480.in  istuple:N  msg:"67 61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 65 78 70 69 72 79 2e 63 68 65 63 6b 2e 69 6e 74 65 72 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106490.in  istuple:N  msg:"61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 05 05 ff ff 00 1f 6c 6f 67 2e 66 6c 75 73 68 2e 73 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106500.in  istuple:N  msg:"68 65 64 75 6c 65 72 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 13 39 32 32 33 33 37 32 30 33 36 38"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106510.in  istuple:N  msg:"35 34 37 37 35 38 30 37 01 05 00 00 00 00 01 00 1f 6c 6f 67 2e 66 6c 75 73 68 2e 73 63 68 65 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106520.in  istuple:N  msg:"75 6c 65 72 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 13 39 32 32 33 33 37 32 30 33 36 38 35 34 37"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106530.in  istuple:N  msg:"37 35 38 30 37 05 05 ff ff 00 20 7a 6f 6f 6b 65 65 70 65 72 2e 6d 61 78 2e 69 6e 2e 66 6c 69 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106540.in  istuple:N  msg:"68 74 2e 72 65 71 75 65 73 74 73 00 02 31 30 01 05 00 00 00 00 01 00 20 7a 6f 6f 6b 65 65 70 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106550.in  istuple:N  msg:"72 2e 6d 61 78 2e 69 6e 2e 66 6c 69 67 68 74 2e 72 65 71 75 65 73 74 73 00 02 31 30 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106560.in  istuple:N  msg:"00 2e 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 65 78 70 69 72 61 74 69 6f 6e 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106570.in  istuple:N  msg:"74 68 72 65 61 64 2e 70 6f 6f 6c 2e 73 69 7a 65 00 02 2d 31 01 05 00 00 00 00 01 00 2e 72 65 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106580.in  istuple:N  msg:"6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 65 78 70 69 72 61 74 69 6f 6e 2e 74 68 72 65 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106590.in  istuple:N  msg:"64 2e 70 6f 6f 6c 2e 73 69 7a 65 00 02 2d 31 05 03 ff ff 00 18 6c 6f 67 2e 69 6e 64 65 78 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106600.in  istuple:N  msg:"69 7a 65 2e 6d 61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37 36 30 00 05 00 00 00 00 01 00 18"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106610.in  istuple:N  msg:"6c 6f 67 2e 69 6e 64 65 78 2e 73 69 7a 65 2e 6d 61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106620.in  istuple:N  msg:"36 30 05 03 ff ff 00 18 73 73 6c 2e 6b 65 79 6d 61 6e 61 67 65 72 2e 61 6c 67 6f 72 69 74 68 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106630.in  istuple:N  msg:"00 07 53 75 6e 58 35 30 39 00 05 00 00 00 00 01 00 18 73 73 6c 2e 6b 65 79 6d 61 6e 61 67 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106640.in  istuple:N  msg:"2e 61 6c 67 6f 72 69 74 68 6d 00 07 53 75 6e 58 35 30 39 05 02 ff ff 00 21 73 61 73 6c 2e 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106650.in  istuple:N  msg:"67 69 6e 2e 63 61 6c 6c 62 61 63 6b 2e 68 61 6e 64 6c 65 72 2e 63 6c 61 73 73 ff ff 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106660.in  istuple:N  msg:"00 00 00 08 ff ff 00 17 72 65 70 6c 69 63 61 2e 66 65 74 63 68 2e 6d 61 78 2e 62 79 74 65 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106670.in  istuple:N  msg:"08 31 30 34 38 35 37 36 30 01 04 00 00 00 00 02 00 17 72 65 70 6c 69 63 61 2e 66 65 74 63 68 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106680.in  istuple:N  msg:"6d 61 78 2e 62 79 74 65 73 00 08 31 30 34 38 35 37 36 30 04 00 17 72 65 70 6c 69 63 61 2e 66 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106690.in  istuple:N  msg:"74 63 68 2e 6d 61 78 2e 62 79 74 65 73 00 07 31 30 34 38 35 37 36 05 03 ff ff 00 18 7a 6f 6f 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106700.in  istuple:N  msg:"65 65 70 65 72 2e 73 73 6c 2e 63 72 6c 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 01 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106710.in  istuple:N  msg:"00 01 00 18 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 63 72 6c 2e 65 6e 61 62 6c 65 00 05 66 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106720.in  istuple:N  msg:"6c 73 65 05 01 ff ff 00 22 73 61 73 6c 2e 73 65 72 76 65 72 2e 63 61 6c 6c 62 61 63 6b 2e 68 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106730.in  istuple:N  msg:"6e 64 6c 65 72 2e 63 6c 61 73 73 ff ff 01 05 00 00 00 00 00 08 ff ff 00 16 67 72 6f 75 70 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106740.in  istuple:N  msg:"68 61 72 65 2e 6d 61 78 2e 67 72 6f 75 70 73 00 02 31 30 01 05 00 00 00 00 01 00 16 67 72 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106750.in  istuple:N  msg:"70 2e 73 68 61 72 65 2e 6d 61 78 2e 67 72 6f 75 70 73 00 02 31 30 05 04 ff ff 00 1e 6c 6f 67 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106760.in  istuple:N  msg:"63 6c 65 61 6e 65 72 2e 64 65 64 75 70 65 2e 62 75 66 66 65 72 2e 73 69 7a 65 00 09 31 33 34 32"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106770.in  istuple:N  msg:"31 37 37 32 38 00 05 00 00 00 00 01 00 1e 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 64 65 64 75 70 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106780.in  istuple:N  msg:"2e 62 75 66 66 65 72 2e 73 69 7a 65 00 09 31 33 34 32 31 37 37 32 38 05 05 ff ff 00 1a 6c 6f 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106790.in  istuple:N  msg:"2e 63 6c 65 61 6e 65 72 2e 69 6f 2e 62 75 66 66 65 72 2e 73 69 7a 65 00 06 35 32 34 32 38 38 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106800.in  istuple:N  msg:"05 00 00 00 00 01 00 1a 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 69 6f 2e 62 75 66 66 65 72 2e 73 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106810.in  istuple:N  msg:"7a 65 00 06 35 32 34 32 38 38 05 03 ff ff 00 1e 63 72 65 61 74 65 2e 74 6f 70 69 63 2e 70 6f 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106820.in  istuple:N  msg:"69 63 79 2e 63 6c 61 73 73 2e 6e 61 6d 65 ff ff 01 05 00 00 00 00 00 08 ff ff 00 1b 73 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106830.in  istuple:N  msg:"74 72 75 73 74 73 74 6f 72 65 2e 63 65 72 74 69 66 69 63 61 74 65 73 ff ff 00 05 01 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106840.in  istuple:N  msg:"09 ff ff 00 1a 73 6f 63 6b 65 74 2e 6c 69 73 74 65 6e 2e 62 61 63 6b 6c 6f 67 2e 73 69 7a 65 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106850.in  istuple:N  msg:"02 35 30 01 05 00 00 00 00 01 00 1a 73 6f 63 6b 65 74 2e 6c 69 73 74 65 6e 2e 62 61 63 6b 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106860.in  istuple:N  msg:"67 2e 73 69 7a 65 00 02 35 30 05 03 ff ff 00 24 63 6f 6e 74 72 6f 6c 6c 65 64 2e 73 68 75 74 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106870.in  istuple:N  msg:"6f 77 6e 2e 72 65 74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 73 00 04 35 30 30 30 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106880.in  istuple:N  msg:"01 00 24 63 6f 6e 74 72 6f 6c 6c 65 64 2e 73 68 75 74 64 6f 77 6e 2e 72 65 74 72 79 2e 62 61 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106890.in  istuple:N  msg:"6b 6f 66 66 2e 6d 73 00 04 35 30 30 30 05 05 ff ff 00 1c 73 61 73 6c 2e 73 65 72 76 65 72 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106900.in  istuple:N  msg:"61 78 2e 72 65 63 65 69 76 65 2e 73 69 7a 65 00 06 35 32 34 32 38 38 01 05 00 00 00 00 01 00 1c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106910.in  istuple:N  msg:"73 61 73 6c 2e 73 65 72 76 65 72 2e 6d 61 78 2e 72 65 63 65 69 76 65 2e 73 69 7a 65 00 06 35 32"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106920.in  istuple:N  msg:"34 32 38 38 05 03 ff ff 00 12 73 65 63 75 72 69 74 79 2e 70 72 6f 76 69 64 65 72 73 ff ff 01 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106930.in  istuple:N  msg:"00 00 00 00 00 02 ff ff 00 25 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 6d 61 78 2e 73 6e 61 70 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106940.in  istuple:N  msg:"68 6f 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 01 05 00 00 00 00 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106950.in  istuple:N  msg:"25 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 6d 61 78 2e 73 6e 61 70 73 68 6f 74 2e 69 6e 74 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106960.in  istuple:N  msg:"76 61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 05 05 ff ff 00 15 63 6f 6d 70 72 65 73 73 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106970.in  istuple:N  msg:"2e 6c 7a 34 2e 6c 65 76 65 6c 00 01 39 00 05 00 00 00 00 01 00 15 63 6f 6d 70 72 65 73 73 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106980.in  istuple:N  msg:"6e 2e 6c 7a 34 2e 6c 65 76 65 6c 00 01 39 05 03 ff ff 00 0e 6c 6f 67 2e 72 6f 6c 6c 2e 68 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/106990.in  istuple:N  msg:"72 73 00 03 31 36 38 01 05 00 00 00 00 01 00 0e 6c 6f 67 2e 72 6f 6c 6c 2e 68 6f 75 72 73 00 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107000.in  istuple:N  msg:"31 36 38 05 03 ff ff 00 12 6c 6f 67 2e 63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 00 06 64 65 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107010.in  istuple:N  msg:"65 74 65 00 05 00 00 00 00 01 00 12 6c 6f 67 2e 63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 00 06"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107020.in  istuple:N  msg:"64 65 6c 65 74 65 05 07 ff ff 00 26 69 6e 69 74 69 61 6c 2e 62 72 6f 6b 65 72 2e 72 65 67 69 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107030.in  istuple:N  msg:"74 72 61 74 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 36 30 30 30 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107040.in  istuple:N  msg:"00 26 69 6e 69 74 69 61 6c 2e 62 72 6f 6b 65 72 2e 72 65 67 69 73 74 72 61 74 69 6f 6e 2e 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107050.in  istuple:N  msg:"6d 65 6f 75 74 2e 6d 73 00 05 36 30 30 30 30 05 03 ff ff 00 2d 6c 6f 67 2e 66 6c 75 73 68 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107060.in  istuple:N  msg:"74 61 72 74 2e 6f 66 66 73 65 74 2e 63 68 65 63 6b 70 6f 69 6e 74 2e 69 6e 74 65 72 76 61 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107070.in  istuple:N  msg:"6d 73 00 05 36 30 30 30 30 01 05 00 00 00 00 01 00 2d 6c 6f 67 2e 66 6c 75 73 68 2e 73 74 61 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107080.in  istuple:N  msg:"74 2e 6f 66 66 73 65 74 2e 63 68 65 63 6b 70 6f 69 6e 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107090.in  istuple:N  msg:"05 36 30 30 30 30 05 03 ff ff 00 12 6c 6f 67 2e 72 6f 6c 6c 2e 6a 69 74 74 65 72 2e 6d 73 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107100.in  istuple:N  msg:"00 05 00 00 00 00 00 05 ff ff 00 23 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107110.in  istuple:N  msg:"67 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30 01 05 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107120.in  istuple:N  msg:"01 00 23 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 73 65 67 6d 65 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107130.in  istuple:N  msg:"2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30 05 03 ff ff 00 1b 6f 66 66 73 65 74 73 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107140.in  istuple:N  msg:"6f 70 69 63 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107150.in  istuple:N  msg:"00 00 00 01 00 1b 6f 66 66 73 65 74 73 2e 74 6f 70 69 63 2e 73 65 67 6d 65 6e 74 2e 62 79 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107160.in  istuple:N  msg:"73 00 09 31 30 34 38 35 37 36 30 30 05 03 ff ff 00 1d 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107170.in  istuple:N  msg:"64 6c 65 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 03 35 30 30 01 05 00 00 00 00 01 00 1d 6d 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107180.in  istuple:N  msg:"61 64 61 74 61 2e 6d 61 78 2e 69 64 6c 65 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 03 35 30 30 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107190.in  istuple:N  msg:"03 ff ff 00 26 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e 6d 61 6e 61 67 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107200.in  istuple:N  msg:"2e 63 6c 61 73 73 2e 6e 61 6d 65 00 56 6f 72 67 2e 61 70 61 63 68 65 2e 6b 61 66 6b 61 2e 73 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107210.in  istuple:N  msg:"72 76 65 72 2e 6c 6f 67 2e 72 65 6d 6f 74 65 2e 6d 65 74 61 64 61 74 61 2e 73 74 6f 72 61 67 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107220.in  istuple:N  msg:"2e 54 6f 70 69 63 42 61 73 65 64 52 65 6d 6f 74 65 4c 6f 67 4d 65 74 61 64 61 74 61 4d 61 6e 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107230.in  istuple:N  msg:"67 65 72 01 05 00 00 00 00 01 00 26 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107240.in  istuple:N  msg:"6d 61 6e 61 67 65 72 2e 63 6c 61 73 73 2e 6e 61 6d 65 00 56 6f 72 67 2e 61 70 61 63 68 65 2e 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107250.in  istuple:N  msg:"61 66 6b 61 2e 73 65 72 76 65 72 2e 6c 6f 67 2e 72 65 6d 6f 74 65 2e 6d 65 74 61 64 61 74 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107260.in  istuple:N  msg:"73 74 6f 72 61 67 65 2e 54 6f 70 69 63 42 61 73 65 64 52 65 6d 6f 74 65 4c 6f 67 4d 65 74 61 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107270.in  istuple:N  msg:"61 74 61 4d 61 6e 61 67 65 72 05 02 ff ff 00 1f 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 74 72 79"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107280.in  istuple:N  msg:"2e 62 61 63 6b 6f 66 66 2e 6d 61 78 2e 6d 73 00 05 31 30 30 30 30 01 05 00 00 00 00 01 00 1f 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107290.in  istuple:N  msg:"61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 61 78 2e 6d 73 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107300.in  istuple:N  msg:"31 30 30 30 30 05 05 ff ff 00 23 72 65 6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 74 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107310.in  istuple:N  msg:"73 6b 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 33 30 30 30 30 01 05 00 00 00 00 01 00 23 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107320.in  istuple:N  msg:"6d 6f 74 65 2e 6c 6f 67 2e 6d 61 6e 61 67 65 72 2e 74 61 73 6b 2e 69 6e 74 65 72 76 61 6c 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107330.in  istuple:N  msg:"73 00 05 33 30 30 30 30 05 05 ff ff 00 20 67 72 6f 75 70 2e 69 6e 69 74 69 61 6c 2e 72 65 62 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107340.in  istuple:N  msg:"6c 61 6e 63 65 2e 64 65 6c 61 79 2e 6d 73 00 04 33 30 30 30 01 05 00 00 00 00 01 00 20 67 72 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107350.in  istuple:N  msg:"75 70 2e 69 6e 69 74 69 61 6c 2e 72 65 62 61 6c 61 6e 63 65 2e 64 65 6c 61 79 2e 6d 73 00 04 33"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107360.in  istuple:N  msg:"30 30 30 05 03 ff ff 00 18 6c 6f 67 2e 69 6e 64 65 78 2e 69 6e 74 65 72 76 61 6c 2e 62 79 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107370.in  istuple:N  msg:"73 00 04 34 30 39 36 00 05 00 00 00 00 01 00 18 6c 6f 67 2e 69 6e 64 65 78 2e 69 6e 74 65 72 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107380.in  istuple:N  msg:"61 6c 2e 62 79 74 65 73 00 04 34 30 39 36 05 03 ff ff 00 16 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107390.in  istuple:N  msg:"62 61 63 6b 6f 66 66 2e 6d 73 00 05 31 35 30 30 30 00 05 00 00 00 00 01 00 16 6c 6f 67 2e 63 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107400.in  istuple:N  msg:"65 61 6e 65 72 2e 62 61 63 6b 6f 66 66 2e 6d 73 00 05 31 35 30 30 30 05 05 ff ff 00 17 73 73 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107410.in  istuple:N  msg:"2e 74 72 75 73 74 73 74 6f 72 65 2e 6c 6f 63 61 74 69 6f 6e ff ff 00 05 00 00 00 00 00 02 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107420.in  istuple:N  msg:"00 19 6f 66 66 73 65 74 2e 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 62 79 74 65 73 00 04 34 30 39"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107430.in  istuple:N  msg:"36 01 05 00 00 00 00 01 00 19 6f 66 66 73 65 74 2e 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 62 79"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107440.in  istuple:N  msg:"74 65 73 00 04 34 30 39 36 05 03 ff ff 00 15 73 73 6c 2e 6b 65 79 73 74 6f 72 65 2e 70 61 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107450.in  istuple:N  msg:"77 6f 72 64 ff ff 00 05 01 00 00 00 00 09 ff ff 00 23 7a 6f 6f 6b 65 65 70 65 72 2e 6d 65 74 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107460.in  istuple:N  msg:"64 61 74 61 2e 6d 69 67 72 61 74 69 6f 6e 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107470.in  istuple:N  msg:"00 00 01 00 23 7a 6f 6f 6b 65 65 70 65 72 2e 6d 65 74 61 64 61 74 61 2e 6d 69 67 72 61 74 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107480.in  istuple:N  msg:"6e 2e 65 6e 61 62 6c 65 00 05 66 61 6c 73 65 05 01 ff ff 00 0f 66 65 74 63 68 2e 6d 61 78 2e 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107490.in  istuple:N  msg:"79 74 65 73 00 08 35 37 36 37 31 36 38 30 01 05 00 00 00 00 01 00 0f 66 65 74 63 68 2e 6d 61 78"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107500.in  istuple:N  msg:"2e 62 79 74 65 73 00 08 35 37 36 37 31 36 38 30 05 03 ff ff 00 1c 6d 65 74 61 64 61 74 61 2e 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107510.in  istuple:N  msg:"61 78 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74 65 73 00 09 31 30 34 38 35 37 36 30 30 01 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107520.in  istuple:N  msg:"00 00 00 01 00 1c 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 72 65 74 65 6e 74 69 6f 6e 2e 62 79 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107530.in  istuple:N  msg:"65 73 00 09 31 30 34 38 35 37 36 30 30 05 05 ff ff 00 10 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107540.in  istuple:N  msg:"79 70 65 00 08 70 72 6f 64 75 63 65 72 00 05 00 00 00 00 01 00 10 63 6f 6d 70 72 65 73 73 69 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107550.in  istuple:N  msg:"6e 2e 74 79 70 65 00 08 70 72 6f 64 75 63 65 72 05 02 ff ff 00 1d 73 61 73 6c 2e 6c 6f 67 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107560.in  istuple:N  msg:"2e 63 6f 6e 6e 65 63 74 2e 74 69 6d 65 6f 75 74 2e 6d 73 ff ff 01 05 00 00 00 00 00 03 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107570.in  istuple:N  msg:"20 6d 61 78 2e 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 70 65 72 2e 69 70 2e 6f 76 65 72 72 69 64 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107580.in  istuple:N  msg:"73 00 00 00 05 00 00 00 00 01 00 20 6d 61 78 2e 63 6f 6e 6e 65 63 74 69 6f 6e 73 2e 70 65 72 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107590.in  istuple:N  msg:"69 70 2e 6f 76 65 72 72 69 64 65 73 00 00 05 02 ff ff 00 28 67 72 6f 75 70 2e 63 6f 6e 73 75 6d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107600.in  istuple:N  msg:"65 72 2e 6d 61 78 2e 68 65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 31 35"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107610.in  istuple:N  msg:"30 30 30 01 05 00 00 00 00 01 00 28 67 72 6f 75 70 2e 63 6f 6e 73 75 6d 65 72 2e 6d 61 78 2e 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107620.in  istuple:N  msg:"65 61 72 74 62 65 61 74 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 05 31 35 30 30 30 05 03 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107630.in  istuple:N  msg:"20 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73 68 2e 77 69 6e 64 6f 77 2e 66 61 63 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107640.in  istuple:N  msg:"72 00 03 30 2e 38 00 05 00 00 00 00 01 00 20 73 61 73 6c 2e 6c 6f 67 69 6e 2e 72 65 66 72 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107650.in  istuple:N  msg:"68 2e 77 69 6e 64 6f 77 2e 66 61 63 74 6f 72 00 03 30 2e 38 05 06 ff ff 00 26 72 65 6d 6f 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107660.in  istuple:N  msg:"2e 6c 6f 67 2e 6d 65 74 61 64 61 74 61 2e 6d 61 6e 61 67 65 72 2e 63 6c 61 73 73 2e 70 61 74 68"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107670.in  istuple:N  msg:"ff ff 01 05 00 00 00 00 00 02 ff ff 00 23 6b 61 66 6b 61 2e 6d 65 74 72 69 63 73 2e 70 6f 6c 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107680.in  istuple:N  msg:"69 6e 67 2e 69 6e 74 65 72 76 61 6c 2e 73 65 63 73 00 02 31 30 01 05 00 00 00 00 01 00 23 6b 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107690.in  istuple:N  msg:"66 6b 61 2e 6d 65 74 72 69 63 73 2e 70 6f 6c 6c 69 6e 67 2e 69 6e 74 65 72 76 61 6c 2e 73 65 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107700.in  istuple:N  msg:"73 00 02 31 30 05 03 ff ff 00 2f 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 6d 61 78 2e 72 65 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107710.in  istuple:N  msg:"72 64 2e 62 79 74 65 73 2e 62 65 74 77 65 65 6e 2e 73 6e 61 70 73 68 6f 74 73 00 08 32 30 39 37"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107720.in  istuple:N  msg:"31 35 32 30 01 05 00 00 00 00 01 00 2f 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 6d 61 78 2e 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107730.in  istuple:N  msg:"63 6f 72 64 2e 62 79 74 65 73 2e 62 65 74 77 65 65 6e 2e 73 6e 61 70 73 68 6f 74 73 00 08 32 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107740.in  istuple:N  msg:"39 37 31 35 32 30 05 05 ff ff 00 19 6d 65 74 61 64 61 74 61 2e 6d 61 78 2e 72 65 74 65 6e 74 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107750.in  istuple:N  msg:"6f 6e 2e 6d 73 00 09 36 30 34 38 30 30 30 30 30 01 05 00 00 00 00 01 00 19 6d 65 74 61 64 61 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107760.in  istuple:N  msg:"61 2e 6d 61 78 2e 72 65 74 65 6e 74 69 6f 6e 2e 6d 73 00 09 36 30 34 38 30 30 30 30 30 05 05 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107770.in  istuple:N  msg:"ff 00 29 63 6f 6e 74 72 6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 65 6c 65 63 74 69 6f 6e 2e 62 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107780.in  istuple:N  msg:"63 6b 6f 66 66 2e 6d 61 78 2e 6d 73 00 04 31 30 30 30 01 05 00 00 00 00 01 00 29 63 6f 6e 74 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107790.in  istuple:N  msg:"6f 6c 6c 65 72 2e 71 75 6f 72 75 6d 2e 65 6c 65 63 74 69 6f 6e 2e 62 61 63 6b 6f 66 66 2e 6d 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107800.in  istuple:N  msg:"78 2e 6d 73 00 04 31 30 30 30 05 03 ff ff 00 14 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61 78 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107810.in  istuple:N  msg:"73 69 7a 65 00 03 32 30 30 01 05 00 00 00 00 01 00 14 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107820.in  istuple:N  msg:"78 2e 73 69 7a 65 00 03 32 30 30 05 04 ff ff 00 29 6d 61 78 2e 69 6e 63 72 65 6d 65 6e 74 61 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107830.in  istuple:N  msg:"2e 66 65 74 63 68 2e 73 65 73 73 69 6f 6e 2e 63 61 63 68 65 2e 73 6c 6f 74 73 00 04 31 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107840.in  istuple:N  msg:"01 05 00 00 00 00 01 00 29 6d 61 78 2e 69 6e 63 72 65 6d 65 6e 74 61 6c 2e 66 65 74 63 68 2e 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107850.in  istuple:N  msg:"65 73 73 69 6f 6e 2e 63 61 63 68 65 2e 73 6c 6f 74 73 00 04 31 30 30 30 05 03 ff ff 00 1b 64 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107860.in  istuple:N  msg:"6c 65 67 61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 6d 61 73 74 65 72 2e 6b 65 79 ff ff 01 05 01 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107870.in  istuple:N  msg:"00 00 09 ff ff 00 10 73 73 6c 2e 6b 65 79 2e 70 61 73 73 77 6f 72 64 ff ff 00 05 01 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107880.in  istuple:N  msg:"09 ff ff 00 16 72 65 73 65 72 76 65 64 2e 62 72 6f 6b 65 72 2e 6d 61 78 2e 69 64 00 04 31 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107890.in  istuple:N  msg:"30 01 05 00 00 00 00 01 00 16 72 65 73 65 72 76 65 64 2e 62 72 6f 6b 65 72 2e 6d 61 78 2e 69 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107900.in  istuple:N  msg:"00 04 31 30 30 30 05 03 ff ff 00 3a 74 72 61 6e 73 61 63 74 69 6f 6e 2e 72 65 6d 6f 76 65 2e 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107910.in  istuple:N  msg:"78 70 69 72 65 64 2e 74 72 61 6e 73 61 63 74 69 6f 6e 2e 63 6c 65 61 6e 75 70 2e 69 6e 74 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107920.in  istuple:N  msg:"76 61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 01 05 00 00 00 00 01 00 3a 74 72 61 6e 73 61 63 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107930.in  istuple:N  msg:"69 6f 6e 2e 72 65 6d 6f 76 65 2e 65 78 70 69 72 65 64 2e 74 72 61 6e 73 61 63 74 69 6f 6e 2e 63"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107940.in  istuple:N  msg:"6c 65 61 6e 75 70 2e 69 6e 74 65 72 76 61 6c 2e 6d 73 00 07 33 36 30 30 30 30 30 05 03 ff ff 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107950.in  istuple:N  msg:"21 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 64 6f 77 6e 63 6f 6e 76 65 72 73 69 6f 6e 2e 65 6e 61 62"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107960.in  istuple:N  msg:"6c 65 00 04 74 72 75 65 00 05 00 00 00 00 01 00 21 6c 6f 67 2e 6d 65 73 73 61 67 65 2e 64 6f 77"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107970.in  istuple:N  msg:"6e 63 6f 6e 76 65 72 73 69 6f 6e 2e 65 6e 61 62 6c 65 00 04 74 72 75 65 05 01 ff ff 00 0c 73 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107980.in  istuple:N  msg:"6c 2e 70 72 6f 74 6f 63 6f 6c 00 07 54 4c 53 76 31 2e 33 00 05 00 00 00 00 01 00 0c 73 73 6c 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/107990.in  istuple:N  msg:"70 72 6f 74 6f 63 6f 6c 00 07 54 4c 53 76 31 2e 33 05 02 ff ff 00 17 6d 65 74 61 64 61 74 61 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108000.in  istuple:N  msg:"6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 6d 73 00 09 36 30 34 38 30 30 30 30 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108010.in  istuple:N  msg:"00 17 6d 65 74 61 64 61 74 61 2e 6c 6f 67 2e 73 65 67 6d 65 6e 74 2e 6d 73 00 09 36 30 34 38 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108020.in  istuple:N  msg:"30 30 30 30 05 05 ff ff 00 26 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108030.in  istuple:N  msg:"6c 6f 61 64 2e 62 75 66 66 65 72 2e 73 69 7a 65 00 07 35 32 34 32 38 38 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108040.in  istuple:N  msg:"00 26 74 72 61 6e 73 61 63 74 69 6f 6e 2e 73 74 61 74 65 2e 6c 6f 67 2e 6c 6f 61 64 2e 62 75 66"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108050.in  istuple:N  msg:"66 65 72 2e 73 69 7a 65 00 07 35 32 34 32 38 38 30 05 03 ff ff 00 15 73 73 6c 2e 6b 65 79 73 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108060.in  istuple:N  msg:"6f 72 65 2e 6c 6f 63 61 74 69 6f 6e ff ff 00 05 00 00 00 00 00 02 ff ff 00 22 67 72 6f 75 70 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108070.in  istuple:N  msg:"63 6f 6f 72 64 69 6e 61 74 6f 72 2e 61 70 70 65 6e 64 2e 6c 69 6e 67 65 72 2e 6d 73 00 02 31 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108080.in  istuple:N  msg:"01 05 00 00 00 00 01 00 22 67 72 6f 75 70 2e 63 6f 6f 72 64 69 6e 61 74 6f 72 2e 61 70 70 65 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108090.in  istuple:N  msg:"64 2e 6c 69 6e 67 65 72 2e 6d 73 00 02 31 30 05 03 ff ff 00 17 73 61 73 6c 2e 65 6e 61 62 6c 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108100.in  istuple:N  msg:"64 2e 6d 65 63 68 61 6e 69 73 6d 73 00 06 47 53 53 41 50 49 00 05 00 00 00 00 01 00 17 73 61 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108110.in  istuple:N  msg:"6c 2e 65 6e 61 62 6c 65 64 2e 6d 65 63 68 61 6e 69 73 6d 73 00 06 47 53 53 41 50 49 05 07 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108120.in  istuple:N  msg:"00 22 6e 75 6d 2e 72 65 70 6c 69 63 61 2e 61 6c 74 65 72 2e 6c 6f 67 2e 64 69 72 73 2e 74 68 72"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108130.in  istuple:N  msg:"65 61 64 73 ff ff 01 05 00 00 00 00 00 03 ff ff 00 22 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108140.in  istuple:N  msg:"78 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 05 36 30 30 30 30 01 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108150.in  istuple:N  msg:"00 01 00 22 67 72 6f 75 70 2e 73 68 61 72 65 2e 6d 61 78 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108160.in  istuple:N  msg:"6f 75 74 2e 6d 73 00 05 36 30 30 30 30 05 03 ff ff 00 1b 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108170.in  istuple:N  msg:"2e 63 69 70 68 65 72 2e 73 75 69 74 65 73 ff ff 01 05 00 00 00 00 00 07 ff ff 00 1c 67 72 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108180.in  istuple:N  msg:"70 2e 6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 04 36 30 30 30 01 05"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108190.in  istuple:N  msg:"00 00 00 00 01 00 1c 67 72 6f 75 70 2e 6d 69 6e 2e 73 65 73 73 69 6f 6e 2e 74 69 6d 65 6f 75 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108200.in  istuple:N  msg:"2e 6d 73 00 04 36 30 30 30 05 03 ff ff 00 21 6c 6f 67 2e 63 6c 65 61 6e 65 72 2e 69 6f 2e 62 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108210.in  istuple:N  msg:"66 66 65 72 2e 6c 6f 61 64 2e 66 61 63 74 6f 72 00 03 30 2e 39 00 05 00 00 00 00 01 00 21 6c 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108220.in  istuple:N  msg:"67 2e 63 6c 65 61 6e 65 72 2e 69 6f 2e 62 75 66 66 65 72 2e 6c 6f 61 64 2e 66 61 63 74 6f 72 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108230.in  istuple:N  msg:"03 30 2e 39 05 06 ff ff 00 1a 74 72 61 6e 73 61 63 74 69 6f 6e 2e 6d 61 78 2e 74 69 6d 65 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108240.in  istuple:N  msg:"74 2e 6d 73 00 06 39 30 30 30 30 30 01 05 00 00 00 00 01 00 1a 74 72 61 6e 73 61 63 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108250.in  istuple:N  msg:"2e 6d 61 78 2e 74 69 6d 65 6f 75 74 2e 6d 73 00 06 39 30 30 30 30 30 05 03 ff ff 00 10 6d 65 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108260.in  istuple:N  msg:"61 64 61 74 61 2e 6c 6f 67 2e 64 69 72 ff ff 01 05 00 00 00 00 00 02 ff ff 00 0d 70 72 6f 63 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108270.in  istuple:N  msg:"73 73 2e 72 6f 6c 65 73 00 11 62 72 6f 6b 65 72 2c 63 6f 6e 74 72 6f 6c 6c 65 72 01 04 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108280.in  istuple:N  msg:"00 02 00 0d 70 72 6f 63 65 73 73 2e 72 6f 6c 65 73 00 11 62 72 6f 6b 65 72 2c 63 6f 6e 74 72 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108290.in  istuple:N  msg:"6c 6c 65 72 04 00 0d 70 72 6f 63 65 73 73 2e 72 6f 6c 65 73 00 00 05 07 ff ff 00 0e 67 72 6f 75"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108300.in  istuple:N  msg:"70 2e 6d 61 78 2e 73 69 7a 65 00 0a 32 31 34 37 34 38 33 36 34 37 01 05 00 00 00 00 01 00 0e 67"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108310.in  istuple:N  msg:"72 6f 75 70 2e 6d 61 78 2e 73 69 7a 65 00 0a 32 31 34 37 34 38 33 36 34 37 05 03 ff ff 00 33 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108320.in  istuple:N  msg:"61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74 2e 72 65"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108330.in  istuple:N  msg:"74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 61 78 2e 6d 73 00 05 31 30 30 30 30 01 05 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108340.in  istuple:N  msg:"00 33 73 61 73 6c 2e 6f 61 75 74 68 62 65 61 72 65 72 2e 6a 77 6b 73 2e 65 6e 64 70 6f 69 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108350.in  istuple:N  msg:"2e 72 65 74 72 79 2e 62 61 63 6b 6f 66 66 2e 6d 61 78 2e 6d 73 00 05 31 30 30 30 30 05 05 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108360.in  istuple:N  msg:"00 20 64 65 6c 65 67 61 74 69 6f 6e 2e 74 6f 6b 65 6e 2e 6d 61 78 2e 6c 69 66 65 74 69 6d 65 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108370.in  istuple:N  msg:"6d 73 00 09 36 30 34 38 30 30 30 30 30 01 05 00 00 00 00 01 00 20 64 65 6c 65 67 61 74 69 6f 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108380.in  istuple:N  msg:"2e 74 6f 6b 65 6e 2e 6d 61 78 2e 6c 69 66 65 74 69 6d 65 2e 6d 73 00 09 36 30 34 38 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108390.in  istuple:N  msg:"30 05 05 ff ff 00 20 6d 61 78 2e 72 65 71 75 65 73 74 2e 70 61 72 74 69 74 69 6f 6e 2e 73 69 7a"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108400.in  istuple:N  msg:"65 2e 6c 69 6d 69 74 00 04 32 30 30 30 01 05 00 00 00 00 01 00 20 6d 61 78 2e 72 65 71 75 65 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108410.in  istuple:N  msg:"74 2e 70 61 72 74 69 74 69 6f 6e 2e 73 69 7a 65 2e 6c 69 6d 69 74 00 04 32 30 30 30 05 03 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108420.in  istuple:N  msg:"00 09 62 72 6f 6b 65 72 2e 69 64 00 01 31 01 04 00 00 00 00 02 00 09 62 72 6f 6b 65 72 2e 69 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108430.in  istuple:N  msg:"00 01 31 04 00 09 62 72 6f 6b 65 72 2e 69 64 00 02 2d 31 05 03 ff ff 00 1f 6f 66 66 73 65 74 73"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108440.in  istuple:N  msg:"2e 74 6f 70 69 63 2e 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 63 6f 64 65 63 00 01 30 01 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108450.in  istuple:N  msg:"00 01 00 1f 6f 66 66 73 65 74 73 2e 74 6f 70 69 63 2e 63 6f 6d 70 72 65 73 73 69 6f 6e 2e 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108460.in  istuple:N  msg:"64 65 63 00 01 30 05 03 ff ff 00 2f 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 65 6e 64 70 6f 69"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108470.in  istuple:N  msg:"6e 74 2e 69 64 65 6e 74 69 66 69 63 61 74 69 6f 6e 2e 61 6c 67 6f 72 69 74 68 6d 00 05 48 54 54"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108480.in  istuple:N  msg:"50 53 01 05 00 00 00 00 01 00 2f 7a 6f 6f 6b 65 65 70 65 72 2e 73 73 6c 2e 65 6e 64 70 6f 69 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108490.in  istuple:N  msg:"74 2e 69 64 65 6e 74 69 66 69 63 61 74 69 6f 6e 2e 61 6c 67 6f 72 69 74 68 6d 00 05 48 54 54 50"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108500.in  istuple:N  msg:"53 05 02 ff ff 00 1c 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75 6f 74 61 2e 77 69 6e 64 6f 77 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108510.in  istuple:N  msg:"6e 75 6d 00 02 31 31 01 05 00 00 00 00 01 00 1c 72 65 70 6c 69 63 61 74 69 6f 6e 2e 71 75 6f 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108520.in  istuple:N  msg:"61 2e 77 69 6e 64 6f 77 2e 6e 75 6d 00 02 31 31 05 03 ff ff 00 14 61 64 76 65 72 74 69 73 65 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108530.in  istuple:N  msg:"2e 6c 69 73 74 65 6e 65 72 73 00 6a 50 4c 41 49 4e 54 45 58 54 3a 2f 2f 64 65 76 2e 61 6b 2d 38"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108540.in  istuple:N  msg:"2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 31 2c 53 53 4c 3a 2f 2f 64 65 76 2e 61 6b 2d 38"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108550.in  istuple:N  msg:"2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 34 2c 49 4e 54 45 52 4e 41 4c 3a 2f 2f 64 65 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108560.in  istuple:N  msg:"2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 31 30 34 00 04 00 00 00 00 01 00 14 61"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108570.in  istuple:N  msg:"64 76 65 72 74 69 73 65 64 2e 6c 69 73 74 65 6e 65 72 73 00 6a 50 4c 41 49 4e 54 45 58 54 3a 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108580.in  istuple:N  msg:"2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 31 2c 53 53 4c 3a 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108590.in  istuple:N  msg:"2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 65 78 74 3a 31 30 33 34 2c 49 4e 54 45 52"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108600.in  istuple:N  msg:"4e 41 4c 3a 2f 2f 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 69 6e 74 3a 31 31 30 34 04"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108610.in  istuple:N  msg:"02 ff ff 00 18 71 75 65 75 65 64 2e 6d 61 78 2e 72 65 71 75 65 73 74 2e 62 79 74 65 73 00 02 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108620.in  istuple:N  msg:"31 01 05 00 00 00 00 01 00 18 71 75 65 75 65 64 2e 6d 61 78 2e 72 65 71 75 65 73 74 2e 62 79 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3kui/108630.in  istuple:N  msg:"65 73 00 02 2d 31 05 05 ff ff"
EOF
atf_comp -capture kapi.DescribeConfigsRspV3kui
atf_comp -run     kapi.DescribeConfigsRspV3kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsResponse  request_api_version:3  correlation_id:1  throttle_time_ms:0  results.0:'kafka2.DescribeConfigsResult32a  error_code:0  error_message:""  resource_type:4  resource_name:1  configs.0:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.min.compaction.lag.ms  value:0  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.min.compaction.lag.ms  value:0  source:5"  config_type:5\'  configs.1:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.topic.num.partitions  value:50  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.topic.num.partitions  value:50  source:5"  config_type:3\'  configs.2:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.jwks.endpoint.refresh.ms  value:3600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.jwks.endpoint.refresh.ms  value:3600000  source:5"  config_type:5\'  configs.3:"kafka2.DescribeConfigsResourceResult32a  name:remote.log.metadata.manager.listener.name  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.4:\'kafka2.DescribeConfigsResourceResult32a  name:log.flush.interval.messages  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.flush.interval.messages  value:9223372036854775807  source:5"  config_type:5\'  configs.5:\'kafka2.DescribeConfigsResourceResult32a  name:controller.socket.timeout.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.socket.timeout.ms  value:30000  source:5"  config_type:3\'  configs.6:\'kafka2.DescribeConfigsResourceResult32a  name:principal.builder.class  value:org.apache.kafka.common.security.authenticator.DefaultKafkaPrincipalBuilder  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:principal.builder.class  value:org.apache.kafka.common.security.authenticator.DefaultKafkaPrincipalBuilder  source:5"  config_type:8\'  configs.7:"kafka2.DescribeConfigsResourceResult32a  name:log.flush.interval.ms  read_only:N  config_source:5  is_sensitive:N  config_type:5"  configs.8:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.request.timeout.ms  value:2000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.request.timeout.ms  value:2000  source:5"  config_type:3\'  configs.9:"kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.expected.audience  read_only:Y  config_source:5  is_sensitive:N  config_type:7"  configs.10:\'kafka2.DescribeConfigsResourceResult32a  name:min.insync.replicas  value:1  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:min.insync.replicas  value:1  source:5"  config_type:3\'  configs.11:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.thread.pool.size  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.thread.pool.size  value:10  source:5"  config_type:3\'  configs.12:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.max.session.timeout.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.max.session.timeout.ms  value:60000  source:5"  config_type:3\'  configs.13:\'kafka2.DescribeConfigsResourceResult32a  name:num.recovery.threads.per.data.dir  value:1  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:num.recovery.threads.per.data.dir  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:num.recovery.threads.per.data.dir  value:1  source:5"  config_type:3\'  configs.14:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.keystore.type  value:JKS  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.keystore.type  value:JKS  source:5"  config_type:2\'  configs.15:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.protocol  value:TLSv1.2  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.ssl.protocol  value:TLSv1.2  source:5"  config_type:2\'  configs.16:\'kafka2.DescribeConfigsResourceResult32a  name:super.users  read_only:Y  config_source:4  is_sensitive:Y  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:super.users  source:4"  config_type:0\'  configs.17:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.bootstrap.servers  value:""  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:\\\'kafka2.DescribeConfigsSynonym32a  name:controller.quorum.bootstrap.servers  value:""  source:5\\\'  config_type:7\'  configs.18:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.mechanism.inter.broker.protocol  value:GSSAPI  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.mechanism.inter.broker.protocol  value:GSSAPI  source:5"  config_type:2\'  configs.19:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.record.lock.duration.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.record.lock.duration.ms  value:30000  source:5"  config_type:3\'  configs.20:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.log.segment.bytes  value:1073741824  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.log.segment.bytes  value:1073741824  source:5"  config_type:3\'  configs.21:\'kafka2.DescribeConfigsResourceResult32a  name:fetch.purgatory.purge.interval.requests  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:fetch.purgatory.purge.interval.requests  value:1000  source:5"  config_type:3\'  configs.22:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.endpoint.identification.algorithm  value:https  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.endpoint.identification.algorithm  value:https  source:5"  config_type:2\'  configs.23:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.keystore.location  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.24:\'kafka2.DescribeConfigsResourceResult32a  name:replica.socket.timeout.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.socket.timeout.ms  value:30000  source:5"  config_type:3\'  configs.25:\'kafka2.DescribeConfigsResourceResult32a  name:message.max.bytes  value:10485760  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:message.max.bytes  value:10485760  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:message.max.bytes  value:1048588  source:5"  config_type:3\'  configs.26:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.fetch.max.bytes.per.second  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.fetch.max.bytes.per.second  value:9223372036854775807  source:5"  config_type:5\'  configs.27:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.session.timeout.ms  value:45000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.session.timeout.ms  value:45000  source:5"  config_type:3\'  configs.28:\'kafka2.DescribeConfigsResourceResult32a  name:max.connection.creation.rate  value:2147483647  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:max.connection.creation.rate  value:2147483647  source:5"  config_type:3\'  configs.29:\'kafka2.DescribeConfigsResourceResult32a  name:connections.max.reauth.ms  value:0  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:connections.max.reauth.ms  value:0  source:5"  config_type:5\'  configs.30:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.copy.quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.copy.quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.31:\'kafka2.DescribeConfigsResourceResult32a  name:log.flush.offset.checkpoint.interval.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.flush.offset.checkpoint.interval.ms  value:60000  source:5"  config_type:3\'  configs.32:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.clientCnxnSocket  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.33:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.client.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.ssl.client.enable  value:false  source:5"  config_type:1\'  configs.34:\'kafka2.DescribeConfigsResourceResult32a  name:quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:quota.window.num  value:11  source:5"  config_type:3\'  configs.35:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.clock.skew.seconds  value:30  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.clock.skew.seconds  value:30  source:5"  config_type:3\'  configs.36:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.min.session.timeout.ms  value:45000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.min.session.timeout.ms  value:45000  source:5"  config_type:3\'  configs.37:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.connect  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.38:\'kafka2.DescribeConfigsResourceResult32a  name:authorizer.class.name  value:org.apache.kafka.metadata.authorizer.StandardAuthorizer  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:authorizer.class.name  value:org.apache.kafka.metadata.authorizer.StandardAuthorizer  source:4"  synonyms.1:\\\'kafka2.DescribeConfigsSynonym32a  name:authorizer.class.name  value:""  source:5\\\'  config_type:2\'  configs.39:"kafka2.DescribeConfigsResourceResult32a  name:password.encoder.secret  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.40:\'kafka2.DescribeConfigsResourceResult32a  name:num.replica.fetchers  value:8  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:num.replica.fetchers  value:8  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:num.replica.fetchers  value:1  source:5"  config_type:3\'  configs.41:\'kafka2.DescribeConfigsResourceResult32a  name:alter.log.dirs.replication.quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:alter.log.dirs.replication.quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.42:"kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.jwks.endpoint.url  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.43:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.metadata.custom.metadata.max.bytes  value:128  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.metadata.custom.metadata.max.bytes  value:128  source:5"  config_type:3\'  configs.44:\'kafka2.DescribeConfigsResourceResult32a  name:auto.include.jmx.reporter  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:auto.include.jmx.reporter  value:true  source:5"  config_type:1\'  configs.45:\'kafka2.DescribeConfigsResourceResult32a  name:log.roll.jitter.hours  value:0  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.roll.jitter.hours  value:0  source:5"  config_type:3\'  configs.46:\'kafka2.DescribeConfigsResourceResult32a  name:telemetry.max.bytes  value:1048576  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:telemetry.max.bytes  value:1048576  source:5"  config_type:3\'  configs.47:"kafka2.DescribeConfigsResourceResult32a  name:password.encoder.old.secret  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.48:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.delete.retention.ms  value:86400000  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.delete.retention.ms  value:86400000  source:5"  config_type:5\'  configs.49:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.retry.backoff.ms  value:100  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.retry.backoff.ms  value:100  source:5"  config_type:5\'  configs.50:\'kafka2.DescribeConfigsResourceResult32a  name:queued.max.requests  value:500  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:queued.max.requests  value:500  source:5"  config_type:3\'  configs.51:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.threads  value:1  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.threads  value:1  source:5"  config_type:3\'  configs.52:"kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.service.name  read_only:N  config_source:5  is_sensitive:N  config_type:2"  configs.53:\'kafka2.DescribeConfigsResourceResult32a  name:socket.request.max.bytes  value:104857600  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.request.max.bytes  value:104857600  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:socket.request.max.bytes  value:104857600  source:5"  config_type:3\'  configs.54:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.max.size  value:2147483647  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.max.size  value:2147483647  source:5"  config_type:3\'  configs.55:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.assignors  value:org.apache.kafka.coordinator.group.assignor.UniformAssignor,org.apache.kafka.coordinator.group.assignor.RangeAssignor  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.assignors  value:org.apache.kafka.coordinator.group.assignor.UniformAssignor,org.apache.kafka.coordinator.group.assignor.RangeAssignor  source:5"  config_type:7\'  configs.56:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.storage.system.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.storage.system.enable  value:false  source:5"  config_type:1\'  configs.57:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.timestamp.type  value:CreateTime  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.timestamp.type  value:CreateTime  source:5"  config_type:2\'  configs.58:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.keystore.type  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.59:\'kafka2.DescribeConfigsResourceResult32a  name:connections.max.idle.ms  value:600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:connections.max.idle.ms  value:600000  source:5"  config_type:5\'  configs.60:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.set.acl  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.set.acl  value:false  source:5"  config_type:1\'  configs.61:\'kafka2.DescribeConfigsResourceResult32a  name:delegation.token.expiry.time.ms  value:86400000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:delegation.token.expiry.time.ms  value:86400000  source:5"  config_type:5\'  configs.62:\'kafka2.DescribeConfigsResourceResult32a  name:max.connections  value:2147483647  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:max.connections  value:2147483647  source:5"  config_type:3\'  configs.63:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.state.log.num.partitions  value:50  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.num.partitions  value:50  source:5"  config_type:3\'  configs.64:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.election.timeout.ms  value:20000  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.election.timeout.ms  value:20000  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.election.timeout.ms  value:1000  source:5"  config_type:3\'  configs.65:\'kafka2.DescribeConfigsResourceResult32a  name:listener.security.protocol.map  value:CONTROLLER:PLAINTEXT,INTERNAL:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:listener.security.protocol.map  value:CONTROLLER:PLAINTEXT,INTERNAL:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:listener.security.protocol.map  value:SASL_SSL:SASL_SSL,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT  source:5"  config_type:2\'  configs.66:\'kafka2.DescribeConfigsResourceResult32a  name:log.retention.hours  value:168  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.retention.hours  value:168  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:log.retention.hours  value:168  source:5"  config_type:3\'  configs.67:"kafka2.DescribeConfigsResourceResult32a  name:client.quota.callback.class  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.68:\'kafka2.DescribeConfigsResourceResult32a  name:audit.log.enabled  read_only:Y  config_source:4  is_sensitive:Y  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:audit.log.enabled  source:4"  config_type:0\'  configs.69:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.storage.manager.impl.prefix  value:rsm.config.  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.storage.manager.impl.prefix  value:rsm.config.  source:5"  config_type:2\'  configs.70:"kafka2.DescribeConfigsResourceResult32a  name:ssl.provider  read_only:N  config_source:5  is_sensitive:N  config_type:2"  configs.71:\'kafka2.DescribeConfigsResourceResult32a  name:delete.records.purgatory.purge.interval.requests  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:delete.records.purgatory.purge.interval.requests  value:1  source:5"  config_type:3\'  configs.72:\'kafka2.DescribeConfigsResourceResult32a  name:producer.id.expiration.ms  value:86400000  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:producer.id.expiration.ms  value:86400000  source:5"  config_type:3\'  configs.73:"kafka2.DescribeConfigsResourceResult32a  name:log.roll.ms  read_only:N  config_source:5  is_sensitive:N  config_type:5"  configs.74:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.cipher.suites  value:""  read_only:N  config_source:5  is_sensitive:N  synonyms.0:\\\'kafka2.DescribeConfigsSynonym32a  name:ssl.cipher.suites  value:""  source:5\\\'  config_type:7\'  configs.75:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.retry.backoff.ms  value:20  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.retry.backoff.ms  value:20  source:5"  config_type:3\'  configs.76:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.copy.max.bytes.per.second  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.copy.max.bytes.per.second  value:9223372036854775807  source:5"  config_type:5\'  configs.77:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.keystore.password  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.78:\'kafka2.DescribeConfigsResourceResult32a  name:broker.session.timeout.ms  value:9000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:broker.session.timeout.ms  value:9000  source:5"  config_type:3\'  configs.79:\'kafka2.DescribeConfigsResourceResult32a  name:security.inter.broker.protocol  value:PLAINTEXT  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:security.inter.broker.protocol  value:PLAINTEXT  source:5"  config_type:2\'  configs.80:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.heartbeat.interval.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.heartbeat.interval.ms  value:5000  source:5"  config_type:3\'  configs.81:"kafka2.DescribeConfigsResourceResult32a  name:delegation.token.secret.key  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.82:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.fetch.quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.fetch.quota.window.num  value:11  source:5"  config_type:3\'  configs.83:\'kafka2.DescribeConfigsResourceResult32a  name:remote.fetch.max.wait.ms  value:500  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.fetch.max.wait.ms  value:500  source:5"  config_type:3\'  configs.84:\'kafka2.DescribeConfigsResourceResult32a  name:node.id  value:1  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:node.id  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:node.id  value:-1  source:5"  config_type:3\'  configs.85:\'kafka2.DescribeConfigsResourceResult32a  name:replica.high.watermark.checkpoint.interval.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.high.watermark.checkpoint.interval.ms  value:5000  source:5"  config_type:5\'  configs.86:\'kafka2.DescribeConfigsResourceResult32a  name:replication.quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replication.quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.87:\'kafka2.DescribeConfigsResourceResult32a  name:eligible.leader.replicas.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:eligible.leader.replicas.enable  value:false  source:5"  config_type:1\'  configs.88:\'kafka2.DescribeConfigsResourceResult32a  name:log.local.retention.ms  value:-2  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.local.retention.ms  value:-2  source:5"  config_type:5\'  configs.89:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.reader.threads  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.reader.threads  value:10  source:5"  config_type:3\'  configs.90:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.ticket.renew.window.factor  value:0.8  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.kerberos.ticket.renew.window.factor  value:0.8  source:5"  config_type:6\'  configs.91:\'kafka2.DescribeConfigsResourceResult32a  name:group.coordinator.threads  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.coordinator.threads  value:1  source:5"  config_type:3\'  configs.92:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.connection.timeout.ms  read_only:Y  config_source:5  is_sensitive:N  config_type:3"  configs.93:\'kafka2.DescribeConfigsResourceResult32a  name:metrics.recording.level  value:INFO  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metrics.recording.level  value:INFO  source:5"  config_type:2\'  configs.94:\'kafka2.DescribeConfigsResourceResult32a  name:password.encoder.cipher.algorithm  value:AES/CBC/PKCS5Padding  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:password.encoder.cipher.algorithm  value:AES/CBC/PKCS5Padding  source:5"  config_type:2\'  configs.95:\'kafka2.DescribeConfigsResourceResult32a  name:log.dir.failure.timeout.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.dir.failure.timeout.ms  value:30000  source:5"  config_type:5\'  configs.96:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.partition.verification.enable  value:true  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.partition.verification.enable  value:true  source:5"  config_type:1\'  configs.97:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.min.heartbeat.interval.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.min.heartbeat.interval.ms  value:5000  source:5"  config_type:3\'  configs.98:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.principal.mapping.rules  value:DEFAULT  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.principal.mapping.rules  value:DEFAULT  source:5"  config_type:2\'  configs.99:"kafka2.DescribeConfigsResourceResult32a  name:replica.selector.class  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.100:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.fetch.quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.fetch.quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.101:\'kafka2.DescribeConfigsResourceResult32a  name:max.connections.per.ip  value:2147483647  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:max.connections.per.ip  value:2147483647  source:5"  config_type:3\'  configs.102:\'kafka2.DescribeConfigsResourceResult32a  name:background.threads  value:10  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:background.threads  value:10  source:5"  config_type:3\'  configs.103:\'kafka2.DescribeConfigsResourceResult32a  name:request.timeout.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:request.timeout.ms  value:30000  source:5"  config_type:3\'  configs.104:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.format.version  value:3.0-IV1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.format.version  value:3.0-IV1  source:5"  config_type:2\'  configs.105:"kafka2.DescribeConfigsResourceResult32a  name:sasl.login.class  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.106:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.index.file.cache.total.size.bytes  value:1073741824  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.index.file.cache.total.size.bytes  value:1073741824  source:5"  config_type:5\'  configs.107:\'kafka2.DescribeConfigsResourceResult32a  name:log.dir  value:/tmp/kafka-logs  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.dir  value:/tmp/kafka-logs  source:5"  config_type:2\'  configs.108:\'kafka2.DescribeConfigsResourceResult32a  name:log.segment.bytes  value:1073741824  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.segment.bytes  value:1073741824  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:log.segment.bytes  value:1073741824  source:5"  config_type:3\'  configs.109:\'kafka2.DescribeConfigsResourceResult32a  name:replica.fetch.response.max.bytes  value:10485760  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.response.max.bytes  value:10485760  source:5"  config_type:3\'  configs.110:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.heartbeat.interval.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.heartbeat.interval.ms  value:5000  source:5"  config_type:3\'  configs.111:\'kafka2.DescribeConfigsResourceResult32a  name:group.max.session.timeout.ms  value:1800000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.max.session.timeout.ms  value:1800000  source:5"  config_type:3\'  configs.112:\'kafka2.DescribeConfigsResourceResult32a  name:controller.listener.names  value:CONTROLLER  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.listener.names  value:CONTROLLER  source:4"  config_type:2\'  configs.113:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.timestamp.after.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.timestamp.after.max.ms  value:9223372036854775807  source:5"  config_type:5\'  configs.114:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.append.linger.ms  value:25  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.append.linger.ms  value:25  source:5"  config_type:3\'  configs.115:\'kafka2.DescribeConfigsResourceResult32a  name:log.segment.delete.delay.ms  value:60000  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.segment.delete.delay.ms  value:60000  source:5"  config_type:5\'  configs.116:"kafka2.DescribeConfigsResourceResult32a  name:log.retention.minutes  read_only:Y  config_source:5  is_sensitive:N  config_type:3"  configs.117:\'kafka2.DescribeConfigsResourceResult32a  name:log.dirs  value:/mnt/data-1/dev.ak-8,/mnt/data-2/dev.ak-8,/mnt/data-3/dev.ak-8,/mnt/data-4/dev.ak-8  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.dirs  value:/mnt/data-1/dev.ak-8,/mnt/data-2/dev.ak-8,/mnt/data-3/dev.ak-8,/mnt/data-4/dev.ak-8  source:4"  config_type:2\'  configs.118:\'kafka2.DescribeConfigsResourceResult32a  name:controlled.shutdown.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controlled.shutdown.enable  value:true  source:5"  config_type:1\'  configs.119:"kafka2.DescribeConfigsResourceResult32a  name:early.start.listeners  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.120:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.timestamp.before.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.timestamp.before.max.ms  value:9223372036854775807  source:5"  config_type:5\'  configs.121:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.copier.thread.pool.size  value:-1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.copier.thread.pool.size  value:-1  source:5"  config_type:3\'  configs.122:\'kafka2.DescribeConfigsResourceResult32a  name:socket.connection.setup.timeout.max.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.connection.setup.timeout.max.ms  value:30000  source:5"  config_type:5\'  configs.123:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.timestamp.difference.max.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.timestamp.difference.max.ms  value:9223372036854775807  source:5"  config_type:5\'  configs.124:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.scope.claim.name  value:scope  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.scope.claim.name  value:scope  source:5"  config_type:2\'  configs.125:\'kafka2.DescribeConfigsResourceResult32a  name:password.encoder.key.length  value:128  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:password.encoder.key.length  value:128  source:5"  config_type:3\'  configs.126:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.refresh.min.period.seconds  value:60  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.refresh.min.period.seconds  value:60  source:5"  config_type:4\'  configs.127:"kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.expected.issuer  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.128:"kafka2.DescribeConfigsResourceResult32a  name:sasl.login.read.timeout.ms  read_only:Y  config_source:5  is_sensitive:N  config_type:3"  configs.129:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.abort.timed.out.transaction.cleanup.interval.ms  value:10000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.abort.timed.out.transaction.cleanup.interval.ms  value:10000  source:5"  config_type:3\'  configs.130:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.kinit.cmd  value:/usr/bin/kinit  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.kerberos.kinit.cmd  value:/usr/bin/kinit  source:5"  config_type:2\'  configs.131:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.io.max.bytes.per.second  value:1.7976931348623157E308  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.io.max.bytes.per.second  value:1.7976931348623157E308  source:5"  config_type:6\'  configs.132:\'kafka2.DescribeConfigsResourceResult32a  name:auto.leader.rebalance.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:auto.leader.rebalance.enable  value:true  source:5"  config_type:1\'  configs.133:\'kafka2.DescribeConfigsResourceResult32a  name:leader.imbalance.check.interval.seconds  value:300  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:leader.imbalance.check.interval.seconds  value:300  source:5"  config_type:5\'  configs.134:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.min.cleanable.ratio  value:0.5  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.min.cleanable.ratio  value:0.5  source:5"  config_type:6\'  configs.135:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.min.record.lock.duration.ms  value:15000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.min.record.lock.duration.ms  value:15000  source:5"  config_type:3\'  configs.136:\'kafka2.DescribeConfigsResourceResult32a  name:replica.lag.time.max.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.lag.time.max.ms  value:30000  source:5"  config_type:5\'  configs.137:\'kafka2.DescribeConfigsResourceResult32a  name:num.network.threads  value:8  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:num.network.threads  value:8  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:num.network.threads  value:3  source:5"  config_type:3\'  configs.138:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.min.session.timeout.ms  value:45000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.min.session.timeout.ms  value:45000  source:5"  config_type:3\'  configs.139:"kafka2.DescribeConfigsResourceResult32a  name:ssl.keystore.key  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.140:"kafka2.DescribeConfigsResourceResult32a  name:sasl.client.callback.handler.class  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.141:\'kafka2.DescribeConfigsResourceResult32a  name:compression.gzip.level  value:-1  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:compression.gzip.level  value:-1  source:5"  config_type:3\'  configs.142:\'kafka2.DescribeConfigsResourceResult32a  name:metrics.num.samples  value:2  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metrics.num.samples  value:2  source:5"  config_type:3\'  configs.143:\'kafka2.DescribeConfigsResourceResult32a  name:socket.send.buffer.bytes  value:102400  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.send.buffer.bytes  value:102400  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:socket.send.buffer.bytes  value:102400  source:5"  config_type:3\'  configs.144:\'kafka2.DescribeConfigsResourceResult32a  name:group.coordinator.rebalance.protocols  value:classic  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.coordinator.rebalance.protocols  value:classic  source:5"  config_type:7\'  configs.145:"kafka2.DescribeConfigsResourceResult32a  name:password.encoder.keyfactory.algorithm  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.146:"kafka2.DescribeConfigsResourceResult32a  name:remote.log.storage.manager.class.name  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.147:\'kafka2.DescribeConfigsResourceResult32a  name:socket.receive.buffer.bytes  value:102400  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.receive.buffer.bytes  value:102400  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:socket.receive.buffer.bytes  value:102400  source:5"  config_type:3\'  configs.148:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.sub.claim.name  value:sub  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.sub.claim.name  value:sub  source:5"  config_type:2\'  configs.149:\'kafka2.DescribeConfigsResourceResult32a  name:replica.fetch.min.bytes  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.min.bytes  value:1  source:5"  config_type:3\'  configs.150:"kafka2.DescribeConfigsResourceResult32a  name:broker.rack  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.151:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.truststore.password  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.152:\'kafka2.DescribeConfigsResourceResult32a  name:unclean.leader.election.enable  value:false  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:unclean.leader.election.enable  value:false  source:5"  config_type:1\'  configs.153:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.jwks.endpoint.retry.backoff.ms  value:100  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.jwks.endpoint.retry.backoff.ms  value:100  source:5"  config_type:5\'  configs.154:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.retention.check.interval.ms  value:600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.retention.check.interval.ms  value:600000  source:5"  config_type:5\'  configs.155:\'kafka2.DescribeConfigsResourceResult32a  name:producer.purgatory.purge.interval.requests  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:producer.purgatory.purge.interval.requests  value:1000  source:5"  config_type:3\'  configs.156:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.voters  value:1@dev.ak-8.kafka-1.int:1049,2@dev.ak-8.kafka-2.int:1051,3@dev.ak-8.kafka-3.int:1053  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.voters  value:1@dev.ak-8.kafka-1.int:1049,2@dev.ak-8.kafka-2.int:1051,3@dev.ak-8.kafka-3.int:1053  source:4"  synonyms.1:\\\'kafka2.DescribeConfigsSynonym32a  name:controller.quorum.voters  value:""  source:5\\\'  config_type:7\'  configs.157:\'kafka2.DescribeConfigsResourceResult32a  name:metrics.sample.window.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metrics.sample.window.ms  value:30000  source:5"  config_type:5\'  configs.158:\'kafka2.DescribeConfigsResourceResult32a  name:log.retention.check.interval.ms  value:300000  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.retention.check.interval.ms  value:300000  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:log.retention.check.interval.ms  value:300000  source:5"  config_type:5\'  configs.159:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.session.timeout.ms  value:45000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.session.timeout.ms  value:45000  source:5"  config_type:3\'  configs.160:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.refresh.window.jitter  value:0.05  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.refresh.window.jitter  value:0.05  source:5"  config_type:6\'  configs.161:\'kafka2.DescribeConfigsResourceResult32a  name:leader.imbalance.per.broker.percentage  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:leader.imbalance.per.broker.percentage  value:10  source:5"  config_type:3\'  configs.162:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quota.window.num  value:11  source:5"  config_type:3\'  configs.163:\'kafka2.DescribeConfigsResourceResult32a  name:metric.reporters  value:""  read_only:N  config_source:5  is_sensitive:N  synonyms.0:\\\'kafka2.DescribeConfigsSynonym32a  name:metric.reporters  value:""  source:5\\\'  config_type:7\'  configs.164:"kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.token.endpoint.url  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.165:\'kafka2.DescribeConfigsResourceResult32a  name:auto.create.topics.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:auto.create.topics.enable  value:true  source:5"  config_type:1\'  configs.166:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.partition.max.record.locks  value:200  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.partition.max.record.locks  value:200  source:5"  config_type:3\'  configs.167:"kafka2.DescribeConfigsResourceResult32a  name:ssl.engine.factory.class  read_only:N  config_source:5  is_sensitive:N  config_type:8"  configs.168:\'kafka2.DescribeConfigsResourceResult32a  name:replica.socket.receive.buffer.bytes  value:65536  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.socket.receive.buffer.bytes  value:65536  source:5"  config_type:3\'  configs.169:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.truststore.location  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.170:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.allow.dn.changes  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.allow.dn.changes  value:false  source:5"  config_type:1\'  configs.171:\'kafka2.DescribeConfigsResourceResult32a  name:replica.fetch.wait.max.ms  value:500  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.wait.max.ms  value:500  source:5"  config_type:3\'  configs.172:\'kafka2.DescribeConfigsResourceResult32a  name:password.encoder.iterations  value:4096  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:password.encoder.iterations  value:4096  source:5"  config_type:3\'  configs.173:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.min.heartbeat.interval.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.min.heartbeat.interval.ms  value:5000  source:5"  config_type:3\'  configs.174:\'kafka2.DescribeConfigsResourceResult32a  name:default.replication.factor  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:default.replication.factor  value:1  source:5"  config_type:3\'  configs.175:"kafka2.DescribeConfigsResourceResult32a  name:ssl.truststore.password  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.176:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.principal.to.local.rules  value:DEFAULT  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.kerberos.principal.to.local.rules  value:DEFAULT  source:5"  config_type:7\'  configs.177:\'kafka2.DescribeConfigsResourceResult32a  name:log.preallocate  value:false  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.preallocate  value:false  source:5"  config_type:1\'  configs.178:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.reader.max.pending.tasks  value:100  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.reader.max.pending.tasks  value:100  source:5"  config_type:3\'  configs.179:\'kafka2.DescribeConfigsResourceResult32a  name:transactional.id.expiration.ms  value:604800000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transactional.id.expiration.ms  value:604800000  source:5"  config_type:3\'  configs.180:"kafka2.DescribeConfigsResourceResult32a  name:control.plane.listener.name  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.181:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.state.log.replication.factor  value:1  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.replication.factor  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.replication.factor  value:3  source:5"  config_type:4\'  configs.182:\'kafka2.DescribeConfigsResourceResult32a  name:num.io.threads  value:8  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:num.io.threads  value:8  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:num.io.threads  value:8  source:5"  config_type:3\'  configs.183:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.refresh.buffer.seconds  value:300  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.refresh.buffer.seconds  value:300  source:5"  config_type:4\'  configs.184:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.max.heartbeat.interval.ms  value:15000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.max.heartbeat.interval.ms  value:15000  source:5"  config_type:3\'  configs.185:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.commit.required.acks  value:-1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.commit.required.acks  value:-1  source:5"  config_type:4\'  configs.186:\'kafka2.DescribeConfigsResourceResult32a  name:connection.failed.authentication.delay.ms  value:100  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:connection.failed.authentication.delay.ms  value:100  source:5"  config_type:3\'  configs.187:\'kafka2.DescribeConfigsResourceResult32a  name:delete.topic.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:delete.topic.enable  value:true  source:5"  config_type:1\'  configs.188:\'kafka2.DescribeConfigsResourceResult32a  name:quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.189:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.truststore.type  value:JKS  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.truststore.type  value:JKS  source:5"  config_type:2\'  configs.190:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.commit.timeout.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.commit.timeout.ms  value:5000  source:5"  config_type:3\'  configs.191:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.ocsp.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.ssl.ocsp.enable  value:false  source:5"  config_type:1\'  configs.192:\'kafka2.DescribeConfigsResourceResult32a  name:broker.heartbeat.interval.ms  value:2000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:broker.heartbeat.interval.ms  value:2000  source:5"  config_type:3\'  configs.193:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.max.record.lock.duration.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.max.record.lock.duration.ms  value:60000  source:5"  config_type:3\'  configs.194:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.mechanism.controller.protocol  value:GSSAPI  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.mechanism.controller.protocol  value:GSSAPI  source:5"  config_type:2\'  configs.195:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.max.compaction.lag.ms  value:9223372036854775807  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.max.compaction.lag.ms  value:9223372036854775807  source:5"  config_type:5\'  configs.196:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.enabled.protocols  read_only:Y  config_source:5  is_sensitive:N  config_type:7"  configs.197:\'kafka2.DescribeConfigsResourceResult32a  name:allow.everyone.if.no.acl.found  read_only:Y  config_source:4  is_sensitive:Y  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:allow.everyone.if.no.acl.found  source:4"  config_type:0\'  configs.198:"kafka2.DescribeConfigsResourceResult32a  name:remote.log.storage.manager.class.path  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.199:"kafka2.DescribeConfigsResourceResult32a  name:log.retention.ms  read_only:N  config_source:5  is_sensitive:N  config_type:5"  configs.200:\'kafka2.DescribeConfigsResourceResult32a  name:alter.log.dirs.replication.quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:alter.log.dirs.replication.quota.window.num  value:11  source:5"  config_type:3\'  configs.201:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.enable  value:true  source:5"  config_type:1\'  configs.202:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.fetch.timeout.ms  value:10000  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.fetch.timeout.ms  value:10000  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.fetch.timeout.ms  value:2000  source:5"  config_type:3\'  configs.203:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.load.buffer.size  value:5242880  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.load.buffer.size  value:5242880  source:5"  config_type:3\'  configs.204:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.client.auth  value:none  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.client.auth  value:none  source:5"  config_type:2\'  configs.205:\'kafka2.DescribeConfigsResourceResult32a  name:controlled.shutdown.max.retries  value:3  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controlled.shutdown.max.retries  value:3  source:5"  config_type:3\'  configs.206:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.topic.replication.factor  value:1  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.topic.replication.factor  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:offsets.topic.replication.factor  value:3  source:5"  config_type:4\'  configs.207:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.truststore.type  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.208:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.state.log.min.isr  value:1  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.min.isr  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.min.isr  value:2  source:5"  config_type:3\'  configs.209:"kafka2.DescribeConfigsResourceResult32a  name:ssl.secure.random.implementation  read_only:N  config_source:5  is_sensitive:N  config_type:2"  configs.210:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.ticket.renew.jitter  value:0.05  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.kerberos.ticket.renew.jitter  value:0.05  source:5"  config_type:6\'  configs.211:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.trustmanager.algorithm  value:PKIX  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.trustmanager.algorithm  value:PKIX  source:5"  config_type:2\'  configs.212:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.session.timeout.ms  value:18000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.session.timeout.ms  value:18000  source:5"  config_type:3\'  configs.213:\'kafka2.DescribeConfigsResourceResult32a  name:log.local.retention.bytes  value:-2  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.local.retention.bytes  value:-2  source:5"  config_type:5\'  configs.214:\'kafka2.DescribeConfigsResourceResult32a  name:log.retention.bytes  value:-1  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.retention.bytes  value:-1  source:5"  config_type:5\'  configs.215:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quota.window.size.seconds  value:1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quota.window.size.seconds  value:1  source:5"  config_type:3\'  configs.216:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.metadata.manager.impl.prefix  value:rlmm.config.  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.metadata.manager.impl.prefix  value:rlmm.config.  source:5"  config_type:2\'  configs.217:"kafka2.DescribeConfigsResourceResult32a  name:sasl.jaas.config  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.218:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.kerberos.min.time.before.relogin  value:60000  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.kerberos.min.time.before.relogin  value:60000  source:5"  config_type:5\'  configs.219:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.retention.minutes  value:10080  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.retention.minutes  value:10080  source:5"  config_type:3\'  configs.220:\'kafka2.DescribeConfigsResourceResult32a  name:replica.fetch.backoff.ms  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.backoff.ms  value:1000  source:5"  config_type:3\'  configs.221:\'kafka2.DescribeConfigsResourceResult32a  name:inter.broker.protocol.version  value:3.9-IV0  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:inter.broker.protocol.version  value:3.9-IV0  source:5"  config_type:2\'  configs.222:\'kafka2.DescribeConfigsResourceResult32a  name:kafka.metrics.reporters  value:""  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:\\\'kafka2.DescribeConfigsSynonym32a  name:kafka.metrics.reporters  value:""  source:5\\\'  config_type:7\'  configs.223:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.delivery.count.limit  value:5  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.delivery.count.limit  value:5  source:5"  config_type:3\'  configs.224:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.allow.san.changes  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.allow.san.changes  value:false  source:5"  config_type:1\'  configs.225:\'kafka2.DescribeConfigsResourceResult32a  name:compression.zstd.level  value:3  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:compression.zstd.level  value:3  source:5"  config_type:3\'  configs.226:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.copy.quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.copy.quota.window.num  value:11  source:5"  config_type:3\'  configs.227:\'kafka2.DescribeConfigsResourceResult32a  name:num.partitions  value:3  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:num.partitions  value:3  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:num.partitions  value:1  source:5"  config_type:3\'  configs.228:"kafka2.DescribeConfigsResourceResult32a  name:ssl.keystore.certificate.chain  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.229:\'kafka2.DescribeConfigsResourceResult32a  name:socket.connection.setup.timeout.ms  value:10000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.connection.setup.timeout.ms  value:10000  source:5"  config_type:5\'  configs.230:\'kafka2.DescribeConfigsResourceResult32a  name:broker.id.generation.enable  value:true  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:broker.id.generation.enable  value:true  source:5"  config_type:1\'  configs.231:\'kafka2.DescribeConfigsResourceResult32a  name:listeners  value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104,CONTROLLER://dev.ak-8.kafka-1.int:1049  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:listeners  value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104,CONTROLLER://dev.ak-8.kafka-1.int:1049  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:listeners  value:PLAINTEXT://:9092  source:5"  config_type:2\'  configs.232:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.enabled.protocols  value:TLSv1.2,TLSv1.3  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.enabled.protocols  value:TLSv1.2,TLSv1.3  source:5"  config_type:7\'  configs.233:\'kafka2.DescribeConfigsResourceResult32a  name:inter.broker.listener.name  value:INTERNAL  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:inter.broker.listener.name  value:INTERNAL  source:4"  config_type:2\'  configs.234:"kafka2.DescribeConfigsResourceResult32a  name:alter.config.policy.class.name  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.235:\'kafka2.DescribeConfigsResourceResult32a  name:delegation.token.expiry.check.interval.ms  value:3600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:delegation.token.expiry.check.interval.ms  value:3600000  source:5"  config_type:5\'  configs.236:\'kafka2.DescribeConfigsResourceResult32a  name:log.flush.scheduler.interval.ms  value:9223372036854775807  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.flush.scheduler.interval.ms  value:9223372036854775807  source:5"  config_type:5\'  configs.237:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.max.in.flight.requests  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.max.in.flight.requests  value:10  source:5"  config_type:3\'  configs.238:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.expiration.thread.pool.size  value:-1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.expiration.thread.pool.size  value:-1  source:5"  config_type:3\'  configs.239:\'kafka2.DescribeConfigsResourceResult32a  name:log.index.size.max.bytes  value:10485760  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.index.size.max.bytes  value:10485760  source:5"  config_type:3\'  configs.240:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.keymanager.algorithm  value:SunX509  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.keymanager.algorithm  value:SunX509  source:5"  config_type:2\'  configs.241:"kafka2.DescribeConfigsResourceResult32a  name:sasl.login.callback.handler.class  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.242:\'kafka2.DescribeConfigsResourceResult32a  name:replica.fetch.max.bytes  value:10485760  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.max.bytes  value:10485760  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:replica.fetch.max.bytes  value:1048576  source:5"  config_type:3\'  configs.243:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.crl.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.ssl.crl.enable  value:false  source:5"  config_type:1\'  configs.244:"kafka2.DescribeConfigsResourceResult32a  name:sasl.server.callback.handler.class  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.245:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.max.groups  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.max.groups  value:10  source:5"  config_type:4\'  configs.246:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.dedupe.buffer.size  value:134217728  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.dedupe.buffer.size  value:134217728  source:5"  config_type:5\'  configs.247:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.io.buffer.size  value:524288  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.io.buffer.size  value:524288  source:5"  config_type:3\'  configs.248:"kafka2.DescribeConfigsResourceResult32a  name:create.topic.policy.class.name  read_only:Y  config_source:5  is_sensitive:N  config_type:8"  configs.249:"kafka2.DescribeConfigsResourceResult32a  name:ssl.truststore.certificates  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.250:\'kafka2.DescribeConfigsResourceResult32a  name:socket.listen.backlog.size  value:50  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:socket.listen.backlog.size  value:50  source:5"  config_type:3\'  configs.251:\'kafka2.DescribeConfigsResourceResult32a  name:controlled.shutdown.retry.backoff.ms  value:5000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controlled.shutdown.retry.backoff.ms  value:5000  source:5"  config_type:5\'  configs.252:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.server.max.receive.size  value:524288  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.server.max.receive.size  value:524288  source:5"  config_type:3\'  configs.253:"kafka2.DescribeConfigsResourceResult32a  name:security.providers  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.254:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.log.max.snapshot.interval.ms  value:3600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.log.max.snapshot.interval.ms  value:3600000  source:5"  config_type:5\'  configs.255:\'kafka2.DescribeConfigsResourceResult32a  name:compression.lz4.level  value:9  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:compression.lz4.level  value:9  source:5"  config_type:3\'  configs.256:\'kafka2.DescribeConfigsResourceResult32a  name:log.roll.hours  value:168  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.roll.hours  value:168  source:5"  config_type:3\'  configs.257:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleanup.policy  value:delete  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleanup.policy  value:delete  source:5"  config_type:7\'  configs.258:\'kafka2.DescribeConfigsResourceResult32a  name:initial.broker.registration.timeout.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:initial.broker.registration.timeout.ms  value:60000  source:5"  config_type:3\'  configs.259:\'kafka2.DescribeConfigsResourceResult32a  name:log.flush.start.offset.checkpoint.interval.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.flush.start.offset.checkpoint.interval.ms  value:60000  source:5"  config_type:3\'  configs.260:"kafka2.DescribeConfigsResourceResult32a  name:log.roll.jitter.ms  read_only:N  config_source:5  is_sensitive:N  config_type:5"  configs.261:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.state.log.segment.bytes  value:104857600  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.segment.bytes  value:104857600  source:5"  config_type:3\'  configs.262:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.topic.segment.bytes  value:104857600  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.topic.segment.bytes  value:104857600  source:5"  config_type:3\'  configs.263:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.max.idle.interval.ms  value:500  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.max.idle.interval.ms  value:500  source:5"  config_type:3\'  configs.264:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.metadata.manager.class.name  value:org.apache.kafka.server.log.remote.metadata.storage.TopicBasedRemoteLogMetadataManager  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.metadata.manager.class.name  value:org.apache.kafka.server.log.remote.metadata.storage.TopicBasedRemoteLogMetadataManager  source:5"  config_type:2\'  configs.265:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.retry.backoff.max.ms  value:10000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.retry.backoff.max.ms  value:10000  source:5"  config_type:5\'  configs.266:\'kafka2.DescribeConfigsResourceResult32a  name:remote.log.manager.task.interval.ms  value:30000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:remote.log.manager.task.interval.ms  value:30000  source:5"  config_type:5\'  configs.267:\'kafka2.DescribeConfigsResourceResult32a  name:group.initial.rebalance.delay.ms  value:3000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.initial.rebalance.delay.ms  value:3000  source:5"  config_type:3\'  configs.268:\'kafka2.DescribeConfigsResourceResult32a  name:log.index.interval.bytes  value:4096  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.index.interval.bytes  value:4096  source:5"  config_type:3\'  configs.269:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.backoff.ms  value:15000  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.backoff.ms  value:15000  source:5"  config_type:5\'  configs.270:"kafka2.DescribeConfigsResourceResult32a  name:ssl.truststore.location  read_only:N  config_source:5  is_sensitive:N  config_type:2"  configs.271:\'kafka2.DescribeConfigsResourceResult32a  name:offset.metadata.max.bytes  value:4096  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offset.metadata.max.bytes  value:4096  source:5"  config_type:3\'  configs.272:"kafka2.DescribeConfigsResourceResult32a  name:ssl.keystore.password  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.273:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.metadata.migration.enable  value:false  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.metadata.migration.enable  value:false  source:5"  config_type:1\'  configs.274:\'kafka2.DescribeConfigsResourceResult32a  name:fetch.max.bytes  value:57671680  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:fetch.max.bytes  value:57671680  source:5"  config_type:3\'  configs.275:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.max.retention.bytes  value:104857600  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.max.retention.bytes  value:104857600  source:5"  config_type:5\'  configs.276:\'kafka2.DescribeConfigsResourceResult32a  name:compression.type  value:producer  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:compression.type  value:producer  source:5"  config_type:2\'  configs.277:"kafka2.DescribeConfigsResourceResult32a  name:sasl.login.connect.timeout.ms  read_only:Y  config_source:5  is_sensitive:N  config_type:3"  configs.278:\'kafka2.DescribeConfigsResourceResult32a  name:max.connections.per.ip.overrides  value:""  read_only:N  config_source:5  is_sensitive:N  synonyms.0:\\\'kafka2.DescribeConfigsSynonym32a  name:max.connections.per.ip.overrides  value:""  source:5\\\'  config_type:2\'  configs.279:\'kafka2.DescribeConfigsResourceResult32a  name:group.consumer.max.heartbeat.interval.ms  value:15000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.consumer.max.heartbeat.interval.ms  value:15000  source:5"  config_type:3\'  configs.280:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.login.refresh.window.factor  value:0.8  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.login.refresh.window.factor  value:0.8  source:5"  config_type:6\'  configs.281:"kafka2.DescribeConfigsResourceResult32a  name:remote.log.metadata.manager.class.path  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.282:\'kafka2.DescribeConfigsResourceResult32a  name:kafka.metrics.polling.interval.secs  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:kafka.metrics.polling.interval.secs  value:10  source:5"  config_type:3\'  configs.283:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.log.max.record.bytes.between.snapshots  value:20971520  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.log.max.record.bytes.between.snapshots  value:20971520  source:5"  config_type:5\'  configs.284:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.max.retention.ms  value:604800000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.max.retention.ms  value:604800000  source:5"  config_type:5\'  configs.285:\'kafka2.DescribeConfigsResourceResult32a  name:controller.quorum.election.backoff.max.ms  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:controller.quorum.election.backoff.max.ms  value:1000  source:5"  config_type:3\'  configs.286:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.max.size  value:200  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.max.size  value:200  source:5"  config_type:4\'  configs.287:\'kafka2.DescribeConfigsResourceResult32a  name:max.incremental.fetch.session.cache.slots  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:max.incremental.fetch.session.cache.slots  value:1000  source:5"  config_type:3\'  configs.288:"kafka2.DescribeConfigsResourceResult32a  name:delegation.token.master.key  read_only:Y  config_source:5  is_sensitive:Y  config_type:9"  configs.289:"kafka2.DescribeConfigsResourceResult32a  name:ssl.key.password  read_only:N  config_source:5  is_sensitive:Y  config_type:9"  configs.290:\'kafka2.DescribeConfigsResourceResult32a  name:reserved.broker.max.id  value:1000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:reserved.broker.max.id  value:1000  source:5"  config_type:3\'  configs.291:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.remove.expired.transaction.cleanup.interval.ms  value:3600000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.remove.expired.transaction.cleanup.interval.ms  value:3600000  source:5"  config_type:3\'  configs.292:\'kafka2.DescribeConfigsResourceResult32a  name:log.message.downconversion.enable  value:true  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.message.downconversion.enable  value:true  source:5"  config_type:1\'  configs.293:\'kafka2.DescribeConfigsResourceResult32a  name:ssl.protocol  value:TLSv1.3  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:ssl.protocol  value:TLSv1.3  source:5"  config_type:2\'  configs.294:\'kafka2.DescribeConfigsResourceResult32a  name:metadata.log.segment.ms  value:604800000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:metadata.log.segment.ms  value:604800000  source:5"  config_type:5\'  configs.295:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.state.log.load.buffer.size  value:5242880  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.state.log.load.buffer.size  value:5242880  source:5"  config_type:3\'  configs.296:"kafka2.DescribeConfigsResourceResult32a  name:ssl.keystore.location  read_only:N  config_source:5  is_sensitive:N  config_type:2"  configs.297:\'kafka2.DescribeConfigsResourceResult32a  name:group.coordinator.append.linger.ms  value:10  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.coordinator.append.linger.ms  value:10  source:5"  config_type:3\'  configs.298:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.enabled.mechanisms  value:GSSAPI  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.enabled.mechanisms  value:GSSAPI  source:5"  config_type:7\'  configs.299:"kafka2.DescribeConfigsResourceResult32a  name:num.replica.alter.log.dirs.threads  read_only:Y  config_source:5  is_sensitive:N  config_type:3"  configs.300:\'kafka2.DescribeConfigsResourceResult32a  name:group.share.max.session.timeout.ms  value:60000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.share.max.session.timeout.ms  value:60000  source:5"  config_type:3\'  configs.301:"kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.cipher.suites  read_only:Y  config_source:5  is_sensitive:N  config_type:7"  configs.302:\'kafka2.DescribeConfigsResourceResult32a  name:group.min.session.timeout.ms  value:6000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.min.session.timeout.ms  value:6000  source:5"  config_type:3\'  configs.303:\'kafka2.DescribeConfigsResourceResult32a  name:log.cleaner.io.buffer.load.factor  value:0.9  read_only:N  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:log.cleaner.io.buffer.load.factor  value:0.9  source:5"  config_type:6\'  configs.304:\'kafka2.DescribeConfigsResourceResult32a  name:transaction.max.timeout.ms  value:900000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:transaction.max.timeout.ms  value:900000  source:5"  config_type:3\'  configs.305:"kafka2.DescribeConfigsResourceResult32a  name:metadata.log.dir  read_only:Y  config_source:5  is_sensitive:N  config_type:2"  configs.306:\'kafka2.DescribeConfigsResourceResult32a  name:process.roles  value:broker,controller  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:process.roles  value:broker,controller  source:4"  synonyms.1:\\\'kafka2.DescribeConfigsSynonym32a  name:process.roles  value:""  source:5\\\'  config_type:7\'  configs.307:\'kafka2.DescribeConfigsResourceResult32a  name:group.max.size  value:2147483647  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:group.max.size  value:2147483647  source:5"  config_type:3\'  configs.308:\'kafka2.DescribeConfigsResourceResult32a  name:sasl.oauthbearer.jwks.endpoint.retry.backoff.max.ms  value:10000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:sasl.oauthbearer.jwks.endpoint.retry.backoff.max.ms  value:10000  source:5"  config_type:5\'  configs.309:\'kafka2.DescribeConfigsResourceResult32a  name:delegation.token.max.lifetime.ms  value:604800000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:delegation.token.max.lifetime.ms  value:604800000  source:5"  config_type:5\'  configs.310:\'kafka2.DescribeConfigsResourceResult32a  name:max.request.partition.size.limit  value:2000  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:max.request.partition.size.limit  value:2000  source:5"  config_type:3\'  configs.311:\'kafka2.DescribeConfigsResourceResult32a  name:broker.id  value:1  read_only:Y  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:broker.id  value:1  source:4"  synonyms.1:"kafka2.DescribeConfigsSynonym32a  name:broker.id  value:-1  source:5"  config_type:3\'  configs.312:\'kafka2.DescribeConfigsResourceResult32a  name:offsets.topic.compression.codec  value:0  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:offsets.topic.compression.codec  value:0  source:5"  config_type:3\'  configs.313:\'kafka2.DescribeConfigsResourceResult32a  name:zookeeper.ssl.endpoint.identification.algorithm  value:HTTPS  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:zookeeper.ssl.endpoint.identification.algorithm  value:HTTPS  source:5"  config_type:2\'  configs.314:\'kafka2.DescribeConfigsResourceResult32a  name:replication.quota.window.num  value:11  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:replication.quota.window.num  value:11  source:5"  config_type:3\'  configs.315:\'kafka2.DescribeConfigsResourceResult32a  name:advertised.listeners  value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104  read_only:N  config_source:4  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:advertised.listeners  value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104  source:4"  config_type:2\'  configs.316:\'kafka2.DescribeConfigsResourceResult32a  name:queued.max.request.bytes  value:-1  read_only:Y  config_source:5  is_sensitive:N  synonyms.0:"kafka2.DescribeConfigsSynonym32a  name:queued.max.request.bytes  value:-1  source:5"  config_type:5\''
# kafka2.DescribeConfigsResponse
request_api_version:3
correlation_id:1
throttle_time_ms:0
results.0
  kafka2.DescribeConfigsResult32a
  error_code:0
  error_message:""
  resource_type:4
  resource_name:1
  configs.0
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.min.compaction.lag.ms
    value:0
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.min.compaction.lag.ms
      value:0
      source:5
    config_type:5
  configs.1
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.topic.num.partitions
    value:50
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.topic.num.partitions
      value:50
      source:5
    config_type:3
  configs.2
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.jwks.endpoint.refresh.ms
    value:3600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.jwks.endpoint.refresh.ms
      value:3600000
      source:5
    config_type:5
  configs.3
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.metadata.manager.listener.name
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.4
    kafka2.DescribeConfigsResourceResult32a
    name:log.flush.interval.messages
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.flush.interval.messages
      value:9223372036854775807
      source:5
    config_type:5
  configs.5
    kafka2.DescribeConfigsResourceResult32a
    name:controller.socket.timeout.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.socket.timeout.ms
      value:30000
      source:5
    config_type:3
  configs.6
    kafka2.DescribeConfigsResourceResult32a
    name:principal.builder.class
    value:org.apache.kafka.common.security.authenticator.DefaultKafkaPrincipalBuilder
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:principal.builder.class
      value:org.apache.kafka.common.security.authenticator.DefaultKafkaPrincipalBuilder
      source:5
    config_type:8
  configs.7
    kafka2.DescribeConfigsResourceResult32a
    name:log.flush.interval.ms
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:5
  configs.8
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.request.timeout.ms
    value:2000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.request.timeout.ms
      value:2000
      source:5
    config_type:3
  configs.9
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.expected.audience
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:7
  configs.10
    kafka2.DescribeConfigsResourceResult32a
    name:min.insync.replicas
    value:1
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:min.insync.replicas
      value:1
      source:5
    config_type:3
  configs.11
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.thread.pool.size
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.thread.pool.size
      value:10
      source:5
    config_type:3
  configs.12
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.max.session.timeout.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.max.session.timeout.ms
      value:60000
      source:5
    config_type:3
  configs.13
    kafka2.DescribeConfigsResourceResult32a
    name:num.recovery.threads.per.data.dir
    value:1
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:num.recovery.threads.per.data.dir
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:num.recovery.threads.per.data.dir
      value:1
      source:5
    config_type:3
  configs.14
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keystore.type
    value:JKS
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.keystore.type
      value:JKS
      source:5
    config_type:2
  configs.15
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.protocol
    value:TLSv1.2
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.ssl.protocol
      value:TLSv1.2
      source:5
    config_type:2
  configs.16
    kafka2.DescribeConfigsResourceResult32a
    name:super.users
    read_only:Y
    config_source:4
    is_sensitive:Y
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:super.users
      source:4
    config_type:0
  configs.17
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.bootstrap.servers
    value:""
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.bootstrap.servers
      value:""
      source:5
    config_type:7
  configs.18
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.mechanism.inter.broker.protocol
    value:GSSAPI
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.mechanism.inter.broker.protocol
      value:GSSAPI
      source:5
    config_type:2
  configs.19
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.record.lock.duration.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.record.lock.duration.ms
      value:30000
      source:5
    config_type:3
  configs.20
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.log.segment.bytes
    value:1073741824
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.log.segment.bytes
      value:1073741824
      source:5
    config_type:3
  configs.21
    kafka2.DescribeConfigsResourceResult32a
    name:fetch.purgatory.purge.interval.requests
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:fetch.purgatory.purge.interval.requests
      value:1000
      source:5
    config_type:3
  configs.22
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.endpoint.identification.algorithm
    value:https
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.endpoint.identification.algorithm
      value:https
      source:5
    config_type:2
  configs.23
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.keystore.location
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.24
    kafka2.DescribeConfigsResourceResult32a
    name:replica.socket.timeout.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.socket.timeout.ms
      value:30000
      source:5
    config_type:3
  configs.25
    kafka2.DescribeConfigsResourceResult32a
    name:message.max.bytes
    value:10485760
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:message.max.bytes
      value:10485760
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:message.max.bytes
      value:1048588
      source:5
    config_type:3
  configs.26
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.fetch.max.bytes.per.second
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.fetch.max.bytes.per.second
      value:9223372036854775807
      source:5
    config_type:5
  configs.27
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.session.timeout.ms
    value:45000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.session.timeout.ms
      value:45000
      source:5
    config_type:3
  configs.28
    kafka2.DescribeConfigsResourceResult32a
    name:max.connection.creation.rate
    value:2147483647
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.connection.creation.rate
      value:2147483647
      source:5
    config_type:3
  configs.29
    kafka2.DescribeConfigsResourceResult32a
    name:connections.max.reauth.ms
    value:0
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:connections.max.reauth.ms
      value:0
      source:5
    config_type:5
  configs.30
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.copy.quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.copy.quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.31
    kafka2.DescribeConfigsResourceResult32a
    name:log.flush.offset.checkpoint.interval.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.flush.offset.checkpoint.interval.ms
      value:60000
      source:5
    config_type:3
  configs.32
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.clientCnxnSocket
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.33
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.client.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.ssl.client.enable
      value:false
      source:5
    config_type:1
  configs.34
    kafka2.DescribeConfigsResourceResult32a
    name:quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:quota.window.num
      value:11
      source:5
    config_type:3
  configs.35
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.clock.skew.seconds
    value:30
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.clock.skew.seconds
      value:30
      source:5
    config_type:3
  configs.36
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.min.session.timeout.ms
    value:45000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.min.session.timeout.ms
      value:45000
      source:5
    config_type:3
  configs.37
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.connect
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.38
    kafka2.DescribeConfigsResourceResult32a
    name:authorizer.class.name
    value:org.apache.kafka.metadata.authorizer.StandardAuthorizer
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:authorizer.class.name
      value:org.apache.kafka.metadata.authorizer.StandardAuthorizer
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:authorizer.class.name
      value:""
      source:5
    config_type:2
  configs.39
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.secret
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.40
    kafka2.DescribeConfigsResourceResult32a
    name:num.replica.fetchers
    value:8
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:num.replica.fetchers
      value:8
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:num.replica.fetchers
      value:1
      source:5
    config_type:3
  configs.41
    kafka2.DescribeConfigsResourceResult32a
    name:alter.log.dirs.replication.quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:alter.log.dirs.replication.quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.42
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.jwks.endpoint.url
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.43
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.metadata.custom.metadata.max.bytes
    value:128
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.metadata.custom.metadata.max.bytes
      value:128
      source:5
    config_type:3
  configs.44
    kafka2.DescribeConfigsResourceResult32a
    name:auto.include.jmx.reporter
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:auto.include.jmx.reporter
      value:true
      source:5
    config_type:1
  configs.45
    kafka2.DescribeConfigsResourceResult32a
    name:log.roll.jitter.hours
    value:0
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.roll.jitter.hours
      value:0
      source:5
    config_type:3
  configs.46
    kafka2.DescribeConfigsResourceResult32a
    name:telemetry.max.bytes
    value:1048576
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:telemetry.max.bytes
      value:1048576
      source:5
    config_type:3
  configs.47
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.old.secret
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.48
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.delete.retention.ms
    value:86400000
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.delete.retention.ms
      value:86400000
      source:5
    config_type:5
  configs.49
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.retry.backoff.ms
    value:100
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.retry.backoff.ms
      value:100
      source:5
    config_type:5
  configs.50
    kafka2.DescribeConfigsResourceResult32a
    name:queued.max.requests
    value:500
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:queued.max.requests
      value:500
      source:5
    config_type:3
  configs.51
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.threads
    value:1
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.threads
      value:1
      source:5
    config_type:3
  configs.52
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.service.name
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:2
  configs.53
    kafka2.DescribeConfigsResourceResult32a
    name:socket.request.max.bytes
    value:104857600
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.request.max.bytes
      value:104857600
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:socket.request.max.bytes
      value:104857600
      source:5
    config_type:3
  configs.54
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.max.size
    value:2147483647
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.max.size
      value:2147483647
      source:5
    config_type:3
  configs.55
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.assignors
    value:org.apache.kafka.coordinator.group.assignor.UniformAssignor,org.apache.kafka.coordinator.group.assignor.RangeAssignor
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.assignors
      value:org.apache.kafka.coordinator.group.assignor.UniformAssignor,org.apache.kafka.coordinator.group.assignor.RangeAssignor
      source:5
    config_type:7
  configs.56
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.storage.system.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.storage.system.enable
      value:false
      source:5
    config_type:1
  configs.57
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.timestamp.type
    value:CreateTime
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.timestamp.type
      value:CreateTime
      source:5
    config_type:2
  configs.58
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.keystore.type
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.59
    kafka2.DescribeConfigsResourceResult32a
    name:connections.max.idle.ms
    value:600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:connections.max.idle.ms
      value:600000
      source:5
    config_type:5
  configs.60
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.set.acl
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.set.acl
      value:false
      source:5
    config_type:1
  configs.61
    kafka2.DescribeConfigsResourceResult32a
    name:delegation.token.expiry.time.ms
    value:86400000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:delegation.token.expiry.time.ms
      value:86400000
      source:5
    config_type:5
  configs.62
    kafka2.DescribeConfigsResourceResult32a
    name:max.connections
    value:2147483647
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.connections
      value:2147483647
      source:5
    config_type:3
  configs.63
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.state.log.num.partitions
    value:50
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.num.partitions
      value:50
      source:5
    config_type:3
  configs.64
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.election.timeout.ms
    value:20000
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.election.timeout.ms
      value:20000
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.election.timeout.ms
      value:1000
      source:5
    config_type:3
  configs.65
    kafka2.DescribeConfigsResourceResult32a
    name:listener.security.protocol.map
    value:CONTROLLER:PLAINTEXT,INTERNAL:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:listener.security.protocol.map
      value:CONTROLLER:PLAINTEXT,INTERNAL:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:listener.security.protocol.map
      value:SASL_SSL:SASL_SSL,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT
      source:5
    config_type:2
  configs.66
    kafka2.DescribeConfigsResourceResult32a
    name:log.retention.hours
    value:168
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.retention.hours
      value:168
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:log.retention.hours
      value:168
      source:5
    config_type:3
  configs.67
    kafka2.DescribeConfigsResourceResult32a
    name:client.quota.callback.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.68
    kafka2.DescribeConfigsResourceResult32a
    name:audit.log.enabled
    read_only:Y
    config_source:4
    is_sensitive:Y
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:audit.log.enabled
      source:4
    config_type:0
  configs.69
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.storage.manager.impl.prefix
    value:rsm.config.
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.storage.manager.impl.prefix
      value:rsm.config.
      source:5
    config_type:2
  configs.70
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.provider
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:2
  configs.71
    kafka2.DescribeConfigsResourceResult32a
    name:delete.records.purgatory.purge.interval.requests
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:delete.records.purgatory.purge.interval.requests
      value:1
      source:5
    config_type:3
  configs.72
    kafka2.DescribeConfigsResourceResult32a
    name:producer.id.expiration.ms
    value:86400000
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:producer.id.expiration.ms
      value:86400000
      source:5
    config_type:3
  configs.73
    kafka2.DescribeConfigsResourceResult32a
    name:log.roll.ms
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:5
  configs.74
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.cipher.suites
    value:""
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.cipher.suites
      value:""
      source:5
    config_type:7
  configs.75
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.retry.backoff.ms
    value:20
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.retry.backoff.ms
      value:20
      source:5
    config_type:3
  configs.76
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.copy.max.bytes.per.second
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.copy.max.bytes.per.second
      value:9223372036854775807
      source:5
    config_type:5
  configs.77
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.keystore.password
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.78
    kafka2.DescribeConfigsResourceResult32a
    name:broker.session.timeout.ms
    value:9000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:broker.session.timeout.ms
      value:9000
      source:5
    config_type:3
  configs.79
    kafka2.DescribeConfigsResourceResult32a
    name:security.inter.broker.protocol
    value:PLAINTEXT
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:security.inter.broker.protocol
      value:PLAINTEXT
      source:5
    config_type:2
  configs.80
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.heartbeat.interval.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.heartbeat.interval.ms
      value:5000
      source:5
    config_type:3
  configs.81
    kafka2.DescribeConfigsResourceResult32a
    name:delegation.token.secret.key
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.82
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.fetch.quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.fetch.quota.window.num
      value:11
      source:5
    config_type:3
  configs.83
    kafka2.DescribeConfigsResourceResult32a
    name:remote.fetch.max.wait.ms
    value:500
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.fetch.max.wait.ms
      value:500
      source:5
    config_type:3
  configs.84
    kafka2.DescribeConfigsResourceResult32a
    name:node.id
    value:1
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:node.id
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:node.id
      value:-1
      source:5
    config_type:3
  configs.85
    kafka2.DescribeConfigsResourceResult32a
    name:replica.high.watermark.checkpoint.interval.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.high.watermark.checkpoint.interval.ms
      value:5000
      source:5
    config_type:5
  configs.86
    kafka2.DescribeConfigsResourceResult32a
    name:replication.quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replication.quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.87
    kafka2.DescribeConfigsResourceResult32a
    name:eligible.leader.replicas.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:eligible.leader.replicas.enable
      value:false
      source:5
    config_type:1
  configs.88
    kafka2.DescribeConfigsResourceResult32a
    name:log.local.retention.ms
    value:-2
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.local.retention.ms
      value:-2
      source:5
    config_type:5
  configs.89
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.reader.threads
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.reader.threads
      value:10
      source:5
    config_type:3
  configs.90
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.ticket.renew.window.factor
    value:0.8
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.kerberos.ticket.renew.window.factor
      value:0.8
      source:5
    config_type:6
  configs.91
    kafka2.DescribeConfigsResourceResult32a
    name:group.coordinator.threads
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.coordinator.threads
      value:1
      source:5
    config_type:3
  configs.92
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.connection.timeout.ms
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:3
  configs.93
    kafka2.DescribeConfigsResourceResult32a
    name:metrics.recording.level
    value:INFO
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metrics.recording.level
      value:INFO
      source:5
    config_type:2
  configs.94
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.cipher.algorithm
    value:AES/CBC/PKCS5Padding
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:password.encoder.cipher.algorithm
      value:AES/CBC/PKCS5Padding
      source:5
    config_type:2
  configs.95
    kafka2.DescribeConfigsResourceResult32a
    name:log.dir.failure.timeout.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.dir.failure.timeout.ms
      value:30000
      source:5
    config_type:5
  configs.96
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.partition.verification.enable
    value:true
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.partition.verification.enable
      value:true
      source:5
    config_type:1
  configs.97
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.min.heartbeat.interval.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.min.heartbeat.interval.ms
      value:5000
      source:5
    config_type:3
  configs.98
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.principal.mapping.rules
    value:DEFAULT
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.principal.mapping.rules
      value:DEFAULT
      source:5
    config_type:2
  configs.99
    kafka2.DescribeConfigsResourceResult32a
    name:replica.selector.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.100
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.fetch.quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.fetch.quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.101
    kafka2.DescribeConfigsResourceResult32a
    name:max.connections.per.ip
    value:2147483647
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.connections.per.ip
      value:2147483647
      source:5
    config_type:3
  configs.102
    kafka2.DescribeConfigsResourceResult32a
    name:background.threads
    value:10
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:background.threads
      value:10
      source:5
    config_type:3
  configs.103
    kafka2.DescribeConfigsResourceResult32a
    name:request.timeout.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:request.timeout.ms
      value:30000
      source:5
    config_type:3
  configs.104
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.format.version
    value:3.0-IV1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.format.version
      value:3.0-IV1
      source:5
    config_type:2
  configs.105
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.106
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.index.file.cache.total.size.bytes
    value:1073741824
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.index.file.cache.total.size.bytes
      value:1073741824
      source:5
    config_type:5
  configs.107
    kafka2.DescribeConfigsResourceResult32a
    name:log.dir
    value:/tmp/kafka-logs
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.dir
      value:/tmp/kafka-logs
      source:5
    config_type:2
  configs.108
    kafka2.DescribeConfigsResourceResult32a
    name:log.segment.bytes
    value:1073741824
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.segment.bytes
      value:1073741824
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:log.segment.bytes
      value:1073741824
      source:5
    config_type:3
  configs.109
    kafka2.DescribeConfigsResourceResult32a
    name:replica.fetch.response.max.bytes
    value:10485760
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.response.max.bytes
      value:10485760
      source:5
    config_type:3
  configs.110
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.heartbeat.interval.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.heartbeat.interval.ms
      value:5000
      source:5
    config_type:3
  configs.111
    kafka2.DescribeConfigsResourceResult32a
    name:group.max.session.timeout.ms
    value:1800000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.max.session.timeout.ms
      value:1800000
      source:5
    config_type:3
  configs.112
    kafka2.DescribeConfigsResourceResult32a
    name:controller.listener.names
    value:CONTROLLER
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.listener.names
      value:CONTROLLER
      source:4
    config_type:2
  configs.113
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.timestamp.after.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.timestamp.after.max.ms
      value:9223372036854775807
      source:5
    config_type:5
  configs.114
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.append.linger.ms
    value:25
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.append.linger.ms
      value:25
      source:5
    config_type:3
  configs.115
    kafka2.DescribeConfigsResourceResult32a
    name:log.segment.delete.delay.ms
    value:60000
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.segment.delete.delay.ms
      value:60000
      source:5
    config_type:5
  configs.116
    kafka2.DescribeConfigsResourceResult32a
    name:log.retention.minutes
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:3
  configs.117
    kafka2.DescribeConfigsResourceResult32a
    name:log.dirs
    value:/mnt/data-1/dev.ak-8,/mnt/data-2/dev.ak-8,/mnt/data-3/dev.ak-8,/mnt/data-4/dev.ak-8
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.dirs
      value:/mnt/data-1/dev.ak-8,/mnt/data-2/dev.ak-8,/mnt/data-3/dev.ak-8,/mnt/data-4/dev.ak-8
      source:4
    config_type:2
  configs.118
    kafka2.DescribeConfigsResourceResult32a
    name:controlled.shutdown.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controlled.shutdown.enable
      value:true
      source:5
    config_type:1
  configs.119
    kafka2.DescribeConfigsResourceResult32a
    name:early.start.listeners
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.120
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.timestamp.before.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.timestamp.before.max.ms
      value:9223372036854775807
      source:5
    config_type:5
  configs.121
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.copier.thread.pool.size
    value:-1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.copier.thread.pool.size
      value:-1
      source:5
    config_type:3
  configs.122
    kafka2.DescribeConfigsResourceResult32a
    name:socket.connection.setup.timeout.max.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.connection.setup.timeout.max.ms
      value:30000
      source:5
    config_type:5
  configs.123
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.timestamp.difference.max.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.timestamp.difference.max.ms
      value:9223372036854775807
      source:5
    config_type:5
  configs.124
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.scope.claim.name
    value:scope
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.scope.claim.name
      value:scope
      source:5
    config_type:2
  configs.125
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.key.length
    value:128
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:password.encoder.key.length
      value:128
      source:5
    config_type:3
  configs.126
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.refresh.min.period.seconds
    value:60
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.refresh.min.period.seconds
      value:60
      source:5
    config_type:4
  configs.127
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.expected.issuer
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.128
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.read.timeout.ms
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:3
  configs.129
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.abort.timed.out.transaction.cleanup.interval.ms
    value:10000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.abort.timed.out.transaction.cleanup.interval.ms
      value:10000
      source:5
    config_type:3
  configs.130
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.kinit.cmd
    value:/usr/bin/kinit
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.kerberos.kinit.cmd
      value:/usr/bin/kinit
      source:5
    config_type:2
  configs.131
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.io.max.bytes.per.second
    value:1.7976931348623157E308
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.io.max.bytes.per.second
      value:1.7976931348623157E308
      source:5
    config_type:6
  configs.132
    kafka2.DescribeConfigsResourceResult32a
    name:auto.leader.rebalance.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:auto.leader.rebalance.enable
      value:true
      source:5
    config_type:1
  configs.133
    kafka2.DescribeConfigsResourceResult32a
    name:leader.imbalance.check.interval.seconds
    value:300
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:leader.imbalance.check.interval.seconds
      value:300
      source:5
    config_type:5
  configs.134
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.min.cleanable.ratio
    value:0.5
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.min.cleanable.ratio
      value:0.5
      source:5
    config_type:6
  configs.135
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.min.record.lock.duration.ms
    value:15000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.min.record.lock.duration.ms
      value:15000
      source:5
    config_type:3
  configs.136
    kafka2.DescribeConfigsResourceResult32a
    name:replica.lag.time.max.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.lag.time.max.ms
      value:30000
      source:5
    config_type:5
  configs.137
    kafka2.DescribeConfigsResourceResult32a
    name:num.network.threads
    value:8
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:num.network.threads
      value:8
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:num.network.threads
      value:3
      source:5
    config_type:3
  configs.138
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.min.session.timeout.ms
    value:45000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.min.session.timeout.ms
      value:45000
      source:5
    config_type:3
  configs.139
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keystore.key
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.140
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.client.callback.handler.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.141
    kafka2.DescribeConfigsResourceResult32a
    name:compression.gzip.level
    value:-1
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:compression.gzip.level
      value:-1
      source:5
    config_type:3
  configs.142
    kafka2.DescribeConfigsResourceResult32a
    name:metrics.num.samples
    value:2
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metrics.num.samples
      value:2
      source:5
    config_type:3
  configs.143
    kafka2.DescribeConfigsResourceResult32a
    name:socket.send.buffer.bytes
    value:102400
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.send.buffer.bytes
      value:102400
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:socket.send.buffer.bytes
      value:102400
      source:5
    config_type:3
  configs.144
    kafka2.DescribeConfigsResourceResult32a
    name:group.coordinator.rebalance.protocols
    value:classic
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.coordinator.rebalance.protocols
      value:classic
      source:5
    config_type:7
  configs.145
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.keyfactory.algorithm
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.146
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.storage.manager.class.name
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.147
    kafka2.DescribeConfigsResourceResult32a
    name:socket.receive.buffer.bytes
    value:102400
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.receive.buffer.bytes
      value:102400
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:socket.receive.buffer.bytes
      value:102400
      source:5
    config_type:3
  configs.148
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.sub.claim.name
    value:sub
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.sub.claim.name
      value:sub
      source:5
    config_type:2
  configs.149
    kafka2.DescribeConfigsResourceResult32a
    name:replica.fetch.min.bytes
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.min.bytes
      value:1
      source:5
    config_type:3
  configs.150
    kafka2.DescribeConfigsResourceResult32a
    name:broker.rack
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.151
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.truststore.password
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.152
    kafka2.DescribeConfigsResourceResult32a
    name:unclean.leader.election.enable
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:unclean.leader.election.enable
      value:false
      source:5
    config_type:1
  configs.153
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.jwks.endpoint.retry.backoff.ms
    value:100
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.jwks.endpoint.retry.backoff.ms
      value:100
      source:5
    config_type:5
  configs.154
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.retention.check.interval.ms
    value:600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.retention.check.interval.ms
      value:600000
      source:5
    config_type:5
  configs.155
    kafka2.DescribeConfigsResourceResult32a
    name:producer.purgatory.purge.interval.requests
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:producer.purgatory.purge.interval.requests
      value:1000
      source:5
    config_type:3
  configs.156
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.voters
    value:1@dev.ak-8.kafka-1.int:1049,2@dev.ak-8.kafka-2.int:1051,3@dev.ak-8.kafka-3.int:1053
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.voters
      value:1@dev.ak-8.kafka-1.int:1049,2@dev.ak-8.kafka-2.int:1051,3@dev.ak-8.kafka-3.int:1053
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.voters
      value:""
      source:5
    config_type:7
  configs.157
    kafka2.DescribeConfigsResourceResult32a
    name:metrics.sample.window.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metrics.sample.window.ms
      value:30000
      source:5
    config_type:5
  configs.158
    kafka2.DescribeConfigsResourceResult32a
    name:log.retention.check.interval.ms
    value:300000
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.retention.check.interval.ms
      value:300000
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:log.retention.check.interval.ms
      value:300000
      source:5
    config_type:5
  configs.159
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.session.timeout.ms
    value:45000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.session.timeout.ms
      value:45000
      source:5
    config_type:3
  configs.160
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.refresh.window.jitter
    value:0.05
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.refresh.window.jitter
      value:0.05
      source:5
    config_type:6
  configs.161
    kafka2.DescribeConfigsResourceResult32a
    name:leader.imbalance.per.broker.percentage
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:leader.imbalance.per.broker.percentage
      value:10
      source:5
    config_type:3
  configs.162
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quota.window.num
      value:11
      source:5
    config_type:3
  configs.163
    kafka2.DescribeConfigsResourceResult32a
    name:metric.reporters
    value:""
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metric.reporters
      value:""
      source:5
    config_type:7
  configs.164
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.token.endpoint.url
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.165
    kafka2.DescribeConfigsResourceResult32a
    name:auto.create.topics.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:auto.create.topics.enable
      value:true
      source:5
    config_type:1
  configs.166
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.partition.max.record.locks
    value:200
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.partition.max.record.locks
      value:200
      source:5
    config_type:3
  configs.167
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.engine.factory.class
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:8
  configs.168
    kafka2.DescribeConfigsResourceResult32a
    name:replica.socket.receive.buffer.bytes
    value:65536
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.socket.receive.buffer.bytes
      value:65536
      source:5
    config_type:3
  configs.169
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.truststore.location
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.170
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.allow.dn.changes
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.allow.dn.changes
      value:false
      source:5
    config_type:1
  configs.171
    kafka2.DescribeConfigsResourceResult32a
    name:replica.fetch.wait.max.ms
    value:500
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.wait.max.ms
      value:500
      source:5
    config_type:3
  configs.172
    kafka2.DescribeConfigsResourceResult32a
    name:password.encoder.iterations
    value:4096
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:password.encoder.iterations
      value:4096
      source:5
    config_type:3
  configs.173
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.min.heartbeat.interval.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.min.heartbeat.interval.ms
      value:5000
      source:5
    config_type:3
  configs.174
    kafka2.DescribeConfigsResourceResult32a
    name:default.replication.factor
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:default.replication.factor
      value:1
      source:5
    config_type:3
  configs.175
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.truststore.password
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.176
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.principal.to.local.rules
    value:DEFAULT
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.kerberos.principal.to.local.rules
      value:DEFAULT
      source:5
    config_type:7
  configs.177
    kafka2.DescribeConfigsResourceResult32a
    name:log.preallocate
    value:false
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.preallocate
      value:false
      source:5
    config_type:1
  configs.178
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.reader.max.pending.tasks
    value:100
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.reader.max.pending.tasks
      value:100
      source:5
    config_type:3
  configs.179
    kafka2.DescribeConfigsResourceResult32a
    name:transactional.id.expiration.ms
    value:604800000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transactional.id.expiration.ms
      value:604800000
      source:5
    config_type:3
  configs.180
    kafka2.DescribeConfigsResourceResult32a
    name:control.plane.listener.name
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.181
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.state.log.replication.factor
    value:1
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.replication.factor
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.replication.factor
      value:3
      source:5
    config_type:4
  configs.182
    kafka2.DescribeConfigsResourceResult32a
    name:num.io.threads
    value:8
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:num.io.threads
      value:8
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:num.io.threads
      value:8
      source:5
    config_type:3
  configs.183
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.refresh.buffer.seconds
    value:300
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.refresh.buffer.seconds
      value:300
      source:5
    config_type:4
  configs.184
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.max.heartbeat.interval.ms
    value:15000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.max.heartbeat.interval.ms
      value:15000
      source:5
    config_type:3
  configs.185
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.commit.required.acks
    value:-1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.commit.required.acks
      value:-1
      source:5
    config_type:4
  configs.186
    kafka2.DescribeConfigsResourceResult32a
    name:connection.failed.authentication.delay.ms
    value:100
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:connection.failed.authentication.delay.ms
      value:100
      source:5
    config_type:3
  configs.187
    kafka2.DescribeConfigsResourceResult32a
    name:delete.topic.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:delete.topic.enable
      value:true
      source:5
    config_type:1
  configs.188
    kafka2.DescribeConfigsResourceResult32a
    name:quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.189
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.truststore.type
    value:JKS
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.truststore.type
      value:JKS
      source:5
    config_type:2
  configs.190
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.commit.timeout.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.commit.timeout.ms
      value:5000
      source:5
    config_type:3
  configs.191
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.ocsp.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.ssl.ocsp.enable
      value:false
      source:5
    config_type:1
  configs.192
    kafka2.DescribeConfigsResourceResult32a
    name:broker.heartbeat.interval.ms
    value:2000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:broker.heartbeat.interval.ms
      value:2000
      source:5
    config_type:3
  configs.193
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.max.record.lock.duration.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.max.record.lock.duration.ms
      value:60000
      source:5
    config_type:3
  configs.194
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.mechanism.controller.protocol
    value:GSSAPI
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.mechanism.controller.protocol
      value:GSSAPI
      source:5
    config_type:2
  configs.195
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.max.compaction.lag.ms
    value:9223372036854775807
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.max.compaction.lag.ms
      value:9223372036854775807
      source:5
    config_type:5
  configs.196
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.enabled.protocols
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:7
  configs.197
    kafka2.DescribeConfigsResourceResult32a
    name:allow.everyone.if.no.acl.found
    read_only:Y
    config_source:4
    is_sensitive:Y
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:allow.everyone.if.no.acl.found
      source:4
    config_type:0
  configs.198
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.storage.manager.class.path
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.199
    kafka2.DescribeConfigsResourceResult32a
    name:log.retention.ms
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:5
  configs.200
    kafka2.DescribeConfigsResourceResult32a
    name:alter.log.dirs.replication.quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:alter.log.dirs.replication.quota.window.num
      value:11
      source:5
    config_type:3
  configs.201
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.enable
      value:true
      source:5
    config_type:1
  configs.202
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.fetch.timeout.ms
    value:10000
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.fetch.timeout.ms
      value:10000
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.fetch.timeout.ms
      value:2000
      source:5
    config_type:3
  configs.203
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.load.buffer.size
    value:5242880
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.load.buffer.size
      value:5242880
      source:5
    config_type:3
  configs.204
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.client.auth
    value:none
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.client.auth
      value:none
      source:5
    config_type:2
  configs.205
    kafka2.DescribeConfigsResourceResult32a
    name:controlled.shutdown.max.retries
    value:3
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controlled.shutdown.max.retries
      value:3
      source:5
    config_type:3
  configs.206
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.topic.replication.factor
    value:1
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.topic.replication.factor
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:offsets.topic.replication.factor
      value:3
      source:5
    config_type:4
  configs.207
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.truststore.type
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.208
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.state.log.min.isr
    value:1
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.min.isr
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.min.isr
      value:2
      source:5
    config_type:3
  configs.209
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.secure.random.implementation
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:2
  configs.210
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.ticket.renew.jitter
    value:0.05
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.kerberos.ticket.renew.jitter
      value:0.05
      source:5
    config_type:6
  configs.211
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.trustmanager.algorithm
    value:PKIX
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.trustmanager.algorithm
      value:PKIX
      source:5
    config_type:2
  configs.212
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.session.timeout.ms
    value:18000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.session.timeout.ms
      value:18000
      source:5
    config_type:3
  configs.213
    kafka2.DescribeConfigsResourceResult32a
    name:log.local.retention.bytes
    value:-2
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.local.retention.bytes
      value:-2
      source:5
    config_type:5
  configs.214
    kafka2.DescribeConfigsResourceResult32a
    name:log.retention.bytes
    value:-1
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.retention.bytes
      value:-1
      source:5
    config_type:5
  configs.215
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quota.window.size.seconds
    value:1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quota.window.size.seconds
      value:1
      source:5
    config_type:3
  configs.216
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.metadata.manager.impl.prefix
    value:rlmm.config.
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.metadata.manager.impl.prefix
      value:rlmm.config.
      source:5
    config_type:2
  configs.217
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.jaas.config
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.218
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.kerberos.min.time.before.relogin
    value:60000
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.kerberos.min.time.before.relogin
      value:60000
      source:5
    config_type:5
  configs.219
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.retention.minutes
    value:10080
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.retention.minutes
      value:10080
      source:5
    config_type:3
  configs.220
    kafka2.DescribeConfigsResourceResult32a
    name:replica.fetch.backoff.ms
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.backoff.ms
      value:1000
      source:5
    config_type:3
  configs.221
    kafka2.DescribeConfigsResourceResult32a
    name:inter.broker.protocol.version
    value:3.9-IV0
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:inter.broker.protocol.version
      value:3.9-IV0
      source:5
    config_type:2
  configs.222
    kafka2.DescribeConfigsResourceResult32a
    name:kafka.metrics.reporters
    value:""
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:kafka.metrics.reporters
      value:""
      source:5
    config_type:7
  configs.223
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.delivery.count.limit
    value:5
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.delivery.count.limit
      value:5
      source:5
    config_type:3
  configs.224
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.allow.san.changes
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.allow.san.changes
      value:false
      source:5
    config_type:1
  configs.225
    kafka2.DescribeConfigsResourceResult32a
    name:compression.zstd.level
    value:3
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:compression.zstd.level
      value:3
      source:5
    config_type:3
  configs.226
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.copy.quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.copy.quota.window.num
      value:11
      source:5
    config_type:3
  configs.227
    kafka2.DescribeConfigsResourceResult32a
    name:num.partitions
    value:3
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:num.partitions
      value:3
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:num.partitions
      value:1
      source:5
    config_type:3
  configs.228
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keystore.certificate.chain
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.229
    kafka2.DescribeConfigsResourceResult32a
    name:socket.connection.setup.timeout.ms
    value:10000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.connection.setup.timeout.ms
      value:10000
      source:5
    config_type:5
  configs.230
    kafka2.DescribeConfigsResourceResult32a
    name:broker.id.generation.enable
    value:true
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:broker.id.generation.enable
      value:true
      source:5
    config_type:1
  configs.231
    kafka2.DescribeConfigsResourceResult32a
    name:listeners
    value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104,CONTROLLER://dev.ak-8.kafka-1.int:1049
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:listeners
      value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104,CONTROLLER://dev.ak-8.kafka-1.int:1049
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:listeners
      value:PLAINTEXT://:9092
      source:5
    config_type:2
  configs.232
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.enabled.protocols
    value:TLSv1.2,TLSv1.3
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.enabled.protocols
      value:TLSv1.2,TLSv1.3
      source:5
    config_type:7
  configs.233
    kafka2.DescribeConfigsResourceResult32a
    name:inter.broker.listener.name
    value:INTERNAL
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:inter.broker.listener.name
      value:INTERNAL
      source:4
    config_type:2
  configs.234
    kafka2.DescribeConfigsResourceResult32a
    name:alter.config.policy.class.name
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.235
    kafka2.DescribeConfigsResourceResult32a
    name:delegation.token.expiry.check.interval.ms
    value:3600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:delegation.token.expiry.check.interval.ms
      value:3600000
      source:5
    config_type:5
  configs.236
    kafka2.DescribeConfigsResourceResult32a
    name:log.flush.scheduler.interval.ms
    value:9223372036854775807
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.flush.scheduler.interval.ms
      value:9223372036854775807
      source:5
    config_type:5
  configs.237
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.max.in.flight.requests
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.max.in.flight.requests
      value:10
      source:5
    config_type:3
  configs.238
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.expiration.thread.pool.size
    value:-1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.expiration.thread.pool.size
      value:-1
      source:5
    config_type:3
  configs.239
    kafka2.DescribeConfigsResourceResult32a
    name:log.index.size.max.bytes
    value:10485760
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.index.size.max.bytes
      value:10485760
      source:5
    config_type:3
  configs.240
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keymanager.algorithm
    value:SunX509
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.keymanager.algorithm
      value:SunX509
      source:5
    config_type:2
  configs.241
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.callback.handler.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.242
    kafka2.DescribeConfigsResourceResult32a
    name:replica.fetch.max.bytes
    value:10485760
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.max.bytes
      value:10485760
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:replica.fetch.max.bytes
      value:1048576
      source:5
    config_type:3
  configs.243
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.crl.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.ssl.crl.enable
      value:false
      source:5
    config_type:1
  configs.244
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.server.callback.handler.class
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.245
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.max.groups
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.max.groups
      value:10
      source:5
    config_type:4
  configs.246
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.dedupe.buffer.size
    value:134217728
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.dedupe.buffer.size
      value:134217728
      source:5
    config_type:5
  configs.247
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.io.buffer.size
    value:524288
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.io.buffer.size
      value:524288
      source:5
    config_type:3
  configs.248
    kafka2.DescribeConfigsResourceResult32a
    name:create.topic.policy.class.name
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:8
  configs.249
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.truststore.certificates
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.250
    kafka2.DescribeConfigsResourceResult32a
    name:socket.listen.backlog.size
    value:50
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:socket.listen.backlog.size
      value:50
      source:5
    config_type:3
  configs.251
    kafka2.DescribeConfigsResourceResult32a
    name:controlled.shutdown.retry.backoff.ms
    value:5000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controlled.shutdown.retry.backoff.ms
      value:5000
      source:5
    config_type:5
  configs.252
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.server.max.receive.size
    value:524288
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.server.max.receive.size
      value:524288
      source:5
    config_type:3
  configs.253
    kafka2.DescribeConfigsResourceResult32a
    name:security.providers
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.254
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.log.max.snapshot.interval.ms
    value:3600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.log.max.snapshot.interval.ms
      value:3600000
      source:5
    config_type:5
  configs.255
    kafka2.DescribeConfigsResourceResult32a
    name:compression.lz4.level
    value:9
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:compression.lz4.level
      value:9
      source:5
    config_type:3
  configs.256
    kafka2.DescribeConfigsResourceResult32a
    name:log.roll.hours
    value:168
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.roll.hours
      value:168
      source:5
    config_type:3
  configs.257
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleanup.policy
    value:delete
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleanup.policy
      value:delete
      source:5
    config_type:7
  configs.258
    kafka2.DescribeConfigsResourceResult32a
    name:initial.broker.registration.timeout.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:initial.broker.registration.timeout.ms
      value:60000
      source:5
    config_type:3
  configs.259
    kafka2.DescribeConfigsResourceResult32a
    name:log.flush.start.offset.checkpoint.interval.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.flush.start.offset.checkpoint.interval.ms
      value:60000
      source:5
    config_type:3
  configs.260
    kafka2.DescribeConfigsResourceResult32a
    name:log.roll.jitter.ms
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:5
  configs.261
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.state.log.segment.bytes
    value:104857600
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.segment.bytes
      value:104857600
      source:5
    config_type:3
  configs.262
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.topic.segment.bytes
    value:104857600
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.topic.segment.bytes
      value:104857600
      source:5
    config_type:3
  configs.263
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.max.idle.interval.ms
    value:500
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.max.idle.interval.ms
      value:500
      source:5
    config_type:3
  configs.264
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.metadata.manager.class.name
    value:org.apache.kafka.server.log.remote.metadata.storage.TopicBasedRemoteLogMetadataManager
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.metadata.manager.class.name
      value:org.apache.kafka.server.log.remote.metadata.storage.TopicBasedRemoteLogMetadataManager
      source:5
    config_type:2
  configs.265
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.retry.backoff.max.ms
    value:10000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.retry.backoff.max.ms
      value:10000
      source:5
    config_type:5
  configs.266
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.manager.task.interval.ms
    value:30000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:remote.log.manager.task.interval.ms
      value:30000
      source:5
    config_type:5
  configs.267
    kafka2.DescribeConfigsResourceResult32a
    name:group.initial.rebalance.delay.ms
    value:3000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.initial.rebalance.delay.ms
      value:3000
      source:5
    config_type:3
  configs.268
    kafka2.DescribeConfigsResourceResult32a
    name:log.index.interval.bytes
    value:4096
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.index.interval.bytes
      value:4096
      source:5
    config_type:3
  configs.269
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.backoff.ms
    value:15000
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.backoff.ms
      value:15000
      source:5
    config_type:5
  configs.270
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.truststore.location
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:2
  configs.271
    kafka2.DescribeConfigsResourceResult32a
    name:offset.metadata.max.bytes
    value:4096
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offset.metadata.max.bytes
      value:4096
      source:5
    config_type:3
  configs.272
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keystore.password
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.273
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.metadata.migration.enable
    value:false
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.metadata.migration.enable
      value:false
      source:5
    config_type:1
  configs.274
    kafka2.DescribeConfigsResourceResult32a
    name:fetch.max.bytes
    value:57671680
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:fetch.max.bytes
      value:57671680
      source:5
    config_type:3
  configs.275
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.max.retention.bytes
    value:104857600
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.max.retention.bytes
      value:104857600
      source:5
    config_type:5
  configs.276
    kafka2.DescribeConfigsResourceResult32a
    name:compression.type
    value:producer
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:compression.type
      value:producer
      source:5
    config_type:2
  configs.277
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.connect.timeout.ms
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:3
  configs.278
    kafka2.DescribeConfigsResourceResult32a
    name:max.connections.per.ip.overrides
    value:""
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.connections.per.ip.overrides
      value:""
      source:5
    config_type:2
  configs.279
    kafka2.DescribeConfigsResourceResult32a
    name:group.consumer.max.heartbeat.interval.ms
    value:15000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.consumer.max.heartbeat.interval.ms
      value:15000
      source:5
    config_type:3
  configs.280
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.login.refresh.window.factor
    value:0.8
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.login.refresh.window.factor
      value:0.8
      source:5
    config_type:6
  configs.281
    kafka2.DescribeConfigsResourceResult32a
    name:remote.log.metadata.manager.class.path
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.282
    kafka2.DescribeConfigsResourceResult32a
    name:kafka.metrics.polling.interval.secs
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:kafka.metrics.polling.interval.secs
      value:10
      source:5
    config_type:3
  configs.283
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.log.max.record.bytes.between.snapshots
    value:20971520
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.log.max.record.bytes.between.snapshots
      value:20971520
      source:5
    config_type:5
  configs.284
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.max.retention.ms
    value:604800000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.max.retention.ms
      value:604800000
      source:5
    config_type:5
  configs.285
    kafka2.DescribeConfigsResourceResult32a
    name:controller.quorum.election.backoff.max.ms
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:controller.quorum.election.backoff.max.ms
      value:1000
      source:5
    config_type:3
  configs.286
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.max.size
    value:200
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.max.size
      value:200
      source:5
    config_type:4
  configs.287
    kafka2.DescribeConfigsResourceResult32a
    name:max.incremental.fetch.session.cache.slots
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.incremental.fetch.session.cache.slots
      value:1000
      source:5
    config_type:3
  configs.288
    kafka2.DescribeConfigsResourceResult32a
    name:delegation.token.master.key
    read_only:Y
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.289
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.key.password
    read_only:N
    config_source:5
    is_sensitive:Y
    config_type:9
  configs.290
    kafka2.DescribeConfigsResourceResult32a
    name:reserved.broker.max.id
    value:1000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:reserved.broker.max.id
      value:1000
      source:5
    config_type:3
  configs.291
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.remove.expired.transaction.cleanup.interval.ms
    value:3600000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.remove.expired.transaction.cleanup.interval.ms
      value:3600000
      source:5
    config_type:3
  configs.292
    kafka2.DescribeConfigsResourceResult32a
    name:log.message.downconversion.enable
    value:true
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.message.downconversion.enable
      value:true
      source:5
    config_type:1
  configs.293
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.protocol
    value:TLSv1.3
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:ssl.protocol
      value:TLSv1.3
      source:5
    config_type:2
  configs.294
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.log.segment.ms
    value:604800000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:metadata.log.segment.ms
      value:604800000
      source:5
    config_type:5
  configs.295
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.state.log.load.buffer.size
    value:5242880
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.state.log.load.buffer.size
      value:5242880
      source:5
    config_type:3
  configs.296
    kafka2.DescribeConfigsResourceResult32a
    name:ssl.keystore.location
    read_only:N
    config_source:5
    is_sensitive:N
    config_type:2
  configs.297
    kafka2.DescribeConfigsResourceResult32a
    name:group.coordinator.append.linger.ms
    value:10
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.coordinator.append.linger.ms
      value:10
      source:5
    config_type:3
  configs.298
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.enabled.mechanisms
    value:GSSAPI
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.enabled.mechanisms
      value:GSSAPI
      source:5
    config_type:7
  configs.299
    kafka2.DescribeConfigsResourceResult32a
    name:num.replica.alter.log.dirs.threads
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:3
  configs.300
    kafka2.DescribeConfigsResourceResult32a
    name:group.share.max.session.timeout.ms
    value:60000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.share.max.session.timeout.ms
      value:60000
      source:5
    config_type:3
  configs.301
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.cipher.suites
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:7
  configs.302
    kafka2.DescribeConfigsResourceResult32a
    name:group.min.session.timeout.ms
    value:6000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.min.session.timeout.ms
      value:6000
      source:5
    config_type:3
  configs.303
    kafka2.DescribeConfigsResourceResult32a
    name:log.cleaner.io.buffer.load.factor
    value:0.9
    read_only:N
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:log.cleaner.io.buffer.load.factor
      value:0.9
      source:5
    config_type:6
  configs.304
    kafka2.DescribeConfigsResourceResult32a
    name:transaction.max.timeout.ms
    value:900000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:transaction.max.timeout.ms
      value:900000
      source:5
    config_type:3
  configs.305
    kafka2.DescribeConfigsResourceResult32a
    name:metadata.log.dir
    read_only:Y
    config_source:5
    is_sensitive:N
    config_type:2
  configs.306
    kafka2.DescribeConfigsResourceResult32a
    name:process.roles
    value:broker,controller
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:process.roles
      value:broker,controller
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:process.roles
      value:""
      source:5
    config_type:7
  configs.307
    kafka2.DescribeConfigsResourceResult32a
    name:group.max.size
    value:2147483647
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:group.max.size
      value:2147483647
      source:5
    config_type:3
  configs.308
    kafka2.DescribeConfigsResourceResult32a
    name:sasl.oauthbearer.jwks.endpoint.retry.backoff.max.ms
    value:10000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:sasl.oauthbearer.jwks.endpoint.retry.backoff.max.ms
      value:10000
      source:5
    config_type:5
  configs.309
    kafka2.DescribeConfigsResourceResult32a
    name:delegation.token.max.lifetime.ms
    value:604800000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:delegation.token.max.lifetime.ms
      value:604800000
      source:5
    config_type:5
  configs.310
    kafka2.DescribeConfigsResourceResult32a
    name:max.request.partition.size.limit
    value:2000
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:max.request.partition.size.limit
      value:2000
      source:5
    config_type:3
  configs.311
    kafka2.DescribeConfigsResourceResult32a
    name:broker.id
    value:1
    read_only:Y
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:broker.id
      value:1
      source:4
    synonyms.1
      kafka2.DescribeConfigsSynonym32a
      name:broker.id
      value:-1
      source:5
    config_type:3
  configs.312
    kafka2.DescribeConfigsResourceResult32a
    name:offsets.topic.compression.codec
    value:0
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:offsets.topic.compression.codec
      value:0
      source:5
    config_type:3
  configs.313
    kafka2.DescribeConfigsResourceResult32a
    name:zookeeper.ssl.endpoint.identification.algorithm
    value:HTTPS
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:zookeeper.ssl.endpoint.identification.algorithm
      value:HTTPS
      source:5
    config_type:2
  configs.314
    kafka2.DescribeConfigsResourceResult32a
    name:replication.quota.window.num
    value:11
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:replication.quota.window.num
      value:11
      source:5
    config_type:3
  configs.315
    kafka2.DescribeConfigsResourceResult32a
    name:advertised.listeners
    value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104
    read_only:N
    config_source:4
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:advertised.listeners
      value:PLAINTEXT://dev.ak-8.kafka-1.ext:1031,SSL://dev.ak-8.kafka-1.ext:1034,INTERNAL://dev.ak-8.kafka-1.int:1104
      source:4
    config_type:2
  configs.316
    kafka2.DescribeConfigsResourceResult32a
    name:queued.max.request.bytes
    value:-1
    read_only:Y
    config_source:5
    is_sensitive:N
    synonyms.0
      kafka2.DescribeConfigsSynonym32a
      name:queued.max.request.bytes
      value:-1
      source:5
    config_type:5

