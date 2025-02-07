# Ctype             Comment
# dmmeta.Ns         Namespace (for in-memory database, protocol, etc)
# algo.Smallstr16   inline string with length field
# dmmeta.Nstype     Namespace type
# dev.License       Source code license
# algo.Comment      Generic comment for ssim tuples
# dev.Target        Build target
# dmmeta.Ctype      Struct
# algo.Smallstr100  inline string with length field
# dmmeta.Fcmdline   Annotate field that holds process command line
# dmmeta.Field      Specify field of a struct
# bool              1-byte bool, c++ type.
# algo.Smallstr50   inline string with length field
# dmmeta.Reftype    Field type constructor (e.g. reference type)
# algo.CppExpr      C++ expression
# dmmeta.Fwddecl    Request forward declaration of a field
# dmmeta.Main       Generate Main function for namespace
# dmmeta.Nscpp      Generate C++ code for this namespace
# dmmeta.Nsx        Control code-generation and exception handling options for process/library
# dmmeta.Tracerec   Trace record
# dmmeta.Xref       Specify how to cross-reference (i.e. project, or group-by) one record with another
# algo.Smallstr200  inline string with length field
# dev.Targdep       Dependency between targets
# dev.Targsrc       List of sources for target
# dev.Gitfile       File managed by git
# algo.Smallstr10   inline string with length field
# dev.Targsyslib    Use of system library by target
# dev.Syslib        Registered system library
# dev.Uname         List of known unames
# dmmeta.Cfmt       Specify options for printing/reading ctypes into multiple formats
# dmmeta.Strfmt     Cfmt conversion type (misnomer, not necessarily a string)
# dmmeta.Printfmt   Print format
# algo.Smallstr20   inline string with length field
# dmmeta.Cpptype    Specify whether a ctype can be passed by value, and other c++ options
# dmmeta.Ctypelen   Size of Ctype
# dmmeta.Pack       Request byte-packing of structure fields
# dmmeta.Anonfld    Omit field name where possible (command line, enums, constants)
# dmmeta.Cascdel    Request cascading delete of referenced rows
# dmmeta.Fcast      Generate implicit conversion from field to c++ expression
# dmmeta.Fcleanup   Request user-implemented function to be called at Uninit time for a field
# dmmeta.Fconst     Specify enum value (integer + string constant) for a field
# dmmeta.Llist      Options for Llist field
# dmmeta.Listtype   Specify structure of linked list based on field prefix

# e.g. dmmeta.ns  ns:""  nstype:""  license:""  comment:""
# e.g. dev.target  target:""
# e.g. dmmeta.ctype  ctype:""  comment:""
# e.g. dmmeta.fcmdline  field:""  read:""  basecmdline:""  comment:""
# e.g. dmmeta.field  field:""  arg:""  reftype:""  dflt:""  comment:""
# e.g. dmmeta.fwddecl  fwddecl:""  comment:""
# e.g. dmmeta.main  ns:""  ismodule:""
# e.g. dmmeta.nscpp  ns:""  comment:""
# e.g. dmmeta.nsx  ns:""  genthrow:""  correct_getorcreate:""  pool:""  sortxref:""  pack:""  comment:""
# e.g. dmmeta.tracerec  tracerec:""  comment:""
# e.g. dmmeta.xref  field:""  inscond:""  via:""
# e.g. dev.targdep  targdep:""  comment:""
# e.g. dev.targsrc  targsrc:""  comment:""
# e.g. dev.targsyslib  targsyslib:""  comment:""
# e.g. dmmeta.cfmt  cfmt:""  printfmt:""  read:""  print:""  sep:""  genop:""  comment:""
# e.g. dmmeta.cpptype  ctype:""  ctor:""  dtor:""  cheap_copy:""
# e.g. dmmeta.ctypelen  ctype:""  len:""  alignment:""  padbytes:""  plaindata:""
# e.g. dmmeta.pack  ctype:""  comment:""
# e.g. dmmeta.anonfld  field:""  comment:""
# e.g. dmmeta.cascdel  field:""  comment:""
# e.g. dmmeta.fcast  field:""  expr:""  comment:""
# e.g. dmmeta.fcleanup  field:""  comment:""
# e.g. dmmeta.fconst  fconst:""  value:""  comment:""
# e.g. dmmeta.llist  field:""  havetail:""  havecount:""  comment:""

