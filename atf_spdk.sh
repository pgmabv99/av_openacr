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
    dev.tgtcov  target:atf_spdk  cov_min:0.00  maxerr:0.00  comment:""

  dmmeta.ctype  ctype:atf_spdk.FCtrlr  comment:""
    dmmeta.field  field:atf_spdk.FCtrlr.ctrlr  arg:spdk_nvme_ctrlr  reftype:Ptr  dflt:""  comment:"controller handle from SPDK"
    dmmeta.field  field:atf_spdk.FCtrlr.key    arg:algo.cstring     reftype:Val  dflt:""  comment:"controller primary key (PCI address)"
    dmmeta.ctypelen  ctype:atf_spdk.FCtrlr  len:48  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FDb  comment:""
    dmmeta.field  field:atf_spdk.FDb._db      arg:atf_spdk.FDb      reftype:Global  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.cmdline  arg:command.atf_spdk  reftype:Val     dflt:""  comment:""
      dmmeta.fcmdline  field:atf_spdk.FDb.cmdline  read:Y  basecmdline:algo_lib.FDb.cmdline  comment:""

    dmmeta.field  field:atf_spdk.FDb.ctrlr          arg:atf_spdk.FCtrlr         reftype:Lary  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.spdk_opts      arg:spdk_env_opts           reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.trid           arg:spdk_nvme_transport_id  reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_req_compl    arg:u64                     reftype:Val  dflt:""  comment:"Total requests completed"
    dmmeta.field  field:atf_spdk.FDb.n_req_post     arg:u64                     reftype:Val  dflt:""  comment:"Total # of reqs posted"
    dmmeta.field  field:atf_spdk.FDb.n_req_read     arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_req_write    arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.next_req_id    arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.n_byte_total   arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.sum_elapse_us  arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.sum_1          arg:u64                     reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FDb  len:568  alignment:8  padbytes:19  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FNs  comment:"Namespace - a piece of controller"
    dmmeta.field  field:atf_spdk.FCtrlr.zd_ns  arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:"List of namespaces"
      dmmeta.cascdel  field:atf_spdk.FCtrlr.zd_ns  comment:""
      dmmeta.llist  field:atf_spdk.FCtrlr.zd_ns  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FDb.ns        arg:atf_spdk.FNs  reftype:Tpool  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FDb.cd_selns  arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:""
      dmmeta.llist  field:atf_spdk.FDb.cd_selns  havetail:N  havecount:Y  comment:""
      dmmeta.xref  field:atf_spdk.FDb.cd_selns  inscond:false  via:""

    dmmeta.field  field:atf_spdk.FDb.zd_allns  arg:atf_spdk.FNs  reftype:Llist  dflt:""  comment:""
      dmmeta.llist  field:atf_spdk.FDb.zd_allns  havetail:Y  havecount:Y  comment:""
      dmmeta.xref  field:atf_spdk.FDb.zd_allns  inscond:true  via:""

    dmmeta.field  field:atf_spdk.FNs.p_ctrlr   arg:atf_spdk.FCtrlr  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:atf_spdk.FCtrlr.zd_ns  inscond:true  via:atf_spdk.FNs.p_ctrlr/atf_spdk.FNs.p_ctrlr

    dmmeta.field  field:atf_spdk.FNs.ns             arg:spdk_nvme_ns     reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.qpair          arg:spdk_nvme_qpair  reftype:Ptr  dflt:""  comment:"qpair for namespace"
    dmmeta.field  field:atf_spdk.FNs.ns_size        arg:u64              reftype:Val  dflt:""  comment:"namespace size in bytes"
    dmmeta.field  field:atf_spdk.FNs.sector_size    arg:u32              reftype:Val  dflt:""  comment:"sector size in bytes"
    dmmeta.field  field:atf_spdk.FNs.n_req_compl    arg:u64              reftype:Val  dflt:""  comment:"Total # of reqs completed"
    dmmeta.field  field:atf_spdk.FNs.n_req_post     arg:u64              reftype:Val  dflt:""  comment:"Total # of reqs posted"
    dmmeta.field  field:atf_spdk.FNs.key            arg:algo.cstring     reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.next_block_id  arg:u64              reftype:Val  dflt:""  comment:""
    dmmeta.cfmt  cfmt:atf_spdk.FNs.String  printfmt:Tuple  read:Y  print:Y  sep:""  genop:Y  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FNs  len:208  alignment:8  padbytes:16  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.FReq  comment:""
    dmmeta.cpptype  ctype:atf_spdk.FReq  ctor:Y  dtor:N  cheap_copy:N
    dmmeta.pack  ctype:atf_spdk.FReq  comment:""
    dmmeta.field  field:atf_spdk.FDb.req     arg:atf_spdk.FReq  reftype:Tpool  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FNs.zd_req  arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:"All requests"
      dmmeta.cascdel  field:atf_spdk.FNs.zd_req  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_req  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FNs.zd_freereq  arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:"Free requests (not participating in I/O)"
      dmmeta.cascdel  field:atf_spdk.FNs.zd_freereq  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_freereq  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FNs.zd_complreq  arg:atf_spdk.FReq  reftype:Llist  dflt:""  comment:""
      dmmeta.cascdel  field:atf_spdk.FNs.zd_complreq  comment:""
      dmmeta.llist  field:atf_spdk.FNs.zd_complreq  havetail:Y  havecount:Y  comment:""

    dmmeta.field  field:atf_spdk.FReq.p_ns        arg:atf_spdk.FNs  reftype:Upptr  dflt:""  comment:"ns_entry for current operation"
      dmmeta.xref  field:atf_spdk.FNs.zd_req       inscond:true   via:atf_spdk.FReq.p_ns/atf_spdk.FReq.p_ns
      dmmeta.xref  field:atf_spdk.FNs.zd_freereq   inscond:true   via:atf_spdk.FReq.p_ns/atf_spdk.FReq.p_ns
      dmmeta.xref  field:atf_spdk.FNs.zd_complreq  inscond:false  via:atf_spdk.FReq.p_ns

    dmmeta.field  field:atf_spdk.FReq.buf           arg:algo.memptr     reftype:Val  dflt:""  comment:"spdk memory"
    dmmeta.field  field:atf_spdk.FReq.req_id        arg:u64             reftype:Val  dflt:""  comment:"request id"
    dmmeta.field  field:atf_spdk.FReq.block_id      arg:u32             reftype:Val  dflt:""  comment:"current  block number for this context"
    dmmeta.field  field:atf_spdk.FReq.using_cmb_io  arg:bool            reftype:Val  dflt:""  comment:"flag to indicate if controller memory buffer is used"
    dmmeta.field  field:atf_spdk.FReq.compl_status  arg:i32             reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.FReq.tstamp        arg:algo.SchedTime  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_spdk.FReq  len:106  alignment:1  padbytes:0  plaindata:N

  dmmeta.ctype  ctype:atf_spdk.ReqType  comment:""
    dmmeta.cpptype  ctype:atf_spdk.ReqType  ctor:Y  dtor:N  cheap_copy:Y
    dmmeta.pack  ctype:atf_spdk.ReqType  comment:""
    dmmeta.field  field:atf_spdk.FReq.req_type  arg:atf_spdk.ReqType  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_spdk.ReqType.value  arg:u8  reftype:Val  dflt:""  comment:""
      dmmeta.anonfld  field:atf_spdk.ReqType.value  comment:""
      dmmeta.fcast  field:atf_spdk.ReqType.value  expr:""  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/read        value:0  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/write       value:1  comment:""
      dmmeta.fconst  fconst:atf_spdk.ReqType.value/write_zero  value:2  comment:""

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
report.acr  n_select:107  n_insert:0  n_delete:0  n_ignore:0  n_update:0  n_file_mod:0
