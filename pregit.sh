#!/bin/bash
set -x
set -e
##### to be used before openacr repro commit 
# reset git to last commit and checkout my files, removing acr generated files
cd /home/pgmabv/openacr
source /home/pgmabv/openacrav/backup_git.sh
restore_backup_git