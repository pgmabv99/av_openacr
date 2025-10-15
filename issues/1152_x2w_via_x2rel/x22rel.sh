x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y -v

exit
 x2rel  -create  -product:"x2w" -omenv:dev.x2-4 -upload:Y  -create:Y -v
verbose: bash  -c bin/ai
abt.config  builddir:Linux-g++.release-x86_64  ood_src:493  ood_target:103  cache:none
abt.build  line_n:492,398  built_n:492,398  job_n:0  complete:100%
report.abt  n_target:113  time:00:01:04.875782954  hitrate:""  pch_hitrate:""  n_warn:0  n_err:0  n_install:113
verbose: git log --pretty=format:'%ad.%h' --date=short -1
verbose: bash  -c $'git log --pretty=format:\'%ad.%h\' --date=short -1' >&5
verbose: set -e
verbose: rm -rf temp/release/x2w.*
verbose: mkdir -p temp/release/x2w.2025-10-07.20c4d7b2c temp/release/x2w.2025-10-07.20c4d7b2c/data
verbose: acr_in "$(acr prodtarget:x2w/% -regxof:ns)" -data | acr -in:temp/release/x2w.2025-10-07.20c4d7b2c/data -insert -write -print:N -report:N
verbose: acr -in:temp/release/x2w.2025-10-07.20c4d7b2c/data x2db.topo:% -del -write -print:N -report:N
verbose: mkdir -p temp/release/x2w.2025-10-07.20c4d7b2c/bin
verbose: acr -report:N prodtarget:x2w/% -cmd 'cp -H bin/$ns temp/release/x2w.2025-10-07.20c4d7b2c/bin/' | bash
verbose: 
verbose: bash  -c $'set -e\nrm -rf temp/release/x2w.*\nmkdir -p temp/release/x2w.2025-10-07.20c4d7b2c temp/release/x2w.2025-10-07.20c4d7b2c/data\nacr_in "$(acr prodtarget:x2w/% -regxof:ns)" -data | acr -in:temp/release/x2w.2025-10-07.20c4d7b2c/data -insert -write -print:N -report:N\nacr -in:temp/release/x2w.2025-10-07.20c4d7b2c/data x2db.topo:% -del -write -print:N -report:N\nmkdir -p temp/release/x2w.2025-10-07.20c4d7b2c/bin\nacr -report:N prodtarget:x2w/% -cmd \'cp -H bin/$ns temp/release/x2w.2025-10-07.20c4d7b2c/bin/\' | bash\n'
x2rel.info  release:temp/release/x2w.2025-10-07.20c4d7b2c  comment:"release completed"
x2rel.release  product:x2w  nodes:"(dev.x2w-08)"  filename:x2w.2025-10-07.20c4d7b2c
verbose: bash  -c $'bin/x2node  -node:$\'(dev.x2w-08)\' -cmd:\'mkdir -p reldir/x2w.2025-10-07.20c4d7b2c\''
x2node.info node:dev.x2w-08  cmd:"ssh -q x2w@dev.x2w-08 mkdir -p reldir/x2w.2025-10-07.20c4d7b2c"
x2node.info  ncmd:1  completed:1  success:1  failure:0
verbose: bash  -c $'bin/x2node  -node:$\'(dev.x2w-08)\' -rsync_put:Y -rsync_opts:\' -ac\' -local:temp/release/x2w.2025-10-07.20c4d7b2c -remote:reldir -cmd:$\'$\\\'rm -f release; ln -sf reldir/x2w.2025-10-07.20c4d7b2c release\\\'\' -q:Y'
[0 Oct 08 12:12:56] avorovich@nj1.sn5.user-avorovich:~/arnd 
$ 