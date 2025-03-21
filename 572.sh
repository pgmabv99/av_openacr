#!/bin/bash
set -x
set -e

525.sh atf_snf



# one time only !!!!!!!!!!!!!!!!!!
# acr_ed -create -srcfile cpp/$trg/parse.cpp -write -comment "parsing frames and kafka req/rsp  "
# acr_ed -create -srcfile cpp/$trg/utils.cpp -write -comment "utility"