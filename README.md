
# ACR notes

## to show all dependencies
```
acr dmmeta.ns:atf_spdk -ndown 99  -tree -e
acr dmmeta.ns:atf_spdk -ndown 99  -tree > $HOME1/av_openacr/atf_spdk.sh

  dmmeta.fcleanup  field:atf_spdk.FCtrlr.ctrlr  comment:""


    # dmmeta.field  field:atf_spdk.FDb.av22         acr.rowid:2       arg:u64                     reftype:Val   dflt:""  comment:""

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
amc_vis atf_spdk.% > $HOME1/av_openacr/atf_spdk_viz.txt
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
## to run pipeline locally 
atf_ci -cijob:%



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

git push ssh://git@gitlab.vovaco.com:1008/algornd/arnd.git HEAD    #non-default 
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

# atf_spdk help
```
atf_spdk: SPDK testing tool
Usage: atf_spdk [options]
    OPTION         TYPE    DFLT    COMMENT
    -in            string  "data"  Input directory or filename, - for stdin
    -list                          (action) List discovered controllers & namespaces
    -test                          (action) Test selected controller
    -read                          (with -test) Perform reads
    -vmd                           Enable Intel VMD module (Volume Management Device)
    -ns            regx    ""      Regx of namespace(s) to test
    -reqdepth      int     5       Max request depth
    -logblocksize  int     20      Request block size
    -write                         (with -test) Perform writes
    -nblocks       int     0       Number of blocks to read/write
    -verbose       int             Verbosity level (0..255); alias -v; cumulative
    -debug         int             Debug level (0..255); alias -d; cumulative
    -help                          Print help and exit; alias -h
    -version                       Print version and exit
    -signature                     Show signatures and exit; alias -sig
```

# atf work log
## 2/5
- rebase mistery
- convert to explicit destrucitrs for spdk
## 2/3 
- add vrfy and verblog
- research why some dtr + cleanup are not called. 
```
called
// --- atf_spdk.FCtrlr..Dtor
inline  atf_spdk::FCtrlr::~FCtrlr() {
    atf_spdk::FCtrlr_Uninit(*this);
}
// --- atf_spdk.FCtrlr..Uninit
inline void atf_spdk::FCtrlr_Uninit(atf_spdk::FCtrlr& ctrlr) {
    atf_spdk::FCtrlr &row = ctrlr; (void)row;
    ctrlr_Cleanup(ctrlr); // dmmeta.fcleanup:atf_spdk.FCtrlr.ctrlr
}

not called
// --- atf_spdk.FNs..Dtor
inline  atf_spdk::FNs::~FNs() {
    atf_spdk::FNs_Uninit(*this);
}

// --- atf_spdk.FNs..Uninit
void atf_spdk::FNs_Uninit(atf_spdk::FNs& ns) {
    atf_spdk::FNs &row = ns; (void)row;
    qpair_Cleanup(ns); // dmmeta.fcleanup:atf_spdk.FNs.qpair
    zd_req_Cascdel(ns); // dmmeta.cascdel:atf_spdk.FNs.zd_req
    atf_spdk::FCtrlr* p_p_ctrlr = row.p_ctrlr;
    if (p_p_ctrlr)  {
        zd_ns_Remove(*p_p_ctrlr, row);// remove ns from index zd_ns
    }
}
```

## 2/2  - set up debuging  and git double repo



# style questions

## pointer and reference names
```
static atf_spdk::FReq* CreateReq(atf_spdk::FNs *fns) {
    atf_spdk::FReq *req= &atf_spdk::req_Alloc();
    req->p_ns = fns;
```
-when to use lower case f{type}? should this be? 
```
    atf_spdk::FReq *freq= &atf_spdk::req_Alloc();
```
-when to use p_{type} ?

## exit on err
```
    if (_db.cmdline.test && cd_selns_EmptyQ()) {
        prlog("No namespaces matched selector. Try with -list flag to see the list of available namespaces");
        algo_lib::_db.exit_code=1;
    }

    if (_db.cmdline.test) {
        RunTest();
    }
```

Is it desirable to enter RunTest after algo_lib::_db.exit_code=1; relying on a separate fact that list is empty or should there be a separate test ??