dmmeta.ns  ns:atf_spdk  nstype:exe  license:GPL  comment:"SPDK testing tool"
  dev.target  target:atf_spdk
    dev.targdep  targdep:atf_spdk.algo_lib  comment:""
    dev.targdep  targdep:atf_spdk.lib_prot  comment:""
    dev.targsrc  targsrc:atf_spdk/cpp/atf_spdk/atf_spdk.cpp       comment:""
    dev.targsrc  targsrc:atf_spdk/cpp/gen/atf_spdk_gen.cpp        comment:""
    dev.targsrc  targsrc:atf_spdk/include/atf_spdk.h              comment:""
    dev.targsrc  targsrc:atf_spdk/include/gen/atf_spdk_gen.h      comment:""
    dev.targsrc  targsrc:atf_spdk/include/gen/atf_spdk_gen.inl.h  comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.aio       comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.crypto    comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.fuse3     comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.keyutils  comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.m         comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.pthread   comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.rt        comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.ssl       comment:""
    dev.targsyslib  targsyslib:Linux/atf_spdk.uuid      comment:""

  dmmeta.ctype  ctype:atf_spdk.FCtrlr  comment:""
    dmmeta.field  field:atf_spdk.FCtrlr.ctrlr  acr.rowid:0       arg:spdk_nvme_ctrlr  reftype:Ptr  dflt:""  comment:"controller handle from SPDK"
      # dmmeta.fcleanup  field:atf_spdk.FCtrlr.ctrlr  comment:""

    dmmeta.field  field:atf_spdk.FCtrlr.key  acr.rowid:1       arg:algo.cstring  reftype:Val  dflt:""  comment:"controller primary key (PCI address)"
    dmmeta.ctypelen  ctype:atf_spdk.FCtrlr  len:48  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FDb  comment:""
    dmmeta.field  field:atf_spdk.FDb._db      acr.rowid:0       arg:atf_spdk.FDb      reftype:Global  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.cmdline  acr.rowid:1       arg:command.atf_spdk  reftype:Val     dflt:""  comment:""
      dmmeta.fcmdline  field:atf_spdk.FDb.cmdline  read:Y  basecmdline:algo_lib.FDb.cmdline  comment:""

    dmmeta.field  field:atf_spdk.FDb.ctrlr         acr.rowid:2       arg:atf_spdk.FCtrlr         reftype:Lary  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.spdk_opts     acr.rowid:3       arg:spdk_env_opts           reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.trid          acr.rowid:4       arg:spdk_nvme_transport_id  reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_req_compl   acr.rowid:6       arg:u64                     reftype:Val  dflt:""  comment:"Total requests completed"
    dmmeta.field  field:atf_spdk.FDb.n_req_post    acr.rowid:7       arg:u64                     reftype:Val  dflt:""  comment:"Total # of reqs posted"
    dmmeta.field  field:atf_spdk.FDb.n_req_read    acr.rowid:8       arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_req_write   acr.rowid:9       arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.next_req_id   acr.rowid:11      arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_byte_total  acr.rowid:13      arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FDb  len:552  alignment:8  padbytes:19  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FNs  comment:"Namespace - a piece of controller"
    dmmeta.field  field:atf_spdk.FCtrlr.zd_ns  acr.rowid:2       arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:"List of namespaces"
      dmmeta.cascdel  field:atf_spdk.FCtrlr.zd_ns  comment:""
      dmmeta.llist  field:atf_spdk.FCtrlr.zd_ns  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FDb.ns        acr.rowid:5       arg:atf_spdk.FNs  reftype:Tpool  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.cd_selns  acr.rowid:12      arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:""
      dmmeta.llist  field:atf_spdk.FDb.cd_selns  havetail:N  havecount:Y  comment:""
      dmmeta.xref  field:atf_spdk.FDb.cd_selns  acr.rowid:2       inscond:false  via:""

    dmmeta.field  field:atf_spdk.FDb.zd_allns  acr.rowid:14      arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:""
      dmmeta.llist  field:atf_spdk.FDb.zd_allns  havetail:Y  havecount:Y  comment:""
      dmmeta.xref  field:atf_spdk.FDb.zd_allns  acr.rowid:5       inscond:true  via:""

    dmmeta.field  field:atf_spdk.FNs.p_ctrlr   acr.rowid:0       arg:atf_spdk.FCtrlr  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:atf_spdk.FCtrlr.zd_ns  acr.rowid:0       inscond:true  via:atf_spdk.FNs.p_ctrlr/atf_spdk.FNs.p_ctrlr

    dmmeta.field  field:atf_spdk.FNs.ns     acr.rowid:1       arg:spdk_nvme_ns     reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.qpair  acr.rowid:2       arg:spdk_nvme_qpair  reftype:Ptr  dflt:""  comment:"qpair for namespace"
      # dmmeta.fcleanup  field:atf_spdk.FNs.qpair  comment:""

    dmmeta.field  field:atf_spdk.FNs.ns_size        acr.rowid:3       arg:u64           reftype:Val  dflt:""  comment:"namespace size in bytes"
    dmmeta.field  field:atf_spdk.FNs.sector_size    acr.rowid:4       arg:u32           reftype:Val  dflt:""  comment:"sector size in bytes"
    dmmeta.field  field:atf_spdk.FNs.n_req_compl    acr.rowid:5       arg:u64           reftype:Val  dflt:""  comment:"Total # of reqs completed"
    dmmeta.field  field:atf_spdk.FNs.n_req_post     acr.rowid:6       arg:u64           reftype:Val  dflt:""  comment:"Total # of reqs posted"
    dmmeta.field  field:atf_spdk.FNs.key            acr.rowid:9       arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.next_block_id  acr.rowid:11      arg:u64           reftype:Val  dflt:""  comment:""
    dmmeta.cfmt  cfmt:atf_spdk.FNs.String  printfmt:Tuple  read:Y  print:Y  sep:""  genop:Y  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FNs  len:208  alignment:8  padbytes:16  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FReq  comment:""
    dmmeta.cpptype  ctype:atf_spdk.FReq  ctor:Y  dtor:N  cheap_copy:N
    dmmeta.pack  ctype:atf_spdk.FReq  comment:""
    dmmeta.field  field:atf_spdk.FDb.req     acr.rowid:10      arg:atf_spdk.FReq  reftype:Tpool  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.zd_req  acr.rowid:7       arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:"All requests"
      # dmmeta.cascdel  field:atf_spdk.FNs.zd_req  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_req  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FNs.zd_freereq  acr.rowid:8       arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:"Free requests (not participating in I/O)"
      # dmmeta.cascdel  field:atf_spdk.FNs.zd_freereq  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_freereq  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FNs.zd_complreq  acr.rowid:10      arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:""
      # dmmeta.cascdel  field:atf_spdk.FNs.zd_complreq  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_complreq  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FReq.p_ns        acr.rowid:0       arg:atf_spdk.FNs  reftype:Upptr  dflt:""  comment:"ns_entry for current operation"
      dmmeta.xref  field:atf_spdk.FNs.zd_req       acr.rowid:1       inscond:true   via:atf_spdk.FReq.p_ns/atf_spdk.FReq.p_ns
      dmmeta.xref  field:atf_spdk.FNs.zd_freereq   acr.rowid:3       inscond:true   via:atf_spdk.FReq.p_ns/atf_spdk.FReq.p_ns
      dmmeta.xref  field:atf_spdk.FNs.zd_complreq  acr.rowid:4       inscond:false  via:atf_spdk.FReq.p_ns

    dmmeta.field  field:atf_spdk.FReq.buf  acr.rowid:1       arg:algo.memptr  reftype:Val  dflt:""  comment:"spdk memory"
      # dmmeta.fcleanup  field:atf_spdk.FReq.buf  comment:""

    dmmeta.field  field:atf_spdk.FReq.req_id        acr.rowid:2       arg:u64   reftype:Val  dflt:""  comment:"request id"
    dmmeta.field  field:atf_spdk.FReq.block_id      acr.rowid:4       arg:u32   reftype:Val  dflt:""  comment:"current  block number for this context"
    dmmeta.field  field:atf_spdk.FReq.using_cmb_io  acr.rowid:5       arg:bool  reftype:Val  dflt:""  comment:"flag to indicate if controller memory buffer is used"
    dmmeta.field  field:atf_spdk.FReq.compl_status  acr.rowid:6       arg:i32   reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FReq  len:98  alignment:1  padbytes:0  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.ReqType  comment:""
    dmmeta.cpptype  ctype:atf_spdk.ReqType  ctor:Y  dtor:N  cheap_copy:Y
    dmmeta.pack  ctype:atf_spdk.ReqType  comment:""
    dmmeta.field  field:atf_spdk.FReq.req_type  acr.rowid:3       arg:atf_spdk.ReqType  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.ReqType.value  acr.rowid:0       arg:u8  reftype:Val  dflt:""  comment:""
      dmmeta.anonfld  field:atf_spdk.ReqType.value  comment:""
      dmmeta.fcast  field:atf_spdk.ReqType.value  expr:""  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/read        acr.rowid:0       value:0  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/write       acr.rowid:1       value:1  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/write_zero  acr.rowid:2       value:2  comment:""

    dmmeta.cfmt  cfmt:atf_spdk.ReqType.String  printfmt:Raw  read:Y  print:Y  sep:""  genop:Y  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.ReqType  len:1  alignment:1  padbytes:0  plaindata:Y

  dmmeta.fwddecl  fwddecl:atf_spdk.spdk_env_opts           comment:""
  dmmeta.fwddecl  fwddecl:atf_spdk.spdk_nvme_ctrlr         comment:""
  dmmeta.fwddecl  fwddecl:atf_spdk.spdk_nvme_ns            comment:""
  dmmeta.fwddecl  fwddecl:atf_spdk.spdk_nvme_qpair         comment:""
  dmmeta.fwddecl  fwddecl:atf_spdk.spdk_nvme_transport_id  comment:""
  dmmeta.main  ns:atf_spdk  ismodule:N
  dmmeta.nscpp  ns:atf_spdk  comment:""
  dmmeta.nsx  ns:atf_spdk  genthrow:Y  correct_getorcreate:Y  pool:algo_lib.FDb.malloc  sortxref:Y  pack:N  comment:""
  dmmeta.tracerec  tracerec:atf_spdk.trace  comment:""

