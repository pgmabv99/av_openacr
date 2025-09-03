
# ACR notes

## to filter fields
 acr dmmeta.field:atf_snf.%ctrport%
 acr dmmeta.field:atf_snf.FDb.ind_%

## to show all dependencies
```
acr dmmeta.ns:atf_snf  -ndown 99  -tree -e
acr dmmeta.ns:atfdb  -ndown 99  -tree -e
acr dmmeta.ns:atf_snf  -ndown 99  -tree > ~/av_openacr/atf_snf.sh
acr dmmeta.ns:omcli -ndown 99  -tree > ~/av_openacr/omcli.sh

  dmmeta.fcleanup  field:atf_spdk.FCtrlr.ctrlr  comment:""


    # dmmeta.field  field:atf_spdk.FDb.av22         acr.rowid:2       arg:u64                     reftype:Val   dflt:""  comment:""

(venv) pgmabv@DESKTOP-3DQ1QS6:~/openacr$ acr dev.targsrc:atf_snf/cpp/atf_snf/%.%
dev.targsrc  targsrc:atf_snf/cpp/atf_snf/atf_snf.cpp  comment:""
dev.targsrc  targsrc:atf_snf/cpp/atf_snf/util.cpp  comment:""
dev.targsrc  targsrc:atf_snf/cpp/atf_snf/util.h    comment:""
```

## To Show code

```bash
# All generated C code
amc atf_snf.%

# Show prototypes
amc atf_snf.%TKaf% -proto
amc algo.% -proto


 grep -rE 'kafka_corr_id.*\(' cpp include
 grep -rE 'kafka_corr_id.{0,20}\(' cpp include
```
## to add ctype to read ssim in mmemory
```
$ git diff HEAD -- data/ | grep '^+[^+]'
+dmmeta.ctype  ctype:omcli.FNodeintf  comment:""
+dmmeta.field  field:omcli.FDb.nodeintf  arg:omcli.FNodeintf  reftype:Lary  dflt:""  comment:""
+dmmeta.field  field:omcli.FNodeintf.base  arg:x2db.Nodeintf  reftype:Base  dflt:""  comment:""
```
acr_ed -create -finput -target:omcli ssimfile:x2db.nodeintf
acr_ed -create -finput -target:omcli  -ssimfile:x2db.nodeintf -write 
## Visuals

```bash
amc_vis atf_spdk.% > $HOME/av_openacr/atf_spdk_viz.txt
amc_vis atfdb.% > $HOME/av_openacr/atfdb_viz.txt
amc_vis x2net.% > $HOME/av_openacr/x2net_viz.txt
amc_vis omcli.% > $HOME/av_openacr/omcli_viz.txt
amc_vis dmmeta.'(Ctype|Field|Ns)'
```
to see all bad ref
``` acr -check %
```

## Visuals SVG

```bash
amc_vis atf_snf.% 
amc_vis atf_snf.% -dot:av_openacr/pic
dot -Tsvg av_openacr/pic -o av_openacr/pic.svg
amc_vis samp_meng.% -dot:av_openacr/meng
dot -Tsvg av_openacr/meng -o av_openacr/meng.svg
```
## to run pipeline locally 

cpp-indent cpp/atf_snf/atf_snf.cpp
atf_ci -cijob:% -check_clean:N |& timestamps
atf_ci -cijob:envx2 -check_clean:N |& timestamps
// show tests
acr atfdb.cijob:% -ndown 1 -tree

//remove nre tests from current commit
git restore --source=HEAD~1 --staged --worktree -- test/atf_comp/
git restore --source=HEAD~1 --staged --worktree -- data/atfdb
git restore --source=HEAD~1 --staged --worktree -- data/dev/gitfile.ssim


## To See Prefixes

```bash
(base) pgmabv@avlaptop:~/openacr$ acr fprefix | ssimfilt ^ -t
FPREFIX  REFTYPE  COMMENT
bh       Bheap    Binary heap
c        Ptrary   Pointer array
cd       Llist    Circular doubly linked list
cdl      Llist    Circular doubly linked LIFO list
cnt      Count    Count of items
cs       Llist    Circular singly linked list
csl      Llist    Circular singly linked LIFO list
ind      Thash    Hash table (index)
p        Upptr    Up-pointer: equivalent of Pkey reference for in-memory model
tr       Atree    AVL tree
zd       Llist    Zero-terminated doubly linked list
zdl      Llist    Zero-terminated doubly linked LIFO list
zs       Llist    Zero-terminated singly linked list
zsl      Llist    Zero-terminated singly linked LIFO list
```

