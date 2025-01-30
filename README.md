
# ACR notes

## to show all dependencies
```
acr dmmeta.ctype:myns.% -ndown 99  -tree > av_openacr/myns.txt
acr dmmeta.ns:myns -ndown 99  -tree > av_openacr/myns.txt
(venv) pgmabv@DESKTOP-3DQ1QS6:~/openacr$ acr dev.targsrc:myns/cpp/myns/%.%
dev.targsrc  targsrc:myns/cpp/myns/myns.cpp  comment:""
dev.targsrc  targsrc:myns/cpp/myns/util.cpp  comment:""
dev.targsrc  targsrc:myns/cpp/myns/util.h    comment:""
```

## To Show code

```bash
# All generated C code
amc myns.%order%

# Show prototypes
amc myns.%order% -proto
```

## Visuals

```bash
amc_vis myns.%
amc_vis dmmeta.'(Ctype|Field|Ns)'
```
to see all bad ref
``` acr -check %
```

## Visuals SVG

```bash
amc_vis myns.% -dot:av_openacr/pic
dot -Tsvg av_openacr/pic -o av_openacr/pic.svg
amc_vis samp_meng.% -dot:av_openacr/meng
dot -Tsvg av_openacr/meng -o av_openacr/meng.svg
```

## To Keep My Repo Under OpenACR Without Affecting Main Branch

Add to this `.git\info\exclude`:

```
av_openacr
.gitmodules
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

## Git separate generated code

```bash
git show | nogen
git show HEAD~1 | nogen
git show HEAD~3..HEAD |nogen
```
 
```
git log --oneline --decorate --pretty=format:"%h %ad | %s%d [%an]" --date=short``
We have a merge driver called acr_dm ("acr diff merge" -- txt/exe/acr_dm/README.md) which can be installed with the bin/gitconfig-setup script. It automatically resolves conflicts in ssim files because it understands that nearby lines are not logically related (by default, git treats files like code, where nearby changes are considered a conflict). acr_dm can even resolve 3-way merges where one branch changes attribute A and another changes attribute B - it's not a conflict because different attributes were changed.

```

## messages
samp_meng.NewSymbolReqMsg symbol:wwww
myns.NewOrderReqMsg part_key:part98  amt:10

## Todo

+ Test heap
- Attempt to inherit order from the ssim file
- Test UI
-how to reinit cstring
-implement messages
-review I64Price8
-try -e option for VScode


## git login cheat sheet

#for arnd gitlab use ssh private key
git config --global core.sshCommand "ssh -i /home/avorovich/.ssh/algox2_av"
#for av_openacl github use token (gdrive) 
git clone https://pgmabv99:<avtoken4>@github.com/pgmabv99/algo_util.git