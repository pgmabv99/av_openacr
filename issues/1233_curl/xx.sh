

curl  -f https://httpbin.org/status/404
echo retcode=$?
curl    https://httpbin.org/status/404
echo retcode=$?

omcli         dev.x2-4 -omtest:x2_api_jq_all > /home/avorovich/av_openacr/issues/1233_curl/xx.log 2>&1
omcli         dev.x2-4 -omtest:x2_api_jq_all > /home/avorovich/av_openacr/issues/1233_curl/xxjunk.log 2>&1
normalize envx2 > /home/avorovich/av_openacr/issues/1233_curl/envx2.log 2>&1