# Field                           Arg               Reftype  Comment
# dmmeta.Ns.ns                    algo.Smallstr16   Val      Namespace name (primary key)
# dmmeta.Ns.nstype                dmmeta.Nstype     Pkey     Namespace type
# dmmeta.Ns.license               dev.License       Pkey     Associated license
# dmmeta.Ns.comment               algo.Comment      Val
# dev.Target.target               dmmeta.Ns         Pkey     Primary key - name of target
# dmmeta.Ctype.ctype              algo.Smallstr100  Val      Identifier. must be ns.typename
# dmmeta.Ctype.comment            algo.Comment      Val
# dmmeta.Fcmdline.field           dmmeta.Field      Pkey     Parent field
# dmmeta.Fcmdline.read            bool              Val      Read the command line automatically from main?
# dmmeta.Fcmdline.basecmdline     dmmeta.Field      Pkey     Optional command line to merge with this one
# dmmeta.Fcmdline.comment         algo.Comment      Val
# dmmeta.Field.field              algo.Smallstr100  Val      Primary key, as ctype.name
# dmmeta.Field.arg                dmmeta.Ctype      Pkey     Type of field
# dmmeta.Field.reftype            dmmeta.Reftype    Pkey     Type constructor
# dmmeta.Field.dflt               algo.CppExpr      Val      Default value (c++ expression)
# dmmeta.Field.comment            algo.Comment      Val
# dmmeta.Fwddecl.fwddecl          algo.Smallstr100  Val
# dmmeta.Fwddecl.comment          algo.Comment      Val
# dmmeta.Main.ns                  dmmeta.Ns         Pkey
# dmmeta.Main.ismodule            bool              Val
# dmmeta.Nscpp.ns                 dmmeta.Ns         Pkey
# dmmeta.Nscpp.comment            algo.Comment      Val
# dmmeta.Nsx.ns                   dmmeta.Ns         Pkey
# dmmeta.Nsx.genthrow             bool              Val
# dmmeta.Nsx.correct_getorcreate  bool              Val
# dmmeta.Nsx.pool                 dmmeta.Field      Pkey
# dmmeta.Nsx.sortxref             bool              Val
# dmmeta.Nsx.pack                 bool              Val
# dmmeta.Nsx.comment              algo.Comment      Val
# dmmeta.Tracerec.tracerec        algo.Smallstr50   Val      e.g. rl_lib.trace
# dmmeta.Tracerec.comment         algo.Comment      Val
# dmmeta.Xref.field               dmmeta.Field      Pkey
# dmmeta.Xref.inscond             algo.CppExpr      Val      Insert condition
# dmmeta.Xref.via                 algo.Smallstr200  Val
# dev.Targdep.targdep             algo.Smallstr50   Val      Primary key - target.parent
# dev.Targdep.comment             algo.Comment      Val
# dev.Targsrc.targsrc             algo.Smallstr100  Val
# dev.Targsrc.comment             algo.Comment      Val
# dev.Targsyslib.targsyslib       algo.Smallstr50   Val
# dev.Targsyslib.comment          algo.Comment      Val
# dmmeta.Cfmt.cfmt                algo.Smallstr100  Val
# dmmeta.Cfmt.printfmt            dmmeta.Printfmt   Pkey
# dmmeta.Cfmt.read                bool              Val
# dmmeta.Cfmt.print               bool              Val
# dmmeta.Cfmt.sep                 algo.Smallstr20   Val
# dmmeta.Cfmt.genop               bool              Val
# dmmeta.Cfmt.comment             algo.Comment      Val
# dmmeta.Cpptype.ctype            dmmeta.Ctype      Pkey
# dmmeta.Cpptype.ctor             bool              Val      if true, generate non-default constructor from all fields
# dmmeta.Cpptype.dtor             bool              Val      generate non-default destructor
# dmmeta.Cpptype.cheap_copy       bool              Val      Pass by value whenever possible
# dmmeta.Ctypelen.ctype           dmmeta.Ctype      Pkey     Identifies the Ctype
# dmmeta.Ctypelen.len             u32               Val      (calculated) length of the C++ struct in bytes
# dmmeta.Ctypelen.alignment       i32               Val      (calculated) alignment for the struct
# dmmeta.Ctypelen.padbytes        i32               Val      (calculated) total # of pad bytes
# dmmeta.Ctypelen.plaindata       bool              Val      (calculated) this struct can me safely memcpy'ed
# dmmeta.Pack.ctype               dmmeta.Ctype      Pkey     Target ctype
# dmmeta.Pack.comment             algo.Comment      Val
# dmmeta.Anonfld.field            dmmeta.Field      Pkey
# dmmeta.Anonfld.comment          algo.Comment      Val
# dmmeta.Cascdel.field            dmmeta.Field      Pkey
# dmmeta.Cascdel.comment          algo.Comment      Val
# dmmeta.Fcast.field              dmmeta.Field      Pkey
# dmmeta.Fcast.expr               algo.Smallstr100  Val
# dmmeta.Fcast.comment            algo.Comment      Val
# dmmeta.Fcleanup.field           dmmeta.Field      Pkey
# dmmeta.Fcleanup.comment         algo.Comment      Val
# dmmeta.Fconst.fconst            algo.Smallstr100  Val
# dmmeta.Fconst.value             algo.CppExpr      Val
# dmmeta.Fconst.comment           algo.Comment      Val
# dmmeta.Llist.field              dmmeta.Field      Pkey     Index in question
# dmmeta.Llist.havetail           bool              Val      Generate 'tail' field
# dmmeta.Llist.havecount          bool              Val      Generate count of elements
# dmmeta.Llist.comment            algo.Comment      Val
