atf_ci -cijob:envx2 -citest:smokex2_eth > temp/envx22.log


bin/omcli  -selector:dev.x2-4 -omtest:x2_omcli_options -ci:Y -omrun_minutes:1 -v > temp/omtest_all.log 2>&1
bin/x2rel  -omenv:dev.x2-4 -upload:Y -start:Y -build:N