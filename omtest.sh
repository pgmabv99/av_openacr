bin/omcli  -selector:dev.x2-4 -omtest:x2_nodeintf_state_test -ci:Y 
bin/omcli  -selector:dev.x2-4.x2-0 -x2cli_shell
bin/omcli  -selector:dev.x2-4.x2-0 -x2cli_cmd:nodeintf

sudo ip link set ib0-4 down

bin/omcli  -selector:dev.x2-4 -omtest:x2_omcli_options -ci:Y 
bin/omcli  -selector:dev.x2-4 -omtest:x2_kcat_100b_1 -ci:Y 

bin/omcli  -selector:dev.x2-4 -omtest:% -ci:Y -omrun_minutes:1

atf_ci -cijob:envx2 -check_clean:N -v
