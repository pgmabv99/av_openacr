
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

```

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
atf_ci -cijob:% -check_clean:N |& timestampsatf
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
### gitlab
git-rebase-origin, normalize, gcli -create mr
git-add-to-last-commit
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



```

## omcli

omcli -omnode:dev.ak-8.b%  -status 
omcli -omnode:dev.ak-8.b%   -stop
omcli -omnode:dev.ak-8.b%  -start 
omcli -omnode:dev.x2-4.%  -status

## x2node x2rel

x2node -node:dev.x2-17 
x2rel -product:x2 -build:N -create 
x2rel -product:x2 -build:N -upload 
x2rel -product:x2 -build:N -upload -omnode:dev.x2-4.x2-1
x2rel -product:x2 -build:N -upload -omnode:dev.x2-4.x2-1 -dev

## private keys 

sed -i 's/id_rsa/algox2_av/g'  ~/.ssh/config.d/*
sed -i 's/dkr/algox2_av/g'  ~/.ssh/config.d/*
algo_x2: laptop->nj1.sn1.avorovich
algo_x2: laptop->dev.x2-17
algo_x2:  nj1.sn1.avorovich->dev.x2-17
algo_x2:  nj1.sn1.avorovich->gitlab
 
## regex for  strings

^(?=.*name_Set)(?=.*MetadataResponseTopic)

## one node x2sup
rm -rf x2data;
x2fs -create -path x2data
x2supggitlog1

## todo
-duplicate corr_id in rdp ??

x2sup -v -v
atf_x2
x2gw
netcat
acr 
kapi


-add errcheck in x2node for failed key