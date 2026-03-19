
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
acr dmmeta.ns:x2read -ndown 99  -tree  -e 
acr dmmeta.ns:x2traf  -ndown 99  -tree  -e 

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


 heads up: upgrades in src_func:

you can now check which C++ functions correspond to an acr key:
$ src_func -acrkey:%omdb.omattr:rdp/enable_leader_balancer -showbody
void omcli::omattr_rdp_enable_leader_balancer(omcli::FOmnode &omnode){
    omnode.properties<<omnode.omattruval_yaml<<eol;
}
Or
$ src_func -acrkey:dispatch_msg:x2gw.Shm/%
void x2gw::Shm_KafkaAclMsg(x2::KafkaAclMsg &msg) 
void x2gw::Shm_CreateStreamMsg(x2::CreateStreamMsg &msg) 
void x2gw::Shm_NodeintfStateMsg(x2::NodeintfStateMsg &msg) 
void x2gw::Shm_EnableMetricsMsg(x2::EnableMetricsMsg &msg) 
...
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
this should be  called
LoadTuplesMaybe(algo::strptr root, bool recursive)
!!!!!
acr -merge -write <<EOF 
dmmeta.floadtuples  field:command.atf_snf.in  comment:""
EOF

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

## stepper atf_x2

to debug: 

$ atf_comp atf_x2.PubEachGw -v

take the command line, insert " | stepper" in the middle, enjoy interactive debugging

atf_comp atf_x2.PubEachGw -report:N -printinput | stepper | atf_x2 -bindir:build/release -comptest:atf_x2.PubEachGw -timeout:10000 -topo:dev4

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

to search for core

sudo find / -name "core*" 2>/dev/null

##  add new omnodes to git
```
-add to omnode.ssim
omcli -generate
git add omcli/gen; update-gitfile
```

##  git  and gli workflow
### git log

```
git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=short``

We have a merge driver called acr_dm ("acr diff merge" -- txt/exe/acr_dm/README.md) which can be installed with the bin/gitconfig-setup script. It automatically resolves conflicts in ssim files because it understands that nearby lines are not logically related (by default, git treats files like code, where nearby changes are considered a conflict). acr_dm can even resolve 3-way merges where one branch changes attribute A and another changes attribute B - it's not a conflict because different attributes were changed.

```
### acr/gitlab  work flow items 

### gcli/gli
gcli nnn -start
git-add-to-last-commit             ->> amend one and only commit
git-rebase-remote origin           ->> rebase
git clean -fdx                     ->> raiemove all

normalize_loop                     ->> before pushing up
gcli mr -create                    ->> push changes and create/recreate mr


Gli Cheat sheet:
```
gli -start <id>      create git branch from gitlab issue
gli -createissue     create or update issue from latest git commit
gli -push            create or update MR based on latest git commit
gli                  show CI status and any errors
gli -retry           resubmit failing CI jobs


```

### other
acr % -check -write 
atf_comp  
atf_comp -covcapture
git push --force 
git push algornd/arnd HEAD --force

git branch --set-upstream-to=algornd/arnd/$(git rev-parse --abbrev-ref HEAD)



###  token in github
``` 
gcli repo -create token:<token> host:https://gitlab.vovaco.com/
gcli repo -update algornd/arnd

```
### To Keep My Repo Under OpenACR Without Affecting Main Branch

Add to this `.git\info\exclude`:

```
av_openacr
.gitmodules
```

### git rebase

when conflict in in gen files
amc
git add */gen

///
in master 
abt amc
git status --short

### git login cheat sheet

//for arnd gitlab use ssh private key
git config --global core.sshCommand "ssh -i /home/avorovich/.ssh/algox2_av"
git config --global core.sshCommand "ssh -i /home/x2usr/.ssh/algox2_av"
git config --global core.sshCommand "ssh -i /home/x2usr/.ssh/algox2_gitlab"

cd arnd
gitconfig-setup
ai

//for av_openacl github use token (gdrive) 
git clone https://pgmabv99:<avtoken4>@github.com/pgmabv99/algo_util.git


