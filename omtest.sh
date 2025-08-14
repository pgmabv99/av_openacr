bin/omcli  -selector:dev.x2-4 -omtest:x2_omcli_options -ci:Y -omrun_minutes:1
bin/omcli  -selector:dev.x2-4 -omtest:x2_kcat_100b_1 -ci:Y -omrun_minutes:1

bin/omcli  -selector:dev.x2-4 -omtest:% -ci:Y -omrun_minutes:1

atf_ci -cijob:envx2 -check_clean:N -v
