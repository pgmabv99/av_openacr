
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
this should eb called
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


dkr ps            -dctr:nj1.sn5.avorovich 
dkr -clean_run     -dctr:nj1.sn5.avorovich 
dkr -clean_run     -dctr:nj1.sn5.user-avorovich 

docker exec -u root  2ed30abac818 mount --bind /lib/modules /lib/modules

// get container sizes
dkr -ps_size  -dctr:nj1.sn6.bm
//  list of pods in ns
dkr -ps_ns -k8ns:nj1-4
//inspect
dkr -inspect -node:dev.x2-17


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


# notes on tap

-master produce pcap master_smallb is read by branch fiel locally
-remote run rbanch produces pos/neg gaps

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


# stress tap

 grep atf_snf.session_ tap_all.log
atf_snf.session_stats0---------------  current_time:2026-03-03T15:40:27.162571053  "elapsed(sec)":160.278
atf_snf.session_tcp_stats------------  iframe_count:10221  tcp_pair_count:138  seq_gap_pos_count:0  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_kafka_stats----------  kafka_req_count_total:2146  kafka_req_ack_count_total:2144  kafka_req_wo_rsp:2  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":3323  "frame_parse((usec)":2729
atf_snf.session_poll_stats-----------  poll_count:1911761801  poll_hit_delta_max:117912238  poll_hit_delta_min:1  poll_hit_delta_avg:95246
atf_snf.session_poll_delta1_stats----  poll_hit_delta1_count:10143  delta1_run_count:73  delta1_run_len_avg:2.57534  delta1_run_len_max:49
atf_snf.session_poll_queue_delay(%)--  q5%:0.945205  q50%:0.0547945  q500%:0  q5000:0  q5000+:0
atf_snf.session_poll_queue_delay(abs)  q5:69  q50:4  q500:0  q5000:0  q5000+:0
atf_snf.session_stats0---------------  current_time:2026-03-03T15:40:27.312770007  "elapsed(sec)":160.413
atf_snf.session_tcp_stats------------  iframe_count:10413  tcp_pair_count:136  seq_gap_pos_count:0  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_kafka_stats----------  kafka_req_count_total:2244  kafka_req_ack_count_total:2243  kafka_req_wo_rsp:1  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":2157  "frame_parse((usec)":3335
atf_snf.session_poll_stats-----------  poll_count:1898880328  poll_hit_delta_max:118954287  poll_hit_delta_min:1  poll_hit_delta_avg:91965
atf_snf.session_poll_delta1_stats----  poll_hit_delta1_count:10331  delta1_run_count:74  delta1_run_len_avg:1.83784  delta1_run_len_max:28
atf_snf.session_poll_queue_delay(%)--  q5%:0.945946  q50%:0.0540541  q500%:0  q5000:0  q5000+:0
atf_snf.session_poll_queue_delay(abs)  q5:70  q50:4  q500:0  q5000:0  q5000+:0
atf_snf.session_stats0---------------  current_time:2026-03-03T15:40:27.424091457  "elapsed(sec)":160.516
atf_snf.session_tcp_stats------------  iframe_count:10152  tcp_pair_count:142  seq_gap_pos_count:0  seq_gap_neg_count:1  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_kafka_stats----------  kafka_req_count_total:2159  kafka_req_ack_count_total:2158  kafka_req_wo_rsp:1  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":2900  "frame_parse((usec)":3415
atf_snf.session_poll_stats-----------  poll_count:1894899872  poll_hit_delta_max:116207189  poll_hit_delta_min:1  poll_hit_delta_avg:91646
atf_snf.session_poll_delta1_stats----  poll_hit_delta1_count:10073  delta1_run_count:74  delta1_run_len_avg:2.27027  delta1_run_len_max:47
atf_snf.session_poll_queue_delay(%)--  q5%:0.945946  q50%:0.0540541  q500%:0  q5000:0  q5000+:0
atf_snf.session_poll_queue_delay(abs)  q5:70  q50:4  q500:0  q5000:0  q5000+:0
atf_snf.session_stats0---------------  current_time:2026-03-03T15:40:27.056606478  "elapsed(sec)":160.182
atf_snf.session_tcp_stats------------  iframe_count:18910  tcp_pair_count:138  seq_gap_pos_count:6  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_kafka_stats----------  kafka_req_count_total:6828  kafka_req_ack_count_total:6823  kafka_req_wo_rsp:5  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":1667  "frame_parse((usec)":2590
atf_snf.session_poll_stats-----------  poll_count:1906825018  poll_hit_delta_max:117630316  poll_hit_delta_min:1  poll_hit_delta_avg:47577
atf_snf.session_poll_delta1_stats----  poll_hit_delta1_count:18817  delta1_run_count:76  delta1_run_len_avg:1.80263  delta1_run_len_max:11
atf_snf.session_poll_queue_delay(%)--  q5%:0.907895  q50%:0.0921053  q500%:0  q5000:0  q5000+:0
atf_snf.session_poll_queue_delay(abs)  q5:69  q50:7  q500:0  q5000:0  q5000+:0
+ grep tcp_stats tap_all.log
atf_snf.session_tcp_stats------------  iframe_count:10221  tcp_pair_count:138  seq_gap_pos_count:0  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_tcp_stats------------  iframe_count:10413  tcp_pair_count:136  seq_gap_pos_count:0  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_tcp_stats------------  iframe_count:10152  tcp_pair_count:142  seq_gap_pos_count:0  seq_gap_neg_count:1  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
atf_snf.session_tcp_stats------------  iframe_count:18910  tcp_pair_count:138  seq_gap_pos_count:6  seq_gap_neg_count:0  decode_err_count!!:0  false_candidate_count!!:0  max_pkt_len:9014
+ grep kafka_stats tap_all.log
atf_snf.session_kafka_stats----------  kafka_req_count_total:2146  kafka_req_ack_count_total:2144  kafka_req_wo_rsp:2  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":3323  "frame_parse((usec)":2729
atf_snf.session_kafka_stats----------  kafka_req_count_total:2244  kafka_req_ack_count_total:2243  kafka_req_wo_rsp:1  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":2157  "frame_parse((usec)":3335
atf_snf.session_kafka_stats----------  kafka_req_count_total:2159  kafka_req_ack_count_total:2158  kafka_req_wo_rsp:1  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":2900  "frame_parse((usec)":3415
atf_snf.session_kafka_stats----------  kafka_req_count_total:6828  kafka_req_ack_count_total:6823  kafka_req_wo_rsp:5  kafka_rsp_wo_req:0  "kafka_req_to_rsp_duration_avg(usec)":1667  "fra