or 
chmod 600 ~/.ssh/algox2_av

//Start the SSH agent if it's not already running
eval "$(ssh-agent -s)"
add the SSH key
ssh-add ~/.ssh/algox2_av

//Confirm the key was added
ssh-add -l

### git rebase conflics with delayeed master merge

local hash 

```
commit bf342bbffdf7444201539043686f5fa5adda2edf
Author: alexey vorovich <alexey.vorovich@gmail.com>
Date:   Thu Feb 19 19:44:43 2026 -0500

    atf_snf : call HeaderMsgs_KafkaDecode at run time option
    
    -refactor kafka2 decode wrapper  and call from DetectStore.

465c66d7 (HEAD -> algornd/arnd.604, origin/algornd/arnd.604) Issue algornd/arnd#604 atf_snf should detect if the device is in usegco 
```

merge into master hash
commit 5acb9b69842477644bac47a54167cb0544ebff7a
Author: Alexey Vorovich <avorovich@algox2.com>
Date:   Mon Feb 23 07:25:43 2026 -0500

    * atf_snf : call HeaderMsgs_KafkaDecode at run time option
    
    -refactor kafka2 decode wrapper  and call from DetectStore.

```
```


# containers/host logins
from sn1: login from sn1 to sn5 container
x2node  -node:nj1.sn5.avorovich 
x2node  -node:nj1.sn5.kafka-4 

x2node  -node:nj1.sn5.bm -root
x2node  -node:nj1.sn1.bm -root
x2node  -node:nj1.sn2.bm -root



native  k8s

kubectl describe pod x2-17--nj1-sv2 -n nj1-4


dkr ps            -rspec:nj1.sn5.avorovich 
dkr -clean_run     -rspec:nj1.sn5.avorovich 
dkr -clean_run     -rspec:nj1.sn5.user-avorovich 

docker exec -u root  2ed30abac818 mount --bind /lib/modules /lib/modules

// get container sizes
dkr -ps_size  -rspec:nj1.sn6.bm
//  list of pods in ns
dkr -ps_ns -k8ns:nj1-4
//inspect
dkr -inspect -node:nj1-4.minio-1


// natiuve  k8s
x2node  -node:nj1.sn2.bm
sudo kubectl describe pod nj1-4-kafka-1--nj1-sv2 -n nj1-4

//build image
dkr -build -node:dev.kafkacw-02 > ~/av_openacr/logs_dkr/dbld.log

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}" | sort
docker restart user-avorovich


