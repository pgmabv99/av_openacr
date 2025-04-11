
# ACR notes

## to show all dependencies
```
acr dmmeta.ns:atf_snf  -ndown 99  -tree -e
acr dmmeta.ns:atf_snf  -ndown 99  -tree > ~/av_openacr/atf_snf.sh

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

```

## Visuals

```bash
amc_vis atf_spdk.% > $HOME1/av_openacr/atf_spdk_viz.txt
amc_vis x2net.% > $HOME1/av_openacr/x2net_viz.txt
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
atf_ci -cijob:%

```
atf_ci.begin  citest:spnx  sandbox:N
atf_ci.citest  citest:spnx  runtime:00:00:00.010202231  success:Y  comment:"Re-generate sphinx website from readme - check all links"
report.atf_ci  n_citest:42  n_run:42  n_pass:42  success:Y  comment:"The coast is clear. Proceed with caution :-)
```

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
## acr docker cheat sheet
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
dkr -clean_run  -node:nj1.sn1.avorovich 



#passtru cat /etc/hostname
#from sn1 : ps 
dkr ps   -node:nj1.sn5.avorovich 

docker exec -u root  2ed30abac818 mount --bind /lib/modules /lib/modules


```

## omcli

omcli -omnode:dev.ak-8.b%  -status 
omcli -omnode:dev.ak-8.b%   -stop
omcli -omnode:dev.ak-8.b%  -start 

omcli -omnode:dev.ak-8.%  -stop
omcli -omnode:dev.ak-8.b%  -start
omcli -omnode:dev.ak-8.u%  -start
omcli -omnode:dev.ak-8.%   -status

// kafka ui
omcli -omnode:dev.ak-8.uip -stop
omcli -omnode:dev.ak-8.uip -start
omcli -omnode:dev.ak-8.uip -status
// redpanda ui
omcli -omnode:dev.ak-8.uir -start/stop

