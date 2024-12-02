
-tut3  generates steps fnction and tut1 does not
-need namespace to compile algo::CurrUnTime() and algo::get_cycles()

===to show
-all gen c code
amc myns.%order%
-Show prototypes
amc myns.%order% -proto


===to keep my repo under openacr
.git\info\exclude

av_openacr
.gitmodules

==to see prefixes
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


todo:
=test heap
-attempt to inherit order from the ssim file
-test UI
-bbbb