# private keys  and ssh clean
x2ssh clean
x2ssh start
sed -i 's/id_rsa/algox2_av/g'  ~/.ssh/config.d/*
sed -i 's/dkr/algox2_av/g'  ~/.ssh/config.d/*
algo_x2: laptop->nj1.sn1.avorovich
algo_x2: laptop->dev.x2-17
algo_x2:  nj1.sn1.avorovich->dev.x2-17
algo_x2:  nj1.sn1.avorovich->gitlab


# regex for  strings

^(?=.*name_Set)(?=.*MetadataResponseTopic)



# sync
x2node -node:nj1.sn5.bm -rsync_put -local /home/avorovich/av_openacr/dev.ak-8.tap-4_ext_0 -remote dev.ak-8.tap-4_ext_0 
omdb.omnode  omnode:dev.ak-8.tap-1_ext_0  node:dev.kafka-01  use:Y  comment:"kafka broker sniffer for node 1"




# ACR  ports /jhosts in nj1-4
```
omdb.omenv  omenv:nj1-4  omenvtype:dev  owner:avorovich  comment:""
    omdb.omnode  omnode:nj1-4.kafka-1    node:dev.kafka-13    use:Y  comment:"kafka Broker node 1"
    omdb.omnode  omnode:nj1-4.kafka-2    node:dev.kafka-14    use:Y  comment:"kafka Broker node 2"
    omdb.omnode  omnode:nj1-4.kafka-3    node:dev.kafka-15    use:Y  comment:"kafka Broker node 3"
    omdb.omnode  omnode:nj1-4.kafka-4    node:dev.kafka-16    use:Y  comment:"kafka Broker node 4"
    omdb.omnode  omnode:nj1-4.kafkacw-1  node:dev.kafkacw-02  use:Y  comment:"s3 sink for tests"
    omdb.omnode  omnode:nj1-4.kafkaui-1  node:dev.kafkaui-5   use:Y  comment:"Provectus UI node"
    omdb.omnode  omnode:nj1-4.kafkaw-1   node:dev.kafkaw-04   use:Y  comment:""
    omdb.omnode  omnode:nj1-4.kafkaw-2   node:dev.kafkaw-12   use:Y  comment:""
    omdb.omnode  omnode:nj1-4.minio-1    node:dev.minio-02    use:Y  comment:"Apache Cluster s3"
    omdb.omnode  omnode:nj1-4.rdp-1      node:dev.rdp-13      use:Y  comment:"rdp Broker node 1"
    omdb.omnode  omnode:nj1-4.rdp-2      node:dev.rdp-14      use:Y  comment:"rdp Broker node 2"
    omdb.omnode  omnode:nj1-4.rdp-3      node:dev.rdp-15      use:Y  comment:"rdp Broker node 3"
    omdb.omnode  omnode:nj1-4.rdp-4      node:dev.rdp-16      use:Y  comment:"rdp Broker node 4"
    omdb.omnode  omnode:nj1-4.rdpui-1    node:dev.rdpui-5     use:Y  comment:"Redpanda UI node"
    omdb.omnode  omnode:nj1-4.x2-0       node:dev.x2-20       use:Y  comment:"x2 Broker node 1"
    omdb.omnode  omnode:nj1-4.x2-1       node:dev.x2-18       use:Y  comment:"x2 Broker node 2"
    omdb.omnode  omnode:nj1-4.x2-2       node:dev.x2-19       use:Y  comment:"x2 Broker node 3"
    omdb.omnode  omnode:nj1-4.x2-3       node:dev.x2-17       use:Y  comment:"x2 Broker node 4"
    omdb.omnode  omnode:nj1-4.x2ui-1     node:dev.x2ui-6      use:Y  comment:"X2 Cluster native UI node"
    omdb.omnode  omnode:nj1-4.x2w-1      node:dev.x2w-08      use:Y  comment:""
    omdb.omnode  omnode:nj1-4.x2w-2      node:dev.x2w-12      use:Y  comment:""
    omdb.omhost  omhost:nj1-4.kafka-1.ctrl-0    ip:192.168.10.21  comment:""
    omdb.omhost  omhost:nj1-4.kafka-1.ext-0     ip:192.168.104.2  comment:""
    omdb.omhost  omhost:nj1-4.kafka-1.ib-0      ip:192.168.214.2  comment:""
    omdb.omhost  omhost:nj1-4.kafka-1.int-0     ip:192.168.204.2  comment:""
    omdb.omhost  omhost:nj1-4.kafka-2.ctrl-0    ip:192.168.10.31  comment:""
    omdb.omhost  omhost:nj1-4.kafka-2.ext-0     ip:192.168.104.3  comment:""
    omdb.omhost  omhost:nj1-4.kafka-2.ib-0      ip:192.168.214.3  comment:""
    omdb.omhost  omhost:nj1-4.kafka-2.int-0     ip:192.168.204.3  comment:""
    omdb.omhost  omhost:nj1-4.kafka-3.ctrl-0    ip:192.168.10.41  comment:""
    omdb.omhost  omhost:nj1-4.kafka-3.ext-0     ip:192.168.104.4  comment:""
    omdb.omhost  omhost:nj1-4.kafka-3.ib-0      ip:192.168.214.4  comment:""
    omdb.omhost  omhost:nj1-4.kafka-3.int-0     ip:192.168.204.4  comment:""
    omdb.omhost  omhost:nj1-4.kafka-4.ctrl-0    ip:192.168.10.51  comment:""
    omdb.omhost  omhost:nj1-4.kafka-4.ext-0     ip:192.168.104.5  comment:""
    omdb.omhost  omhost:nj1-4.kafka-4.ib-0      ip:192.168.214.5  comment:""
    omdb.omhost  omhost:nj1-4.kafka-4.int-0     ip:192.168.204.5  comment:""
    omdb.omhost  omhost:nj1-4.kafkacw-1.ctrl-0  ip:192.168.10.11  comment:""
    omdb.omhost  omhost:nj1-4.kafkacw-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.kafkaui-1.ctrl-0  ip:192.168.10.11  comment:""
    omdb.omhost  omhost:nj1-4.kafkaui-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.kafkaw-1.ctrl-0   ip:192.168.10.61  comment:""
    omdb.omhost  omhost:nj1-4.kafkaw-1.ext-0    ip:192.168.104.6  comment:""
    omdb.omhost  omhost:nj1-4.kafkaw-2.ctrl-0   ip:192.168.10.71  comment:""
    omdb.omhost  omhost:nj1-4.kafkaw-2.ext-0    ip:192.168.104.7  comment:""
    omdb.omhost  omhost:nj1-4.minio-1.ctrl-0    ip:192.168.10.11  comment:""
    omdb.omhost  omhost:nj1-4.minio-1.ext-0     ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.rdp-1.ctrl-0    ip:192.168.10.21  comment:""
    omdb.omhost  omhost:nj1-4.rdp-1.ext-0     ip:192.168.104.2  comment:""
    omdb.omhost  omhost:nj1-4.rdp-1.ib-0      ip:192.168.214.2  comment:""
    omdb.omhost  omhost:nj1-4.rdp-1.int-0     ip:192.168.204.2  comment:""
    omdb.omhost  omhost:nj1-4.rdp-2.ctrl-0    ip:192.168.10.31  comment:""
    omdb.omhost  omhost:nj1-4.rdp-2.ext-0     ip:192.168.104.3  comment:""
    omdb.omhost  omhost:nj1-4.rdp-2.ib-0      ip:192.168.214.3  comment:""
    omdb.omhost  omhost:nj1-4.rdp-2.int-0     ip:192.168.204.3  comment:""
    omdb.omhost  omhost:nj1-4.rdp-3.ctrl-0    ip:192.168.10.41  comment:""
    omdb.omhost  omhost:nj1-4.rdp-3.ext-0     ip:192.168.104.4  comment:""
    omdb.omhost  omhost:nj1-4.rdp-3.ib-0      ip:192.168.214.4  comment:""
    omdb.omhost  omhost:nj1-4.rdp-3.int-0     ip:192.168.204.4  comment:""
    omdb.omhost  omhost:nj1-4.rdp-4.ctrl-0    ip:192.168.10.51  comment:""
    omdb.omhost  omhost:nj1-4.rdp-4.ext-0     ip:192.168.104.5  comment:""
    omdb.omhost  omhost:nj1-4.rdp-4.ib-0      ip:192.168.214.5  comment:""
    omdb.omhost  omhost:nj1-4.rdp-4.int-0     ip:192.168.204.5  comment:""
    omdb.omhost  omhost:nj1-4.rdpui-1.ctrl-0  ip:192.168.10.11  comment:""
    omdb.omhost  omhost:nj1-4.rdpui-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.x2-0.ctrl-0     ip:192.168.10.51  comment:""
    omdb.omhost  omhost:nj1-4.x2-0.ext-0      ip:192.168.104.5  comment:""
    omdb.omhost  omhost:nj1-4.x2-0.ib-0       ip:192.168.214.5  comment:""
    omdb.omhost  omhost:nj1-4.x2-0.int-0      ip:192.168.204.5  comment:""
    omdb.omhost  omhost:nj1-4.x2-1.ctrl-0     ip:192.168.10.31  comment:""
    omdb.omhost  omhost:nj1-4.x2-1.ext-0      ip:192.168.104.3  comment:""
    omdb.omhost  omhost:nj1-4.x2-1.ib-0       ip:192.168.214.3  comment:""
    omdb.omhost  omhost:nj1-4.x2-1.int-0      ip:192.168.204.3  comment:""
    omdb.omhost  omhost:nj1-4.x2-2.ctrl-0    ip:192.168.10.41  comment:""
    omdb.omhost  omhost:nj1-4.x2-2.ext-0     ip:192.168.104.4  comment:""
    omdb.omhost  omhost:nj1-4.x2-2.ib-0      ip:192.168.214.4  comment:""
    omdb.omhost  omhost:nj1-4.x2-2.int-0     ip:192.168.204.4  comment:""
    omdb.omhost  omhost:nj1-4.x2-3.ctrl-0    ip:192.168.10.21  comment:""
    omdb.omhost  omhost:nj1-4.x2-3.ext-0     ip:192.168.104.2  comment:""
    omdb.omhost  omhost:nj1-4.x2-3.ib-0      ip:192.168.214.2  comment:""
    omdb.omhost  omhost:nj1-4.x2-3.int-0     ip:192.168.204.2  comment:""
    omdb.omhost  omhost:nj1-4.x2ui-1.ctrl-0  ip:192.168.10.11  comment:""
    omdb.omhost  omhost:nj1-4.x2ui-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.x2w-1.ctrl-0   ip:192.168.10.61  comment:""
    omdb.omhost  omhost:nj1-4.x2w-1.ext-0    ip:192.168.104.6  comment:""
    omdb.omhost  omhost:nj1-4.x2w-2.ctrl-0   ip:192.168.10.71  comment:""
    omdb.omhost  omhost:nj1-4.x2w-2.ext-0    ip:192.168.104.7  comment:""
    ```


    ```
    $ acr omnode:nj1-4.% -t -ndown:5 | grep 192.168.104.1
    omdb.omhost  omhost:nj1-4.kafkacw-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.kafkaui-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.minio-1.ext-0     ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.rdpui-1.ext-0   ip:192.168.104.1  comment:""
    omdb.omhost  omhost:nj1-4.x2ui-1.ext-0   ip:192.168.104.1  comment:""

```


# ACR  strings cheat

```
        tempstr broker_ports("-broker_ports:");
        ind_beg(algo::Sep_curs,token,omnode.p_omenv->bootstrap,','){
            tempstr broker_port(Trimmed(Pathcomp(token,":LR")));
            prlog("omcli_info"
                  << Keyval("omnode",omnode.omnode)
                  << Keyval("broker_port",broker_port)
                  );
            broker_ports<<broker_port<<",";
        }ind_end;
```



# atf_comp java tree

-under tree of atf_comp processes

    avorovi+ 1308881 1297274  0 19:06 pts/6    00:00:00      |   |   \_ atf_comp atf_exp.KafkaPubPart10x8KB
310660 1297274      |   |   \_ atf_comp atf_exp.KafkaPubPart10x8KB
    1310671 1310660      |   |       \_ bash
    1310674 1310671      |   |           \_ build/release/atf_exp -bindir:build/release -comptest:atf_exp.KafkaPubPart10x8KB -timeout:60
    1310675 1310674      |   |               \_ build/release/x2sup -i -initdir:temp/atf_comp/atf_exp.KafkaPubPart10x8KB -bindir:build/release...
    1310690 1310675      |   |               |   \_ .. 
    1311207 1310674      |   |               \_ bash -c /opt/kafka/current/bin/kafka-console-consumer.sh  --bootstrap-server ............
    1311208 1311207      |   |               |   \_ /usr/lib/jvm/java-17-openjdk-amd64/bin/java -Xmx512M -server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 ...........
    1311209 1311207      |   |               |   \_ wc -l

-under pid =1
    1311208       1 /usr/lib/jvm/java-17-openjdk-amd64/bin/java -Xmx512M -server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -XX:MaxInlineLevel=15 -Djava.awt.headless=true -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dkafka.logs.dir=/opt/kafka/current/bin/../log

# gitlab debugs

$ x2node -node:dev.gitlab-runner-7
gitlab-runner@gitlab-runner-7:~$ ls
builds  cache  jmx_prometheus_javaagent.jar  kafka
gitlab-runner@gitlab-runner-7:~$ cd builds/R7CQekreq/0/algornd/arnd
gitlab-runner@gitlab-runner-7:~/builds/R7CQekreq/0/algornd/arnd$ source ./conf/alexei/
bash_profile     gnome-customize  minttyrc         
gitlab-runner@gitlab-runner-7:~/builds/R7CQekreq/0/algornd/arnd$ source ./conf/alexei/bash_profile 
bash: bin/acr_compl: No such file or directory
[0 Mar 02 15:16:18] gitlab-runner@gitlab-runner-7:~/builds/R7CQekreq/0/algornd/arnd 
$ ai
abt.config  builddir:Linux-g++.release-x86_64  ood_src:0  ood_target:0  cache:gcache
report.abt  n_target:123  time:00:00:00.081780348  hitrate:0%  pch_hitrate:0%  n_warn:0  n_err:0  n_install:123


# atf_exp kafka tests
atfdb.comptest  comptest:atf_exp.Kafka                 timeout:10   memcheck:N  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA Smoke test"
atfdb.comptest  comptest:atf_exp.Kafka32KB_1K_kcat     timeout:60   memcheck:N  coverage:N  exit_code:0  ncore:1024  repeat:1  comment:"kcat 1K of 32KB messages"
atfdb.comptest  comptest:atf_exp.KafkaAcl              timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA ACL test"
atfdb.comptest  comptest:atf_exp.KafkaAclMgt           timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA ACL management test"
atfdb.comptest  comptest:atf_exp.KafkaAuth             timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA Authentication test"
atfdb.comptest  comptest:atf_exp.KafkaClient           timeout:40   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:0  comment:"KAFKA native client test"
atfdb.comptest  comptest:atf_exp.KafkaCrc              timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA Smoke test"
atfdb.comptest  comptest:atf_exp.KafkaCreateTopic      timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA Create Topic Test"
atfdb.comptest  comptest:atf_exp.KafkaDescribeCluster  timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA DescribeCluster Test"
atfdb.comptest  comptest:atf_exp.KafkaKv               timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA Key-Value test"
atfdb.comptest  comptest:atf_exp.KafkaMtls             timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA mTLS  test"
atfdb.comptest  comptest:atf_exp.KafkaPub2000x1MB      timeout:240  memcheck:N  coverage:N  exit_code:0  ncore:1024  repeat:1  comment:"KAFKA 2K of 1MB messages"
atfdb.comptest  comptest:atf_exp.KafkaPubPart10x8KB    timeout:60   memcheck:N  coverage:Y  exit_code:0  ncore:1024  repeat:1  comment:"KAFKA 10K of 8KB messages to 10 partitions, 1K per partition, kafka-consumer and kcat"
atfdb.comptest  comptest:atf_exp.KafkaTls              timeout:10   memcheck:Y  coverage:Y  exit_code:0  ncore:1024  repeat:3  comment:"KAFKA TLS test"



comptest  atf_exp.Kafka -bindir:$bindir -comptest:$comptest -timeout:$timeout
comment KAFKA Smoke test
ncore 1024
timeout 10
repeat 3
memcheck N
coverage Y
exit_code 0
filter sed -E -f test/filt.sed
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -initdir:$tempdir -bindir:$bindir -random_ports -temp"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t public.anon"
x2.ProcMsg  proc:kcat-pub  payload:"EST AVIS IN DEXTRA MELIOR QUAM QUATTUOR EXTRA"
x2.ProcEofMsg  proc:kcat-pub
x2.ProcReadMsg  proc:kcat-pub
x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t public.anon -e -X fetch.wait.max.ms=0"
x2.ProcReadMsg  proc:kcat-sub
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg


 kafka-connect start nj1-4.kafka-1.ext-0:1643 test-topic0

 kafka-connect start 127.0.0.1:$kafkaport public.anon



 # new nodes

 $ ls -ltr data/x2rdb/* | grep spec
-rw-rw-r-- 1 avorovich avorovich  12936 Mar  8 18:56 data/x2rdb/noderspec.ssim


# atf_lat dashboard for v2
```
================ local snapshot count 154 taps nj1-4.x2-0|nj1-4.x2-1|nj1-4.x2-2|nj1-4.x2-3
  
================ Kafka metrics:Tcp pairs sorted by client_id 
================== AVG_LAT(USEC)            - avg latency req/rsp for !!current!! snapshot 
================== AVG_LAT_CUM(USEC)        - avg latency  of req/rsp ave latency for !!all!! snapshots 
================== AVG_LAT_PROD_MSG(USEC)   - avg latency for 1 produce msg for current   snapshot  
CLIENT_ID_KEY                TAP HOST  TCP_SHORT    AVG_LAT(USEC)  AVG_LAT_CUM(USEC)  AVG_LAT_PROD_MSG(USEC)  PROD_MSG_COUNT_PER_STEP  REQ_COUNT  FRAME_COUNT_PER_STEP  SNAPSHOT_ID  TIME
adminclient-1                nj1.sv2   104.7-104.2  0              41.971             0                       0                        2          0                     154          2026-03-12T15:35:29.065406139
adminclient-1                nj1.sv2   104.6-104.2  0              21.575             0                       0                        2          0                     154          2026-03-12T15:35:29.065406139
adminclient-1                nj1.sv3   104.6-104.3  0              243.641            0                       0                        2          0                     154          2026-03-12T15:35:29.183808588
consumer-sub-000-PS71uYs-1   nj1.sv2   104.7-104.2  4286.22        5253.36            0                       0                        25332      477                   154          2026-03-12T15:35:29.065406139
consumer-sub-000-PS71uYs-1   nj1.sv2   104.7-104.2  0              11.575             0                       0                        3          0                     154          2026-03-12T15:35:29.065406139
consumer-sub-000-PS71uYs-1   nj1.sv3   104.7-104.3  68.56          7259.53            0                       0                        122020     1281                  154          2026-03-12T15:35:29.183808588
consumer-sub-000-PS71uYs-1   nj1.sv3   104.7-104.3  3347.55        3310.3             0                       0                        37764      627                   154          2026-03-12T15:35:29.183808588
consumer-sub-000-PS71uYs-1   nj1.sv4   104.7-104.4  4628.08        5104.01            0                       0                        25657      508                   154          2026-03-12T15:35:29.206261106
consumer-sub-000-PS71uYs-1   nj1.sv5   104.7-104.5  3165.32        3407.67            0                       0                        37353      660                   154          2026-03-12T15:35:29.093269067
kafka-ui-admin-1773343999-1  nj1.sv2   104.1-104.2  0              31.686             0                       0                        2          0                     154          2026-03-12T15:35:29.065406139
kafka-ui-admin-1773343999-1  nj1.sv2   104.1-104.2  0              75.993             0                       0                        13         0                     154          2026-03-12T15:35:29.065406139
kafka-ui-admin-1773343999-1  nj1.sv3   104.1-104.3  0              68.647             0                       0                        16         0                     154          2026-03-12T15:35:29.183808588
kafka-ui-admin-1773343999-1  nj1.sv4   104.1-104.4  0              90.075             0                       0                        12         0                     154          2026-03-12T15:35:29.206261106
kafka-ui-admin-1773343999-1  nj1.sv5   104.1-104.5  0              52.629             0                       0                        11         0                     154          2026-03-12T15:35:29.093269067
producer-1                   nj1.sv2   104.6-104.2  0              9.04               0                       0                        2          0                     154          2026-03-12T15:35:29.065406139
producer-1                   nj1.sv2   104.6-104.2  115.773        130.533            11.056                  2377                     22566      430                   154          2026-03-12T15:35:29.065406139
producer-1                   nj1.sv3   104.6-104.3  95.806         103.431            9.102                   2526                     33933      454                   154          2026-03-12T15:35:29.183808588
producer-1                   nj1.sv4   104.6-104.4  196.599        189.6              18.34                   2787                     22611      477                   154          2026-03-12T15:35:29.206261106
producer-1                   nj1.sv5   104.6-104.5  101.238        103.41             9.206                   2870                     33974      514                   154          2026-03-12T15:35:29.093269067
producer-1                   nj1.sv5   104.6-104.5  0              31.83              0                       0                        2          0                     154          2026-03-12T15:35:29.093269067
redpanda-console             nj1.sv2   104.1-104.2  0              3179.74            0                       0                        4          0                     154          2026-03-12T15:35:29.065406139
redpanda-console             nj1.sv3   104.1-104.3  0              122.383            0                       0                        7          0                     154          2026-03-12T15:35:29.183808588
redpanda-console             nj1.sv3   104.1-104.3  0              6533.1             0                       0                        2          0                     154          2026-03-12T15:35:29.183808588
redpanda-console             nj1.sv3   104.1-104.3  0              581.955            0                       0                        2          0                     154          2026-03-12T15:35:29.183808588
redpanda-console             nj1.sv4   104.1-104.4  0              4257.97            0                       0                        3          0                     154          2026-03-12T15:35:29.206261106
redpanda-console             nj1.sv4   104.1-104.4  0              580.422            0                       0                        2          0                     154          2026-03-12T15:35:29.206261106
redpanda-console             nj1.sv5   104.1-104.5  0              11.168             0                       0                        2          0                     154          2026-03-12T15:35:29.093269067
redpanda-console             nj1.sv5   104.1-104.5  0              298.357            0                       0                        3          0                     154          2026-03-12T15:35:29.093269067
redpanda-console             nj1.sv5   104.1-104.5  0              6035.02            0                       0                        2          0                     154          2026-03-12T15:35:29.093269067

================= Kafka metrics: Topic partitionsinfo based on fetch 
TOPIC_ID/PARTITION                      NAME                        TAP HOST  OFFSET_FETCH_LST  HIGH_WATERMARK  LAG  SNAPSHOT_ID  TIME                           OFFSET_PRODUCE(BASE!)
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/0  test-topic-0000000-LRmZcF8  nj1.sv4   120990            120991          1    154          2026-03-12T15:35:29.206261106  121535
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/1  test-topic-0000000-LRmZcF8  nj1.sv3   124416            124417          1    154          2026-03-12T15:35:29.183808588  124416
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/2  test-topic-0000000-LRmZcF8  nj1.sv5   123551            123552          1    154          2026-03-12T15:35:29.093269067  123551
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/3  test-topic-0000000-LRmZcF8  nj1.sv2   123128            123129          1    154          2026-03-12T15:35:29.065406139  123263
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/4  test-topic-0000000-LRmZcF8  nj1.sv2   119580            119581          1    154          2026-03-12T15:35:29.065406139  119580
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/5  test-topic-0000000-LRmZcF8  nj1.sv3   121076            121077          1    154          2026-03-12T15:35:29.183808588  121076
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/6  test-topic-0000000-LRmZcF8  nj1.sv4   118668            118669          1    154          2026-03-12T15:35:29.206261106  119318
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/7  test-topic-0000000-LRmZcF8  nj1.sv5   123036            123037          1    154          2026-03-12T15:35:29.093269067  123166
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/8  test-topic-0000000-LRmZcF8  nj1.sv5   119314            119316          2    154          2026-03-12T15:35:29.093269067  119579
a1eb3fe7-5071-4e78-b23c-61d3382e3d4e/9  test-topic-0000000-LRmZcF8  nj1.sv3   120545            120546          1    154          2026-03-12T15:35:29.183808588  120545

================= x2 metrics
================== AVG_LAT_REQ(USEC) -avg latency of x2write ack for current snapshot
================== AVG_LAT_SEQ(USEC) -avg latency of x2read      for current snapshot

gli pbash
```