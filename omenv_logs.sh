#!/bin/bash
# rsync logs
omenv=dev.x2-4
atf_snf  -omenv_logs:$omenv -out_solo_dir:$omenv
