#!/bin/bash
set -x
cd $HOME/openacr

rm -rf data/test
mkdir -p data/test
rm -rf data/dmmeta
mkdir -p data/dmmeta

cat > data/test/project.ssim << EOF
test.project  project:project1
test.project  project:project2
EOF

cat > data/test/part.ssim << EOF
test.part  part:part1
test.part  part:part2
EOF

cat > data/test/partproj.ssim << EOF
test.partproj  part:part1  project:project1
test.partproj  part:part2  project:project1
EOF

cat > data/dmmeta/ssimfile.ssim << EOF
dmmeta.ssimfile  ssimfile:dmmeta.ssimfile
dmmeta.ssimfile  ssimfile:test.part
dmmeta.ssimfile  ssimfile:test.partproj
dmmeta.ssimfile  ssimfile:test.project
EOF