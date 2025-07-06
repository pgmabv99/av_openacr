#!/bin/bash
# # rsync logs
# omenv=dev.x2-4
# atf_snf  -omenv_logs:$omenv -out_solo_dir:$omenv  -dir:$HOME/av_openacr/omenv_logs/
 omcli dev.x2-4.x2-% -collect_logs
 omcli dev.x2-4.x2-1 -collect_logs -ignore_omnode_use 