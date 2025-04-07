#!/bin/bash
set -x
set -e

trg=atf_snf


acr_ed -del  -ctype $trg.FIntfname  -write || true
acr_ed -del  -ctype $trg.FSnf      -write || true
acr_ed -del  -ctype $trg.FMemqp     -write || true
acr_ed -del  -ctype $trg.WcOpcode    -write || true
# acr_ed -del  -ctype $trg.FIntfname  -write 
#--------------FMemqp  
acr_ed -create -ctype $trg.FMemqp                      -pooltype Lary         -write -comment ""
acr_ed -create -field $trg.FMemqp.p_buf               -arg u8                -reftype Tary       -write -comment ""
acr_ed -create -field $trg.FMemqp.p_mr                -arg ibv_mr            -reftype Ptr        -write -comment ""
acr_ed -create -field $trg.FMemqp.p_sge               -arg ibv_sge           -reftype Tary       -write -comment ""
acr_ed -create -field $trg.FMemqp.p_recv_wr           -arg ibv_recv_wr       -reftype Tary       -write -comment ""

#--------------interface 
acr_ed -create -ctype $trg.FIntfname                   -pooltype Lary       -arg Smallstr50    -indexed    -write -comment ""

acr_ed -create -field $trg.FIntfname.pci               -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.ib                -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.port_cnt          -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.raw               -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.ts                -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.node              -arg algo.cstring    -write -comment ""
acr_ed -create -field $trg.FIntfname.clock_kHz         -arg u64             -write -comment ""
acr_ed -create -field $trg.FIntfname.p_dev             -arg ibv_device      -reftype Ptr       -write -comment ""

# ------------snf main block
acr_ed -create -ctype $trg.FSnf                        -pooltype Lary         -write -comment ""

acr_ed -create -field $trg.FSnf.ts_mult               -arg u32             -write -comment ""
acr_ed -create -field $trg.FSnf.ts_div                -arg u32             -write -comment ""
acr_ed -create -field $trg.FSnf.p_context             -arg ibv_context     -reftype Ptr           -write -comment ""
acr_ed -create -field $trg.FSnf.p_intfname            -arg atf_snf.FIntfname -reftype Ptr         -write -comment ""
acr_ed -create -field $trg.FSnf.port                  -arg u8              -write -comment ""
acr_ed -create -field $trg.FSnf.p_pd                  -arg ibv_pd          -reftype Ptr           -write -comment ""
acr_ed -create -field $trg.FSnf.p_flow                -arg ibv_flow        -reftype Ptr           -write -comment ""
acr_ed -create -field $trg.FSnf.c_memqp               -arg atf_snf.FMemqp  -reftype Ptrary        -write -comment ""
acr_ed -create -field $trg.FSnf.p_cq_ex               -arg ibv_cq_ex       -reftype Ptr           -write -comment ""
acr_ed -create -field $trg.FSnf.p_qp                  -arg ibv_qp          -reftype Ptr           -write -comment ""
acr_ed -create -field $trg.FSnf.memqp_id              -arg u64             -write -comment ""

#  ctype for enum ?
acr -merge -write <<EOF
  dmmeta.ctype  ctype:$trg.WcOpcode  comment:""
    dmmeta.cpptype  ctype:$trg.WcOpcode  ctor:Y  dtor:N  cheap_copy:Y
    dmmeta.pack  ctype:$trg.WcOpcode  comment:""
    dmmeta.field  field:$trg.WcOpcode.value  arg:u8  reftype:Val  dflt:""  comment:""
      dmmeta.anonfld  field:$trg.WcOpcode.value  comment:""
      dmmeta.fcast  field:$trg.WcOpcode.value  expr:""  comment:""
      dmmeta.fconst  fconst:$trg.WcOpcode.value/IBV_WC_SEND        value:0    comment:""
      dmmeta.fconst  fconst:$trg.WcOpcode.value/IBV_WC_RDMA_WRITE  value:1    comment:""
      dmmeta.fconst  fconst:$trg.WcOpcode.value/IBV_WC_RDMA_READ   value:2    comment:""
      dmmeta.fconst  fconst:$trg.WcOpcode.value/IBV_WC_RECV        value:128  comment:""
EOF

# amc
# amc_vis $trg.%   > ~/av_openacr/${trg}_viz.txt

# # ai 

# echo "done!!!!!!!!!!!!"