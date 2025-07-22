#!/bin/bash
latest_core=$(ls -t core.x2gw.* | head -n 1)
gdb -batch \
  -ex "info threads" \
  -ex "thread apply all bt full" \
  -ex " bt " \
  ./bin/x2gw $latest_core > temp/x2sup_logs/$latest_core.log