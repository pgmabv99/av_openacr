dmmeta.ns  ns:atf_snf  nstype:exe  license:GPL  comment:"IBV Sniffer testing tool"
  dev.target  target:atf_snf
    dev.targdep  targdep:atf_snf.algo_lib  comment:""
    dev.targdep  targdep:atf_snf.lib_prot  comment:""
    dev.targsrc  targsrc:atf_snf/cpp/atf_snf/atf_snf.cpp        comment:""
    dev.targsrc  targsrc:atf_snf/cpp/gen/atf_snf_gen.cpp        comment:""
    dev.targsrc  targsrc:atf_snf/include/atf_snf.h              comment:""
    dev.targsrc  targsrc:atf_snf/include/gen/atf_snf_gen.h      comment:""
    dev.targsrc  targsrc:atf_snf/include/gen/atf_snf_gen.inl.h  comment:""
    dev.targsyslib  targsyslib:Linux/atf_snf.ibverbs  comment:""
    dev.targsyslib  targsyslib:Linux/atf_snf.rdmacm  comment:""
    dev.tgtcov  target:atf_snf  cov_min:0.00  maxerr:0.00  comment:""

  dmmeta.ctype  ctype:atf_snf.FDb  comment:""
    dmmeta.field  field:atf_snf.FDb._db      arg:atf_snf.FDb      reftype:Global  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FDb.cmdline  arg:command.atf_snf  reftype:Val     dflt:""  comment:""
      dmmeta.fcmdline  field:atf_snf.FDb.cmdline  read:Y  basecmdline:algo_lib.FDb.cmdline  comment:""

    dmmeta.field  field:atf_snf.FDb.nodename  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_snf.FDb  len:944  alignment:8  padbytes:11  plaindata:N

  dmmeta.ctype  ctype:atf_snf.FIntfname  comment:""
    dmmeta.field  field:atf_snf.FDb.intfname      arg:atf_snf.FIntfname  reftype:Lary   dflt:""  comment:""
    dmmeta.field  field:atf_snf.FDb.ind_intfname  arg:atf_snf.FIntfname  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:atf_snf.FDb.ind_intfname  hashfld:x2rdb.Intfname.intfname  unique:Y  comment:""
      dmmeta.xref  field:atf_snf.FDb.ind_intfname  inscond:true  via:""

    dmmeta.field  field:atf_snf.FIntfname.base       arg:x2rdb.Intfname  reftype:Base  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.pci        arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.ib         arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.port_cnt   arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.raw        arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.ts         arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.node       arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.clock_kHz  arg:u64           reftype:Val  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FIntfname.p_dev      arg:ibv_device    reftype:Ptr  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_snf.FIntfname  len:328  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:atf_snf.FMemqp  comment:""
    dmmeta.field  field:atf_snf.FDb.memqp     arg:atf_snf.FMemqp  reftype:Lary  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FMemqp.p_buf  arg:u8              reftype:Tary  dflt:""  comment:""
      dmmeta.tary  field:atf_snf.FMemqp.p_buf  aliased:N  comment:""

    dmmeta.field  field:atf_snf.FMemqp.p_mr   arg:ibv_mr   reftype:Ptr   dflt:""  comment:""
    dmmeta.field  field:atf_snf.FMemqp.p_sge  arg:ibv_sge  reftype:Tary  dflt:""  comment:""
      dmmeta.tary  field:atf_snf.FMemqp.p_sge  aliased:N  comment:""

    dmmeta.field  field:atf_snf.FMemqp.p_recv_wr  arg:ibv_recv_wr  reftype:Tary  dflt:""  comment:""
      dmmeta.tary  field:atf_snf.FMemqp.p_recv_wr  aliased:N  comment:""

    dmmeta.ctypelen  ctype:atf_snf.FMemqp  len:64  alignment:8  padbytes:7  plaindata:N

  dmmeta.ctype  ctype:atf_snf.FSnf  comment:""
    dmmeta.field  field:atf_snf.FDb.snf          arg:atf_snf.FSnf       reftype:Lary    dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.ts_mult     arg:u32                reftype:Val     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.ts_div      arg:u32                reftype:Val     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.p_context   arg:ibv_context        reftype:Ptr     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.p_intfname  arg:atf_snf.FIntfname  reftype:Ptr     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.port        arg:u8                 reftype:Val     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.p_pd        arg:ibv_pd             reftype:Ptr     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.p_flow      arg:ibv_flow           reftype:Ptr     dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.c_memqp     arg:atf_snf.FMemqp     reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:atf_snf.FSnf.c_memqp     unique:Y

    dmmeta.field  field:atf_snf.FSnf.p_cq_ex   arg:ibv_cq_ex  reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.p_qp      arg:ibv_qp  reftype:Ptr  dflt:""  comment:""
    dmmeta.field  field:atf_snf.FSnf.memqp_id  arg:u64     reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:atf_snf.FSnf  len:88  alignment:8  padbytes:7  plaindata:N

  dmmeta.ctype  ctype:atf_snf.WcOpcode  comment:""
    dmmeta.cpptype  ctype:atf_snf.WcOpcode  ctor:Y  dtor:N  cheap_copy:Y
    dmmeta.pack  ctype:atf_snf.WcOpcode  comment:""
    dmmeta.field  field:atf_snf.WcOpcode.value  arg:u8  reftype:Val  dflt:""  comment:""
      dmmeta.anonfld  field:atf_snf.WcOpcode.value  comment:""
      dmmeta.fcast  field:atf_snf.WcOpcode.value  expr:""  comment:""
      dmmeta.fconst  fconst:atf_snf.WcOpcode.value/IBV_WC_SEND        value:0    comment:""
      dmmeta.fconst  fconst:atf_snf.WcOpcode.value/IBV_WC_RDMA_WRITE  value:1    comment:""
      dmmeta.fconst  fconst:atf_snf.WcOpcode.value/IBV_WC_RDMA_READ   value:2    comment:""
      dmmeta.fconst  fconst:atf_snf.WcOpcode.value/IBV_WC_RECV        value:128  comment:""

    dmmeta.cfmt  cfmt:atf_snf.WcOpcode.String  printfmt:Raw  read:Y  print:Y  sep:""  genop:Y  comment:""
    dmmeta.ctypelen  ctype:atf_snf.WcOpcode  len:1  alignment:1  padbytes:0  plaindata:Y

  dmmeta.fwddecl  fwddecl:atf_snf.ibv_mr  comment:""
  dmmeta.main  ns:atf_snf  ismodule:N
  dmmeta.nscpp  ns:atf_snf  comment:""
  dmmeta.nsinclude  nsinclude:atf_snf/rdma/rdma_cma.h  sys:Y  comment:""
  dmmeta.nsx  ns:atf_snf  genthrow:Y  correct_getorcreate:Y  pool:algo_lib.FDb.malloc  sortxref:Y  pack:N  comment:""
  dmmeta.tracerec  tracerec:atf_snf.trace  comment:""
report.acr  n_select:76  n_insert:0  n_delete:0  n_ignore:0  n_update:0  n_file_mod:0