## gdb vscode

to allow think time in debugging

sed -i 's/hbtimeout:30/hbtimeout:10000/g' data/x2db/proc.ssim
## Git cheat sheet

git push   #to defalt remote

git push ssh://git@gitlab.vovaco.com:1008/algornd/arnd.git HEAD  --force  #non-default 
git log --oneline HEAD..FETCH_HEAD    dif:  HEAD munus FETCH_HEAD


### Separate generated code

```bash
git show | nogen
git show HEAD~1 | nogen
git show HEAD~3..HEAD |nogen
```
### git log

```
git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=short``

We have a merge driver called acr_dm ("acr diff merge" -- txt/exe/acr_dm/README.md) which can be installed with the bin/gitconfig-setup script. It automatically resolves conflicts in ssim files because it understands that nearby lines are not logically related (by default, git treats files like code, where nearby changes are considered a conflict). acr_dm can even resolve 3-way merges where one branch changes attribute A and another changes attribute B - it's not a conflict because different attributes were changed.

```
### git work flow items
git-rebase-remote algornd/arnd  
normalize_loop
acr % -check -write 
atf_comp  
atf_comp -covcapture
git-add-to-last-commi
git push --force 
git push algornd/arnd HEAD --force

git branch --set-upstream-to=algornd/arnd/$(git rev-parse --abbrev-ref HEAD)



```
### gitlab  work flow items
```
# token in github 
gcli repo -create token:<token> host:https://gitlab.vovaco.com/
gcli repo -update algornd/arnd


#creates issue  
gcli -create  
#create local branch
gcli 999 -start  
#edit issue
gcli arnd.999 -e
#push local branch and create draft MR
gcli mr -create 
#list mr
gcli mr
#remove draft status
gcli mr:9999 -approve

```
### To Keep My Repo Under OpenACR Without Affecting Main Branch

Add to this `.git\info\exclude`:

```
av_openacr
.gitmodules
```

## git rebase

when conflict in in gen files
amc
git add */gen

///
in master 
abt amc
git status --short
## git login cheat sheet

#for arnd gitlab use ssh private key
git config --global core.sshCommand "ssh -i /home/avorovich/.ssh/algox2_av"
git config --global core.sshCommand "ssh -i /home/x2usr/.ssh/algox2_av"
git config --global core.sshCommand "ssh -i /home/x2usr/.ssh/algox2_gitlab"

cd arnd
gitconfig-setup
ai

#for av_openacl github use token (gdrive) 
git clone https://pgmabv99:<avtoken4>@github.com/pgmabv99/algo_util.git


or 
chmod 600 ~/.ssh/algox2_av

#Start the SSH agent if it's not already running
eval "$(ssh-agent -s)"

#Add the SSH key
ssh-add ~/.ssh/algox2_av

#Confirm the key was added
ssh-add -l

## git cherry pick

465c66d7 (HEAD -> algornd/arnd.604, origin/algornd/arnd.604) Issue algornd/arnd#604 atf_snf should detect if the device is in usegco 

# acr docker cheat sheet
```
#log to host of sn5 from sn1
x2ipmi -device:nj1.sv5 -sol
to exit
~.
#from sn1: login from sn1 to sn5 container
x2node  -node:nj1.sn5.avorovich 
x2node  -node:nj1.sn5.kafka-4 


#from sn1: login  to host 
x2node  -node:nj1.sn5.bm -root
x2node  -node:nj1.sn1.bm -root

#from sn1 : docker rm and docker start new container
dkr -help



#passtru cat /etc/hostname
#from sn1 : ps 
dkr ps   -node:nj1.sn5.avorovich 

docker exec -u root  2ed30abac818 mount --bind /lib/modules /lib/modules





