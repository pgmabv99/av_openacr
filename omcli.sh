dmmeta.ns  ns:omcli  nstype:exe  license:GPL  comment:"Openmessaging Apache Kafka nodes and envs control"
  dev.target  target:omcli
    dev.targdep  targdep:omcli.algo_lib  comment:""
    dev.targdep  targdep:omcli.lib_prot  comment:""
    dev.targsrc  targsrc:omcli/cpp/gen/omcli_gen.cpp          comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/benchmark.cpp        comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/cert.cpp             comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/kafka_broker.cpp     comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/kafka_worker.cpp     comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/kafkaui.cpp          comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/kcat.cpp             comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/main.cpp             comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/nginx.cpp            comment:"Functions for omtype:x2ui"
    dev.targsrc  targsrc:omcli/cpp/omcli/omenv.cpp            comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/omparse.cpp          comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/redpanda_broker.cpp  comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/x2sup.cpp            comment:""
    dev.targsrc  targsrc:omcli/cpp/omcli/x2ui.cpp             comment:"Functions for omtype:x2ui"
    dev.targsrc  targsrc:omcli/include/gen/omcli_gen.h        comment:""
    dev.targsrc  targsrc:omcli/include/gen/omcli_gen.inl.h    comment:""
    dev.targsrc  targsrc:omcli/include/omcli.h                comment:""
    dev.tgtcov  target:omcli  cov_min:0.00  maxerr:0.00  comment:""

  dmmeta.ctype  ctype:omcli.FAkauth  comment:""
    dmmeta.field  field:omcli.FAkauth.base  arg:omdb.Akauth  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FAkauth  len:216  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FCertcanode  comment:""
    dmmeta.field  field:omcli.FCertcanode.base  arg:x2certdb.Certcanode  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FCertcanode  len:464  alignment:8  padbytes:0  plaindata:N

  dmmeta.ctype  ctype:omcli.FDb  comment:""
    dmmeta.field  field:omcli.FDb._db      arg:omcli.FDb      reftype:Global  dflt:""  comment:""
    dmmeta.field  field:omcli.FDb.cmdline  arg:command.omcli  reftype:Val     dflt:""  comment:""
      dmmeta.fcmdline  field:omcli.FDb.cmdline  read:Y  basecmdline:algo_lib.FDb.cmdline  comment:""

    dmmeta.field  field:omcli.FDb.akauth  arg:omcli.FAkauth  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.akauth  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_akauth  arg:omcli.FAkauth  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_akauth  hashfld:omdb.Akauth.akauth  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_akauth  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.certcanode  arg:omcli.FCertcanode  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.certcanode  extrn:N  update:N  strict:Y  comment:""

    dmmeta.ctypelen  ctype:omcli.FDb  len:9592  alignment:8  padbytes:123  plaindata:N

  dmmeta.ctype  ctype:omcli.FDctrport  comment:""
    dmmeta.field  field:omcli.FDb.dctrport  arg:omcli.FDctrport  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.dctrport  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_dctrport  arg:omcli.FDctrport  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_dctrport  hashfld:dkrdb.Dctrport.dctrport  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_dctrport  inscond:true  via:""

    dmmeta.field  field:omcli.FDctrport.base  arg:dkrdb.Dctrport  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FDctrport  len:480  alignment:8  padbytes:7  plaindata:N

  dmmeta.ctype  ctype:omcli.FDevintf  comment:""
    dmmeta.field  field:omcli.FDb.devintf  arg:omcli.FDevintf  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.devintf  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_devintf  arg:omcli.FDevintf  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_devintf  hashfld:x2rdb.Devintf.devintf  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_devintf  inscond:true  via:""

    dmmeta.field  field:omcli.FDevintf.base  arg:x2rdb.Devintf  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FDevintf  len:264  alignment:8  padbytes:0  plaindata:N

  dmmeta.ctype  ctype:omcli.FGwproto  comment:""
    dmmeta.field  field:omcli.FDb.gwproto  arg:omcli.FGwproto  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.gwproto  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FGwproto.base  arg:x2db.Gwproto  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FGwproto  len:260  alignment:4  padbytes:0  plaindata:Y

  dmmeta.ctype  ctype:omcli.FIntftld  comment:""
    dmmeta.field  field:omcli.FDb.intftld  arg:omcli.FIntftld  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.intftld  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_intftld  arg:omcli.FIntftld  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_intftld  hashfld:omdb.Intftld.intftld  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_intftld  inscond:true  via:""

    dmmeta.field  field:omcli.FIntftld.base  arg:omdb.Intftld  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FIntftld  len:272  alignment:8  padbytes:7  plaindata:N

  dmmeta.ctype  ctype:omcli.FNode  comment:""
    dmmeta.field  field:omcli.FCertcanode.p_node  arg:omcli.FNode  reftype:Upptr  dflt:""  comment:""
    dmmeta.field  field:omcli.FDb.node            arg:omcli.FNode  reftype:Lary   dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.node            extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_node  arg:omcli.FNode  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_node  hashfld:x2rdb.Node.node  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_node        inscond:true  via:""
      dmmeta.xref  field:omcli.FCertcanode.p_node  inscond:true  via:omcli.FDb.ind_node/x2certdb.Certcanode.node

    dmmeta.field  field:omcli.FDb.c_node_nx  arg:omcli.FNode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_node_nx  unique:Y

    dmmeta.field  field:omcli.FNode.base       arg:x2rdb.Node      reftype:Base   dflt:""  comment:""
    dmmeta.field  field:omcli.FNode.p_devintf  arg:omcli.FDevintf  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FNode.p_devintf  inscond:true  via:omcli.FDb.ind_devintf/x2rdb.Node.devintf

    dmmeta.field  field:omcli.FNode.alive  arg:bool  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FNode  len:344  alignment:8  padbytes:14  plaindata:N

  dmmeta.ctype  ctype:omcli.FNodeacct  comment:""
    dmmeta.field  field:omcli.FDb.nodeacct  arg:omcli.FNodeacct  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.nodeacct  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FNode.c_nodeacct  arg:omcli.FNodeacct  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FNode.c_nodeacct  unique:Y
      dmmeta.xref  field:omcli.FNode.c_nodeacct  inscond:true  via:omcli.FDb.ind_node/x2rdb.Nodeacct.node

    dmmeta.field  field:omcli.FNodeacct.base  arg:x2rdb.Nodeacct  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FNodeacct  len:208  alignment:1  padbytes:0  plaindata:Y

  dmmeta.ctype  ctype:omcli.FNodecname  comment:""
    dmmeta.field  field:omcli.FDb.nodecname  arg:omcli.FNodecname  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.nodecname  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FNode.c_nodecname  arg:omcli.FNodecname  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FNode.c_nodecname  unique:Y
      dmmeta.xref  field:omcli.FNode.c_nodecname  inscond:true  via:omcli.FDb.ind_node/x2rdb.Nodecname.node

    dmmeta.field  field:omcli.FNodecname.base  arg:x2rdb.Nodecname  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FNodecname  len:432  alignment:8  padbytes:10  plaindata:N

  dmmeta.ctype  ctype:omcli.FNodedctr  comment:""
    dmmeta.field  field:omcli.FDb.nodedctr  arg:omcli.FNodedctr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.nodedctr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_nodedctr  arg:omcli.FNodedctr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_nodedctr  hashfld:x2rdb.Nodedctr.node  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_nodedctr  inscond:true  via:""

    dmmeta.field  field:omcli.FNode.c_nodedctr  arg:omcli.FNodedctr  reftype:Ptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FNode.c_nodedctr  inscond:true  via:omcli.FDb.ind_node/x2rdb.Nodedctr.node

    dmmeta.field  field:omcli.FNodedctr.base  arg:x2rdb.Nodedctr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FNodedctr  len:64  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FNodedkr  comment:""
    dmmeta.field  field:omcli.FDb.nodedkr  arg:omcli.FNodedkr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.nodedkr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FNodedkr.base    arg:x2rdb.Nodedkr  reftype:Base   dflt:""  comment:""
    dmmeta.field  field:omcli.FNodedkr.p_node  arg:omcli.FNode  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FNodedkr.p_node  inscond:true  via:omcli.FDb.ind_node/x2rdb.Nodedkr.node

    dmmeta.ctypelen  ctype:omcli.FNodedkr  len:216  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FNodeuser  comment:""
    dmmeta.field  field:omcli.FDb.nodeuser  arg:omcli.FNodeuser  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.nodeuser  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_nodeuser  arg:omcli.FNodeuser  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_nodeuser  hashfld:x2rdb.Nodeuser.nodeuser  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_nodeuser  inscond:true  via:""

    dmmeta.field  field:omcli.FNodeuser.base  arg:x2rdb.Nodeuser  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FNodeuser  len:416  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmattr  comment:""
    dmmeta.field  field:omcli.FDb.ind_omattr  arg:omcli.FOmattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omattr  hashfld:omdb.Omattr.omattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omattr  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.omattr  arg:omcli.FOmattr  reftype:Lary  dflt:""  comment:""
      dmmeta.gstatic  field:omcli.FDb.omattr  comment:""

    dmmeta.field  field:omcli.FOmattr.base  arg:omdb.Omattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmattr  len:296  alignment:8  padbytes:10  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmdattr  comment:""
    dmmeta.field  field:omcli.FDb.omdattr  arg:omcli.FOmdattr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omdattr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omdattr  arg:omcli.FOmdattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omdattr  hashfld:omdb.Omdattr.omdattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omdattr  inscond:true  via:""

    dmmeta.field  field:omcli.FOmdattr.base  arg:omdb.Omdattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmdattr  len:288  alignment:8  padbytes:10  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmdriver  comment:""
    dmmeta.field  field:omcli.FDb.omdriver  arg:omcli.FOmdriver  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omdriver  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omdriver  arg:omcli.FOmdriver  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omdriver  hashfld:omdb.Omdriver.omdriver  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omdriver  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.c_omdriver  arg:omcli.FOmdriver  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_omdriver  unique:Y

    dmmeta.field  field:omcli.FOmdriver.base       arg:omdb.Omdriver   reftype:Base    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmdriver.c_omdattr  arg:omcli.FOmdattr  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmdriver.c_omdattr  unique:Y
      dmmeta.xref  field:omcli.FOmdriver.c_omdattr  inscond:true  via:omcli.FDb.ind_omdriver/omdb.Omdattr.omdriver

    dmmeta.ctypelen  ctype:omcli.FOmdriver  len:240  alignment:8  padbytes:11  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmdstanza  comment:""
    dmmeta.field  field:omcli.FDb.omdstanza  arg:omcli.FOmdstanza  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omdstanza  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omdstanza  arg:omcli.FOmdstanza  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omdstanza  hashfld:omdb.Omdstanza.omdstanza  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omdstanza  inscond:true  via:""

    dmmeta.field  field:omcli.FOmdstanza.base       arg:omdb.Omdstanza  reftype:Base    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmdstanza.c_omdattr  arg:omcli.FOmdattr  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmdstanza.c_omdattr  unique:Y

    dmmeta.ctypelen  ctype:omcli.FOmdstanza  len:232  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmenv  comment:""
    dmmeta.field  field:omcli.FDb.omenv  arg:omcli.FOmenv  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omenv  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omenv  arg:omcli.FOmenv  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omenv  hashfld:omdb.Omenv.omenv  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omenv  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.c_omenv  arg:omcli.FOmenv  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_omenv  unique:Y

    dmmeta.field  field:omcli.FOmenv.base       arg:omdb.Omenv    reftype:Base  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmenv.voters     arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmenv.bootstrap  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmenv.mSSL_user  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmenv.nodes      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmenv.hosts      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmenv  len:488  alignment:8  padbytes:8  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmenvattr  comment:""
    dmmeta.field  field:omcli.FDb.omenvattr  arg:omcli.FOmenvattr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omenvattr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omenvattr  arg:omcli.FOmenvattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omenvattr  hashfld:omdb.Omenvattr.omenvattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omenvattr  inscond:true  via:""

    dmmeta.field  field:omcli.FOmenvattr.base  arg:omdb.Omenvattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmenvattr  len:232  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmenvlpref  comment:""
    dmmeta.field  field:omcli.FDb.omenvlpref      arg:omcli.FOmenvlpref  reftype:Lary   dflt:""  comment:""
    dmmeta.field  field:omcli.FDb.ind_omenvlpref  arg:omcli.FOmenvlpref  reftype:Thash  dflt:""  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omenvlpref  inscond:true  via:""

    dmmeta.field  field:omcli.FOmenvlpref.omenvlpref  arg:algo.Smallstr250  reftype:Val  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omenvlpref  hashfld:omcli.FOmenvlpref.omenvlpref  unique:Y  comment:""

    dmmeta.ctypelen  ctype:omcli.FOmenvlpref  len:280  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmidx  comment:""
    dmmeta.field  field:omcli.FDb.omidx  arg:omcli.FOmidx  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omidx  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omidx  arg:omcli.FOmidx  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omidx  hashfld:omdb.Omidx.omidx  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omidx  inscond:true  via:""

    dmmeta.field  field:omcli.FOmidx.base     arg:omdb.Omidx    reftype:Base    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmidx.c_omenv  arg:omcli.FOmenv  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmidx.c_omenv  unique:Y
      dmmeta.xref  field:omcli.FOmidx.c_omenv  inscond:true  via:omcli.FDb.ind_omidx/omdb.Omenv.omidx

    dmmeta.ctypelen  ctype:omcli.FOmidx  len:232  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmlattr  comment:""
    dmmeta.field  field:omcli.FDb.omlattr  arg:omcli.FOmlattr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omlattr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omlattr  arg:omcli.FOmlattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omlattr  hashfld:omdb.Omlattr.omlattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omlattr  inscond:true  via:""

    dmmeta.field  field:omcli.FOmlattr.base  arg:omdb.Omlattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmlattr  len:288  alignment:8  padbytes:11  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmline  comment:""
    dmmeta.field  field:omcli.FDb.omline      arg:omcli.FOmline  reftype:Lary   dflt:""  comment:""
    dmmeta.field  field:omcli.FDb.ind_omline  arg:omcli.FOmline  reftype:Thash  dflt:""  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omline  inscond:true  via:""

    dmmeta.field  field:omcli.FOmline.omline  arg:algo.Smallstr20  reftype:Val  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omline  hashfld:omcli.FOmline.omline  unique:Y  comment:""

    dmmeta.ctypelen  ctype:omcli.FOmline  len:32  alignment:8  padbytes:2  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmload  comment:""
    dmmeta.field  field:omcli.FDb.omload  arg:omcli.FOmload  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omload  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omload  arg:omcli.FOmload  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omload  hashfld:omdb.Omload.omload  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omload  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.c_omload  arg:omcli.FOmload  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_omload  unique:Y

    dmmeta.field  field:omcli.FOmload.base       arg:omdb.Omload     reftype:Base    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmload.c_omlattr  arg:omcli.FOmlattr  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmload.c_omlattr  unique:Y
      dmmeta.xref  field:omcli.FOmload.c_omlattr  inscond:true  via:omcli.FDb.ind_omload/omdb.Omlattr.omload

    dmmeta.ctypelen  ctype:omcli.FOmload  len:440  alignment:8  padbytes:11  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmmetric  comment:""
    dmmeta.field  field:omcli.FDb.ommetric  arg:omcli.FOmmetric  reftype:Lary  dflt:""  comment:""
      dmmeta.gstatic  field:omcli.FDb.ommetric  comment:""

    dmmeta.field  field:omcli.FDb.c_ommetric  arg:omcli.FOmmetric  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_ommetric  unique:Y

    dmmeta.field  field:omcli.FDb.ind_ommetric  arg:omcli.FOmmetric  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_ommetric  hashfld:omdb.Ommetric.ommetric  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_ommetric  inscond:true  via:""

    dmmeta.field  field:omcli.FOmmetric.base      arg:omdb.Ommetric  reftype:Base  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmmetric.uval      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmmetric.parsenum  arg:u32           reftype:Val  dflt:""  comment:""
      dmmeta.fsort  field:omcli.FDb.c_ommetric      sorttype:QuickSort  sortfld:omcli.FOmmetric.parsenum  comment:""

    dmmeta.field  field:omcli.FOmmetric.sum    arg:double           reftype:Val   dflt:0   comment:""
    dmmeta.field  field:omcli.FOmmetric.n_sum  arg:u32              reftype:Val   dflt:0   comment:""
    dmmeta.field  field:omcli.FOmmetric.step   arg:omcli.FOmmetric  reftype:Hook  dflt:""  comment:""
      dmmeta.hook  field:omcli.FOmmetric.step   comment:""

    dmmeta.ctypelen  ctype:omcli.FOmmetric  len:272  alignment:8  padbytes:19  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmnode  comment:""
    dmmeta.field  field:omcli.FDb.omnode  arg:omcli.FOmnode  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omnode  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.c_omnode  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_omnode  unique:Y

    dmmeta.field  field:omcli.FDb.ind_omnode  arg:omcli.FOmnode  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omnode  hashfld:omdb.Omnode.omnode  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omnode  inscond:true  via:""

    dmmeta.field  field:omcli.FNode.c_omnode  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FNode.c_omnode  unique:Y
      dmmeta.xref  field:omcli.FNode.c_omnode  inscond:true  via:omcli.FDb.ind_node/omdb.Omnode.node

    dmmeta.field  field:omcli.FOmattr.step  arg:omcli.FOmnode  reftype:Hook  dflt:""  comment:""
      dmmeta.hook  field:omcli.FOmattr.step  comment:""

    dmmeta.field  field:omcli.FOmenv.c_omnode  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenv.c_omnode  unique:Y
      dmmeta.xref  field:omcli.FOmenv.c_omnode  inscond:true  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmenv.c_omnode_broker  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenv.c_omnode_broker  unique:Y
      dmmeta.xref  field:omcli.FOmenv.c_omnode_broker  inscond:"omtype_Get(row)==omdb_Omtype_omtype_kafka||omtype_Get(row)==omdb_Omtype_omtype_rdp||omtype_Get(row)==omdb_Omtype_omtype_x2"  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmenv.c_omnode_worker  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenv.c_omnode_worker  unique:Y
      dmmeta.xref  field:omcli.FOmenv.c_omnode_worker  inscond:"omtype_Get(row)==omdb_Omtype_omtype_kafkaw"  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmenv.c_omnode_gui  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenv.c_omnode_gui  unique:Y
      dmmeta.xref  field:omcli.FOmenv.c_omnode_gui  inscond:"p_omtype->nx==true"  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmenv.c_omnode_kcat  arg:omcli.FOmnode  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenv.c_omnode_kcat  unique:Y
      dmmeta.xref  field:omcli.FOmenv.c_omnode_kcat  inscond:"omtype_Get(row)==omdb_Omtype_omtype_kcat"  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmnode.base                  arg:omdb.Omnode   reftype:Base  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.uval                  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.omattr                arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.omattruval            arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.omattruval_yaml       arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.controller            arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.subnet                arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.broker                arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.bootstrap             arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.rdp_seed              arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.properties            arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.logname               arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.jmx_port              arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.jmx_host              arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.prometheus_port       arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.broker_plaintext      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.broker_internal_host  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.broker_internal_port  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.port_ssl              arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.worker_stats_port     arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.worker_host_port      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.worker_host           arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.host_plaintext        arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.host_ssl              arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.broker_ssl            arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.rdp_rpc_host          arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.rdp_rpc_port     arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.port_plaintext   arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.port_controller  arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.controller_ssl   arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.prometheus_conf  arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.nginx_ui_port    arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.port_http        arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_proc_id       arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_mc_ib         arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_mc_eth        arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.http             arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.host_http        arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.script           arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.fname            arg:algo.cstring  reftype:Val    dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.p_node           arg:omcli.FNode   reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FOmnode.p_node           inscond:true  via:omcli.FDb.ind_node/omdb.Omnode.node

    dmmeta.field  field:omcli.FOmnode.p_omenv  arg:omcli.FOmenv  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FOmnode.p_omenv  inscond:true  via:omcli.FDb.ind_omenv/omdb.Omnode.omenv

    dmmeta.field  field:omcli.FOmnode.exclude           arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_topo           arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_mc_eth_ip      arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.x2_mc_ib_ip       arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmnode.provectus_oauth2  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmnode  len:944  alignment:8  padbytes:20  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmnodeattr  comment:""
    dmmeta.field  field:omcli.FDb.omnodeattr  arg:omcli.FOmnodeattr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omnodeattr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omnodeattr  arg:omcli.FOmnodeattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omnodeattr  hashfld:omdb.Omnodeattr.omnodeattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omnodeattr  inscond:true  via:""

    dmmeta.field  field:omcli.FOmnodeattr.base  arg:omdb.Omnodeattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmnodeattr  len:176  alignment:8  padbytes:0  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmrun  comment:""
    dmmeta.field  field:omcli.FDb.omrun  arg:omcli.FOmrun  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omrun  extrn:N  update:N  strict:Y  comment:""
      dmmeta.foutput  field:omcli.FDb.omrun  comment:""

    dmmeta.field  field:omcli.FDb.c_omrun  arg:omcli.FOmrun  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_omrun  unique:Y
      dmmeta.fsort  field:omcli.FDb.c_omrun  sorttype:QuickSort  sortfld:omdb.Omrun.name  comment:""

    dmmeta.field  field:omcli.FDb.ind_omrun  arg:omcli.FOmrun  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omrun  hashfld:omdb.Omrun.omrun  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omrun  inscond:true  via:""

    dmmeta.field  field:omcli.FOmenvlpref.c_omrun  arg:omcli.FOmrun  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmenvlpref.c_omrun  unique:Y

    dmmeta.field  field:omcli.FOmrun.base     arg:omdb.Omrun    reftype:Base  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmrun.select   arg:bool          reftype:Val  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmrun.logname  arg:algo.cstring  reftype:Val  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmrun  len:328  alignment:8  padbytes:17  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmrunattr  comment:""
    dmmeta.field  field:omcli.FDb.omrunattr  arg:omcli.FOmrunattr  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.omrunattr  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDb.ind_omrunattr  arg:omcli.FOmrunattr  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omrunattr  hashfld:omdb.Omrunattr.omrunattr  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omrunattr  inscond:true  via:""

    dmmeta.field  field:omcli.FOmrun.c_omrunattr  arg:omcli.FOmrunattr  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmrun.c_omrunattr  unique:Y
      dmmeta.xref  field:omcli.FOmrun.c_omrunattr  inscond:true  via:omcli.FDb.ind_omrun/omdb.Omrunattr.omrun

    dmmeta.field  field:omcli.FOmrunattr.base  arg:omdb.Omrunattr  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FOmrunattr  len:88  alignment:8  padbytes:11  plaindata:N

  dmmeta.ctype  ctype:omcli.FOmtype  comment:""
    dmmeta.field  field:omcli.FDb.omtype  arg:omcli.FOmtype  reftype:Lary  dflt:""  comment:""
      dmmeta.gstatic  field:omcli.FDb.omtype  comment:""

    dmmeta.field  field:omcli.FDb.ind_omtype  arg:omcli.FOmtype  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_omtype  hashfld:omdb.Omtype.omtype  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_omtype  inscond:true  via:""

    dmmeta.field  field:omcli.FOmnode.p_omtype  arg:omcli.FOmtype  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FOmnode.p_omtype  inscond:true  via:omcli.FDb.ind_omtype/omdb.Omnode.omtype

    dmmeta.field  field:omcli.FOmtype.base  arg:omdb.Omtype    reftype:Base  dflt:""  comment:""
    dmmeta.field  field:omcli.FOmtype.step  arg:omcli.FOmnode  reftype:Hook  dflt:""  comment:""
      dmmeta.hook  field:omcli.FOmtype.step  comment:""

    dmmeta.field  field:omcli.FOmtype.c_omattr  arg:omcli.FOmattr  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FOmtype.c_omattr  unique:Y
      dmmeta.xref  field:omcli.FOmtype.c_omattr  inscond:true  via:omcli.FDb.ind_omtype/omdb.Omattr.omtype

    dmmeta.ctypelen  ctype:omcli.FOmtype  len:240  alignment:8  padbytes:3  plaindata:N

  dmmeta.ctype  ctype:omcli.FParsenum  comment:""
    dmmeta.field  field:omcli.FDb.parsenum      arg:omcli.FParsenum  reftype:Lary   dflt:""  comment:""
    dmmeta.field  field:omcli.FDb.ind_parsenum  arg:omcli.FParsenum  reftype:Thash  dflt:""  comment:""
      dmmeta.xref  field:omcli.FDb.ind_parsenum  inscond:true  via:""

    dmmeta.field  field:omcli.FParsenum.parsenum  arg:u32  reftype:Val  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_parsenum  hashfld:omcli.FParsenum.parsenum  unique:Y  comment:""

    dmmeta.field  field:omcli.FParsenum.p_ommetric  arg:omcli.FOmmetric  reftype:Ptr  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FParsenum  len:24  alignment:8  padbytes:4  plaindata:N

  dmmeta.ctype  ctype:omcli.FUid  comment:""
    dmmeta.field  field:omcli.FDb.ind_uid  arg:omcli.FUid  reftype:Thash  dflt:""  comment:""
      dmmeta.thash  field:omcli.FDb.ind_uid  hashfld:x2rdb.Uid.uid  unique:Y  comment:""
      dmmeta.xref  field:omcli.FDb.ind_uid  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.c_uid_sorted  arg:omcli.FUid  reftype:Ptrary  dflt:""  comment:""
      dmmeta.ptrary  field:omcli.FDb.c_uid_sorted  unique:Y
      dmmeta.fsort  field:omcli.FDb.c_uid_sorted  sorttype:QuickSort  sortfld:x2rdb.Uid.id  comment:""
      dmmeta.xref  field:omcli.FDb.c_uid_sorted  inscond:true  via:""

    dmmeta.field  field:omcli.FDb.uid  arg:omcli.FUid  reftype:Lary  dflt:""  comment:""
      dmmeta.finput  field:omcli.FDb.uid  extrn:N  update:N  strict:Y  comment:""

    dmmeta.field  field:omcli.FDctrport.p_uid  arg:omcli.FUid  reftype:Upptr  dflt:""  comment:""
      dmmeta.xref  field:omcli.FDctrport.p_uid  inscond:true  via:omcli.FDb.ind_uid/dkrdb.Dctrport.uid

    dmmeta.field  field:omcli.FUid.base  arg:x2rdb.Uid  reftype:Base  dflt:""  comment:""
    dmmeta.ctypelen  ctype:omcli.FUid  len:216  alignment:8  padbytes:3  plaindata:N

  dmmeta.main  ns:omcli  ismodule:N
  dmmeta.nscpp  ns:omcli  comment:""
  dmmeta.nsx  ns:omcli  genthrow:Y  correct_getorcreate:Y  pool:algo_lib.FDb.malloc  sortxref:Y  pack:N  comment:""
  dmmeta.tracerec  tracerec:omcli.trace  comment:""
  dmmeta.dispsig  dispsig:omcli.Input  signature:8c0f82014aacc226b2b858769f384e075f5cf04e
report.acr  n_select:405  n_insert:0  n_delete:0  n_ignore:0  n_update:0  n_file_mod:0
