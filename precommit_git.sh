#!/bin/bash
set -x
set -e
##### clean all generated code and data
##### to be used before openacr repo commit
git restore --source=HEAD -- include/
git restore --source=HEAD -- cpp/gen
git restore --source=HEAD -- data/
git restore --source=HEAD -- txt/
git reset HEAD include/
git reset HEAD cpp/gen
git reset HEAD data/
git reset HEAD txt/

# removing all from bin removes too much 
# git restore --source=HEAD -- bin/
# git reset HEAD bin/
rm  bin/myns
git add .