## private keys 
x2ssh clean
x2ssh start
sed -i 's/id_rsa/algox2_av/g'  ~/.ssh/config.d/*
sed -i 's/dkr/algox2_av/g'  ~/.ssh/config.d/*
algo_x2: laptop->nj1.sn1.avorovich
algo_x2: laptop->dev.x2-17
algo_x2:  nj1.sn1.avorovich->dev.x2-17
algo_x2:  nj1.sn1.avorovich->gitlab

## hosts for brokers directly
sudo bash -c 'cat >> catts <<EOF
192.168.10.21  dev.x2-4.kafka-1.ctrl-0
192.168.104.2  dev.x2-4.kafka-1.ext-0
192.168.214.2  dev.x2-4.kafka-1.ib-0
192.168.204.2  dev.x2-4.kafka-1.int-0
192.168.10.31  dev.x2-4.kafka-2.ctrl-0
192.168.104.3  dev.x2-4.kafka-2.ext-0
192.168.214.3  dev.x2-4.kafka-2.ib-0
192.168.204.3  dev.x2-4.kafka-2.int-0
192.168.10.41  dev.x2-4.kafka-3.ctrl-0
192.168.104.4  dev.x2-4.kafka-3.ext-0
192.168.214.4  dev.x2-4.kafka-3.ib-0
192.168.204.4  dev.x2-4.kafka-3.int-0
192.168.10.51  dev.x2-4.kafka-4.ctrl-0
192.168.104.5  dev.x2-4.kafka-4.ext-0
192.168.214.5  dev.x2-4.kafka-4.ib-0
192.168.204.5  dev.x2-4.kafka-4.int-0
EOF'


## regex for  strings

^(?=.*name_Set)(?=.*MetadataResponseTopic)



## todo
-duplicate corr_id in rdp ??

x2sup -v -v
atf_x2
x2gw
netcat
acr 
kapi


-add errcheck in x2node for failed key

# nullable field in kafka
metadata

{ "name": "Name", "type": "string", "versions": "0+", "mapKey": true, "entityType": "topicName", "nullableVersions": "12+",


describelogsdirs

{ "name": "Name", "type": "string", "versions": "0+", "entityType": "topicName",



// only last node visible to nic on sn5
omdb.omnode  omnode:dev.x2-4.x2-0  node:dev.x2-17  use:N  comment:"x2 Broker node 1"
omdb.omnode  omnode:dev.x2-4.x2-1  node:dev.x2-18  use:N  comment:"x2 Broker node 2"
omdb.omnode  omnode:dev.x2-4.x2-2  node:dev.x2-19  use:N  comment:"x2 Broker node 3"
omdb.omnode  omnode:dev.x2-4.x2-3  node:dev.x2-20  use:Y  comment:"x2 Broker node 4"

// 1 vs N consumer
omdb.omlattr  omlattr:debug-workload100/consumerPerSubscription  uval:1


dmmeta.field  field:command.omcli.collect_logs_dir  arg:algo.cstring    reftype:Val  dflt:'"test1"'  comment:"subfolder for collected logs  under temp/omenv/"

actions for atf_snf part3
-pcap to dirs call in the same folder
-kill do not create logs files



targs.ssim - main file with invocation
tmsg.ssim -one line per  
test/atf_comp/atf_x2.Cli -output  

# sync
x2node -node:nj1.sn5.bm -rsync_put -local /home/avorovich/av_openacr/dev.ak-8.tap-4_ext_0 -remote dev.ak-8.tap-4_ext_0 
omdb.omnode  omnode:dev.ak-8.tap-1_ext_0  node:dev.kafka-01  use:Y  comment:"kafka broker sniffer for node 1"


$ acr omnode:dev.ak-8.%
omdb.omnode  omnode:dev.ak-8.kafka-1      node:dev.kafka-01   use:Y  comment:"Apache Cluster Broker node 1"
omdb.omnode  omnode:dev.ak-8.kafka-2      node:dev.kafka-02   use:Y  comment:"Apache Cluster Broker node 2"
omdb.omnode  omnode:dev.ak-8.kafka-3      node:dev.kafka-03   use:Y  comment:"Apache Cluster Broker node 3"
omdb.omnode  omnode:dev.ak-8.kafka-4      node:dev.kafka-04   use:Y  comment:"Apache Cluster Broker node 4"
omdb.omnode  omnode:dev.ak-8.kafkaui-1    node:dev.kafkaui-1  use:Y  comment:"Apache Cluster Provectus UI node"
omdb.omnode  omnode:dev.ak-8.kafkaw-1     node:dev.kafkaw-08  use:Y  comment:"Apache Cluster Worker 5 node"
omdb.omnode  omnode:dev.ak-8.kafkaw-2     node:dev.kafkaw-16  use:Y  comment:"Apache Cluster Worker 6 node"
omdb.omnode  omnode:dev.ak-8.rdpui-1      node:dev.rdpui-1    use:Y  comment:"Apache Cluster Redpanda UI node"
omdb.omnode  omnode:dev.ak-8.tap-1_ext_0  node:nj1.sn2.bm     use:Y  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-2_ext_0  node:nj1.sn3.bm     use:Y  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-3_ext_0  node:nj1.sn4.bm     use:Y  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-4_ext_0  node:nj1.sn5.bm     use:Y  comment:sniffer
omdb.omnode  omnode:dev.ak-8.x2w-1        node:dev.x2w-01     use:Y  comment:"x2w for tests"


dkrusr@nj1.sv5:~$ pgrep -f "dev.ak-8.tap-4_ext_0" 
2336548
dkrusr@nj1.sv5:~$ ps -ef | grep 2336548
avorovi+ 2336548 2333449  0 11:59 ?        00:00:00 omcli dev.ak-8.tap-4_ext_0 -shell
avorovi+ 2336549 2336548  0 11:59 ?        00:00:00 bin/x2node -node:nj1.sn5.bm -shell:Y
dkrusr   2336828 2336556  0 12:00 pts/2    00:00:00 grep --color=auto 2336548


1. why omtype is static and requires amc ?
2. shar

omdb.omnode  omnode:dev.ak-8.kafka-1  node:dev.kafka-01  use:N  comment:"Apache Cluster Broker node 1"
omdb.omnode  omnode:dev.ak-8.kafka-2  node:dev.kafka-02  use:N  comment:"Apache Cluster Broker node 2"
omdb.omnode  omnode:dev.ak-8.kafka-3  node:dev.kafka-03  use:N  comment:"Apache Cluster Broker node 3"
omdb.omnode  omnode:dev.ak-8.kafka-4  node:dev.kafka-04  use:Y  comment:"Apache Cluster Broker node 4"
omdb.omnode  omnode:dev.ak-8.kafkaui-1  node:dev.kafkaui-1  use:Y  comment:"Apache Cluster Provectus UI node"
omdb.omnode  omnode:dev.ak-8.kafkaw-1  node:dev.kafkaw-08  use:Y  comment:"Apache Cluster Worker 5 node"
omdb.omnode  omnode:dev.ak-8.kafkaw-2  node:dev.kafkaw-16  use:Y  comment:"Apache Cluster Worker 6 node"
omdb.omnode  omnode:dev.ak-8.rdpui-1  node:dev.rdpui-1  use:Y  comment:"Apache Cluster Redpanda UI node"
omdb.omnode  omnode:dev.ak-8.tap-1_ext_0  node:nj1.sn2.bm  use:N  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-2_ext_0  node:nj1.sn3.bm  use:N  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-3_ext_0  node:nj1.sn4.bm  use:N  comment:sniffer
omdb.omnode  omnode:dev.ak-8.tap-4_ext_0  node:nj1.sn5.bm  use:Y  comment:sniffer
omdb.omnode  omnode:dev.ak-8.x2w-1  node:dev.x2w-01  use:Y  comment:"x2w for tests"


# questions from 8/1/2025

q1: in the process tree of omcli : why inject  bash and not  call executable directly via omcli_exec
q2; is -v passed down process tree ? hard to debug 
q3: omplat vs. use bit vs. selector. alternative  :  separate client  and server selectors. 
q4: -collect_logs - adding omplat subfolder is misleading just like any other attributes of the !!previous!! omcli run . it should be user assigned

todo
-add 3 more taps
-call colect_log from -omtest
-add bench json to -collect log


Questions  8/6

-do we need live log from benchmark . to do it we need ssh calling bash calling  tee
-x2node vs direct call to ssh. VP to do do
-passing -v to subprocesss
-do we need so much nesting of omcli
-3 selectors vs omplat + use bits




// --- omcli.FDb.omtest.LoadStatic
static void omcli::omtest_LoadStatic() {
    static struct _t {
        const char *s;
        void (*step)(omcli::FOmenv&);
    } data[] = {
        { "omdb.omtest  omtest:debug_benchmark  comment:\"special run openmessaging benchmark\"", omcli::omtest_debug_benchmark }
        ,{ "omdb.omtest  omtest:debug_benchmark_idempotence  comment:\"special run openmessaging benchmark\"", omcli::omtest_debug_benchmark_idempotence }
        ,{ "omdb.omtest  omtest:docker_restart  comment:\"-clean_run the environment\"", omcli::omtest_docker_restart }
        ,{ "omdb.omtest  omtest:kcat_plaintext_L  comment:\"run kcat -L to see meta\"", omcli::omtest_kcat_plaintext_L }
        ,{ "omdb.omtest  omtest:kcat_ssl_L  comment:\"run kcat -L  with ssl to see meta\"", omcli::omtest_kcat_ssl_L }
        ,{ "omdb.omtest  omtest:om_benchmark  comment:\"run openmessaging benchmark\"", omcli::omtest_om_benchmark }



 omcli dev.x2-4 -omtest:debug_benchmark -omplat:ak -v
  |
 \ /
 omcli  -selector:dev.x2-4.% -omplat:ak -omtest:om_benchmark -omrun_driver:kafka-debug -omrun_load:debug-workload100 -v 
  |
 \ /
 cursor over 
 verbose: bash  -c $'bin/x2node  -node:dev.kafkaw-04 -cmd:\'bin/benchmark --drivers kafka-debug.yaml debug-workload100.yaml\' -q:Y' >&5
  |
 \ /
verbose: ssh -q kafkawrkr@dev.kafkaw-04 bin/benchmark --drivers kafka-debug.yaml debug-workload100.yaml


 cursor over
 verbose: bash  -c $'ssh kafkawrkr@dev.kafkaw-04 \'bin/benchmark --drivers kafka-debug.yaml debug-workload100.yaml 2>&1 | tee benchmark_stdout.log\'' >&5

   

  "format.class": "io.confluent.connect.s3.format.json.JsonFormat",
                   io.confluent.connect.s3.format.json.JsonFormat  -used by sink
    "message": "Connector configuration is invalid and contains the following 1 error(s):\nInvalid value class io.confluent.connect.s3.format.json.JsonFormat for configuration format.class: Class must extend: io.confluent.connect.cloud.storage.source.StorageObjectFormat\nYou can also find the above list of errors at the endpoint `/connector-plugins/{connectorType}/config/validat

      "format.class": "io.confluent.connect.s3.source.json.JsonFormat",
      same as above


      from confluent doc
      
      format.class
Class responsible for converting S3 objects to source records.

Type: class
Valid Values:
io.confluent.connect.s3.format.avro.AvroFormat
io.confluent.connect.s3.format.bytearray.ByteArrayFormat
io.confluent.connect.s3.format.json.JsonFormat
io.confluent.connect.s3.format.string.StringFormat
Importance: high

    "format.class": "io.confluent.connect.storage.format.json.JsonFormat",
    --that gives class not found

    ==== used by sink
    io.confluent.connect.s3.format.json.JsonFormat



    $ acr omnode:dev.x2-4%
omdb.omnode  omnode:dev.x2-4.kafka-1      node:dev.kafka-13    use:Y  comment:"kafka Broker node 1"
omdb.omnode  omnode:dev.x2-4.kafka-2      node:dev.kafka-14    use:Y  comment:"kafka Broker node 2"
omdb.omnode  omnode:dev.x2-4.kafka-3      node:dev.kafka-15    use:Y  comment:"kafka Broker node 3"
omdb.omnode  omnode:dev.x2-4.kafka-4      node:dev.kafka-16    use:Y  comment:"kafka Broker node 4"
omdb.omnode  omnode:dev.x2-4.kafkacw-1    node:dev.kafkacw-02  use:Y  comment:"s3 sink for tests"
omdb.omnode  omnode:dev.x2-4.kafkaui-1    node:dev.kafkaui-5   use:Y  comment:"Provectus UI node"
omdb.omnode  omnode:dev.x2-4.kafkaw-1     node:dev.kafkaw-04   use:Y  comment:""
omdb.omnode  omnode:dev.x2-4.kafkaw-2     node:dev.kafkaw-12   use:Y  comment:""
omdb.omnode  omnode:dev.x2-4.minio-1      node:dev.minio-02    use:Y  comment:"Apache Cluster s3"
omdb.omnode  omnode:dev.x2-4.rdp-1        node:dev.rdp-13      use:Y  comment:"rdp Broker node 1"
omdb.omnode  omnode:dev.x2-4.rdp-2        node:dev.rdp-14      use:Y  comment:"rdp Broker node 2"
omdb.omnode  omnode:dev.x2-4.rdp-3        node:dev.rdp-15      use:Y  comment:"rdp Broker node 3"
omdb.omnode  omnode:dev.x2-4.rdp-4        node:dev.rdp-16      use:Y  comment:"rdp Broker node 4"
omdb.omnode  omnode:dev.x2-4.rdpui-1      node:dev.rdpui-5     use:Y  comment:"Redpanda UI node"
omdb.omnode  omnode:dev.x2-4.tap-1_ext_0  node:nj1.sn2.bm      use:Y  comment:sniffer
omdb.omnode  omnode:dev.x2-4.tap-4_ext_0  node:nj1.sn5.bm      use:Y  comment:sniffer
omdb.omnode  omnode:dev.x2-4.x2-0         node:dev.x2-20       use:Y  comment:"x2 Broker node 1"
omdb.omnode  omnode:dev.x2-4.x2-1         node:dev.x2-18       use:Y  comment:"x2 Broker node 2"
omdb.omnode  omnode:dev.x2-4.x2-2         node:dev.x2-19       use:Y  comment:"x2 Broker node 3"
omdb.omnode  omnode:dev.x2-4.x2-3         node:dev.x2-17       use:Y  comment:"x2 Broker node 4"
omdb.omnode  omnode:dev.x2-4.x2w-1        node:dev.x2w-08      use:Y  comment:""



acr uid:%


$ git cherry-pick 801e0f266cb247f4dd6c0602e4777546b4a4fe74
Auto-merging data/atfdb/comptest.ssim
Auto-merging data/atfdb/targs.ssim
Auto-merging data/dev/gitfile.ssim
Auto-merging data/dev/targsrc.ssim
Auto-merging data/dev/tool_opt.ssim
Auto-merging data/dmmeta/nsinclude.ssim
CONFLICT (rename/delete): extern/sqlite-3470000/shell.c renamed to extern/sqlite-3500400/shell.c in 801e0f266 (Increase sqlite max attach db limit), but deleted in HEAD.
CONFLICT (modify/delete): extern/sqlite-3500400/shell.c deleted in HEAD and modified in 801e0f266 (Increase sqlite max attach db limit).  Version 801e0f266 (Increase sqlite max attach db limit) of extern/sqlite-3500400/shell.c left in tree.
CONFLICT (rename/delete): extern/sqlite-3470000/sqlite3.c renamed to extern/sqlite-3500400/sqlite3.c in 801e0f266 (Increase sqlite max attach db limit), but deleted in HEAD.
CONFLICT (modify/delete): extern/sqlite-3500400/sqlite3.c deleted in HEAD and modified in 801e0f266 (Increase sqlite max attach db limit).  Version 801e0f266 (Increase sqlite max attach db limit) of extern/sqlite-3500400/sqlite3.c left in tree.
CONFLICT (rename/delete): extern/sqlite-3470000/sqlite3.h renamed to extern/sqlite-3500400/sqlite3.h in 801e0f266 (Increase sqlite max attach db limit), but deleted in HEAD.
CONFLICT (modify/delete): extern/sqlite-3500400/sqlite3.h deleted in HEAD and modified in 801e0f266 (Increase sqlite max attach db limit).  Version 801e0f266 (Increase sqlite max attach db limit) of extern/sqlite-3500400/sqlite3.h left in tree.
CONFLICT (rename/delete): extern/sqlite-3470000/sqlite3ext.h renamed to extern/sqlite-3500400/sqlite3ext.h in 801e0f266 (Increase sqlite max attach db limit), but deleted in HEAD.
CONFLICT (modify/delete): extern/sqlite-3500400/sqlite3ext.h deleted in HEAD and modified in 801e0f266 (Increase sqlite max attach db limit).  Version 801e0f266 (Increase sqlite max attach db limit) of extern/sqlite-3500400/sqlite3ext.h left in tree.
Auto-merging include/gen/lib_sqlite_gen.h
CONFLICT (content): Merge conflict in include/gen/lib_sqlite_gen.h
Auto-merging txt/lib/lib_sqlite/README.md
CONFLICT (content): Merge conflict in txt/lib/lib_sqlite/README.md
error: could not apply 801e0f266... Increase sqlite max attach db limit
hint: After resolving the conflicts, mark them with
hint: "git add/rm <pathspec>", then run
hint: "git cherry-pick --continue".
hint: You can instead skip this commit with "git cherry-pick --skip".
hint: To abort and get back to the state before "git cherry-pick",
hint: run "git cherry-pick --abort".