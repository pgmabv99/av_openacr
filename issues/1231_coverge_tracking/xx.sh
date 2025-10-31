git clean -f -d -x 
ai
abt_ts -build

atf_ci -cijob:coverage -v -v -v > /home/avorovich/av_openacr/issues/1231_coverge_tracking/maxjobs1a.log  2>&1



bash  -c $'bin/atf_cov  -covdir:temp/atf_comp/cov.d/2 -logfile:temp/atf_comp/cov.d/2/kapi.CreateTopicsReqV5rdp.atf_cov.log -runcmd:$\'build/coverage/kapi -decode -hex -pretty -req:-\' -incremental:Y' <temp/atf_comp/kapi.CreateTopicsReqV5rdp.in >temp/atf_comp/kapi.CreateTopicsReqV5rdp.out 2>&1
bin/atf_cov  -covdir:temp/atf_comp/cov.d/2 -logfile:temp/atf_comp/cov.d/2/kapi.CreateTopicsReqV5rdp.atf_cov.log -runcmd:'build/coverage/kapi -decode -hex -pretty -req:-' -incremental:Y <temp/atf_comp/kapi.CreateTopicsReqV5rdp.in >temp/atf_comp/kapi.CreateTopicsReqV5rdp.out 2>&1

rm temp/atf_comp/cov.d/2/kapi.CreateTopicsReqV5rdp.atf_cov.log

bin/atf_cov \
  -covdir:temp/atf_comp/cov.d/2 \
  -logfile:temp/atf_comp/cov.d/2/kapi.CreateTopicsReqV5rdp.atf_cov.log \
  -runcmd:'build/coverage/kapi -decode -hex -pretty -req:-' \
  -incremental:Y \
  -v \
  <temp/atf_comp/kapi.CreateTopicsReqV5rdp.in \
  >temp/atf_comp/kapi.CreateTopicsReqV5rdp.out 2>&1

cat temp/atf_comp/cov.d/2/kapi.CreateTopicsReqV5rdp.atf_cov.log
cat temp/atf_comp/cov.d/2/kapi.ListGroupsRspV4rdp.atf_cov.log
ls temp/atf_comp/cov.d/2/kapi.*.atf_cov.log -ltr
ls temp/atf_comp/cov.d/2/*.gcda -ltr

cp temp/atf_comp/cov.d/2/#home#avorovich#arnd#build#coverage#cpp.gen.kafka2_gen.gcda \
   build/coverage/


for d in temp/atf_comp/cov.d/*; do
  [ -d "$d" ] && echo "$(basename "$d"): $(find "$d" -type f -name '*.gcda' | wc -l)"
done
1: 205
2: 213
3: 215

$ for d in temp/atf_comp/cov.d/*; do
  [ -d "$d" ] && echo "$(basename "$d"): $(find "$d" -type f -name '*.gcda' | wc -l)"
done
1: 199
2: 203
3: 205

bin/atf_cov  -covdir:temp/atf_comp/cov.d -logfile:temp/atf_comp/cov.d/atf_cov.log -mergepath:'temp/atf_comp/cov.d/1:temp/atf_comp/cov.d/2:temp/atf_comp/cov.d/3' -gcov:Y -ssim:Y -report:Y -check:Y
cat temp/atf_comp/cov.d/summary.txt


# at err see cov.d/1 vs 3 

verbose: atf_comp.test_start  comptest:kapi.CreateTopicsReqV5rdp  n_running:3  ncore_used:3  outfile:temp/atf_comp/kapi.CreateTopicsReqV5rdp.out
verbose: atf_comp kapi.CreateTopicsReqV5rdp -report:N -printinput | kapi -decode -hex -pretty -req:-
verbose: bash  -c $'bin/atf_cov  -covdir:temp/atf_comp/cov.d/3 -logfile:temp/atf_comp/cov.d/3/kapi.CreateTopicsReqV5rdp.atf_cov.log -runcmd:$\'build/coverage/kapi -decode -hex -pretty -req:-\' -incremental:Y' <temp/atf_comp/kapi.CreateTopicsReqV5rdp.in >temp/atf_comp/kapi.CreateTopicsReqV5rdp.out 2>&1
verbose: # ----- test output -----
verbose: kafka2.ApiVersionsRequest
verbose:     request_api_version: 3
verbose:     correlation_id: 1
verbose:     client_id: redpanda-console
verbose:     client_software_name: kgo
verbose:     client_software_version: v1.18.0
verbose: 
verbose: libgcov profiling error:temp/atf_comp/cov.d/1/#home#avorovich#arnd#build#coverage#cpp.gen.kafka2_gen.gcda:Merge mismatch for function 1549
verbose: 