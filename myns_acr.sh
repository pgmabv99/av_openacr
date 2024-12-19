#!/bin/bash
set -x
set -e

targ="myns"


# backup  the current driver code
source av_openacr/backup_tmp.sh

echo "===============create db"
acr_ed -del -target:${targ}     -write
acr_ed -del -target:${targ}db    -write

acr_ed -create -target:${targ}db  -nstype:ssimdb -write

acr_ed -create  -ssimfile:${targ}db.part -write
acr_ed -create -field ${targ}db.Part.amt -arg i32 -write -comment "amount of part"
echo "${targ}db.part part:part98 amt:10" | acr -replace -write
echo "${targ}db.part part:part99 amt:10" | acr -replace -write

# acr_ed -create  -ssimfile:${targ}db.order -write
# acr_ed -create -field ${targ}db.Order.p_part -arg ${targ}db.Part -reftype Upptr -write -comment "up pointer"
# echo "${targ}db.order order:order98_1 p_part:part98" | acr -replace -write
# echo "${targ}db.order order:order99_1 p_part:part99" | acr -replace -write
# echo "${targ}db.order order:order99_2 p_part:part99" | acr -replace -write

echo "==============create program and inherit from db"
acr_ed -create -target:$targ -write -comment "create program and inherit from db"
#

acr -merge -write <<EOF
dev.targsrc  targsrc:myns/cpp/myns/util.cpp  comment:""
dev.targsrc  targsrc:myns/cpp/myns/util.h    comment:""

dmmeta.ctype  ctype:myns.Client  comment:"client hook/socket"
  dmmeta.field  field:myns.Client.client    arg:algo.Smallstr50   reftype:Val  dflt:""  comment:""

  dmmeta.field  field:myns.FDb.cd_client_eof  arg:myns.Client  reftype:Llist  dflt:""  comment:"End reading from stdin"
    dmmeta.llist  field:myns.FDb.cd_client_eof  havetail:N  havecount:Y  comment:""
    dmmeta.fstep  fstep:myns.FDb.cd_client_eof  steptype:Inline  comment:""
    dmmeta.xref  field:myns.FDb.cd_client_eof  inscond:false  via:""
  dmmeta.field  field:myns.FDb.cd_client_read  arg:myns.Client  reftype:Llist  dflt:""  comment:"Read next message from file descriptor"
    dmmeta.llist  field:myns.FDb.cd_client_read  havetail:N  havecount:Y  comment:""
    dmmeta.fstep  fstep:myns.FDb.cd_client_read  steptype:Inline  comment:""
    dmmeta.xref  field:myns.FDb.cd_client_read  inscond:false  via:""


  dmmeta.field  field:myns.Client.iohook      arg:algo_lib.FIohook  reftype:Val  dflt:""  comment:""
  dmmeta.field  field:myns.Client.in        arg:char   reftype:Fbuf  dflt:"'\\n'"  comment:""
    dmmeta.fbuf  field:myns.Client.in  max:8192  fbuftype:Linebuf  insready:myns.FDb.cd_client_read  inseof:myns.FDb.cd_client_eof   comment:""
  
  # dmmeta.field  field:myns.Client.in        arg:myns.MsgHeader    reftype:Fbuf  dflt:"'\\n'"  comment:""
    # dmmeta.fbuf  field:myns.Client.in  max:8192  fbuftype:Msgbuf  insready:myns.FDb.cd_client_read  inseof:myns.FDb.cd_client_eof   comment:""
  
  dmmeta.field  field:myns.Client.lastbuff  arg:algo.Smallstr50   reftype:Val  dflt:""  comment:""

  dmmeta.dispatch  dispatch:myns.In  unk:N  read:Y  print:Y  haslen:N  call:Y  strict:N  comment:""
    dmmeta.dispatch_msg  dispatch_msg:myns.In/myns.NewOrderReqMsg    comment:""
    # dmmeta.dispatch_msg  dispatch_msg:myns.In/myns.TextMsg           comment:""

dmmeta.ctype  ctype:myns.FDb  comment:""

  dmmeta.field  field:myns.FDb.sched1  arg:bool  reftype:Val  dflt:true  comment:""
    dmmeta.fstep  fstep:myns.FDb.sched1  steptype:InlineRecur  comment:""
      dmmeta.fdelay  fstep:myns.FDb.sched1  delay:5  scale:N  comment:""

  dmmeta.field  field:myns.FDb.listen      arg:algo_lib.FIohook  reftype:Val    dflt:""  comment:""
  dmmeta.field  field:myns.FDb.client      arg:myns.Client  reftype:Tpool  dflt:""  comment:""
  dmmeta.field  field:myns.FDb.ind_client  arg:myns.Client  reftype:Thash  dflt:""  comment:""
    dmmeta.thash  field:myns.FDb.ind_client  hashfld:myns.Client.client  unique:Y  comment:""
    dmmeta.xref  field:myns.FDb.ind_client  inscond:true  via:""

  dmmeta.field  field:myns.FDb.terminal  arg:algo_lib.FIohook  reftype:Val  dflt:""  comment:""
  dmmeta.ctypelen  ctype:myns.FDb  len:520  alignment:8  padbytes:26  plaindata:N

dmmeta.ctype  ctype:myns.FPart  comment:"inherited from ssimfile"
  dmmeta.field  field:myns.FDb.part  arg:myns.FPart  reftype:Lary  dflt:""  comment:""
    dmmeta.finput  field:myns.FDb.part  extrn:N  update:N  strict:Y  comment:""

  dmmeta.field  field:myns.FDb.zd_part  arg:myns.FPart  reftype:Llist  dflt:""  comment:"zero terminated list"
    dmmeta.llist  field:myns.FDb.zd_part  havetail:Y  havecount:Y  comment:""
    dmmeta.xref  field:myns.FDb.zd_part  inscond:true  via:""

  dmmeta.field  field:myns.FDb.ind_part  arg:myns.FPart  reftype:Thash  dflt:""  comment:hash/index/iterator
    dmmeta.thash  field:myns.FDb.ind_part  hashfld:mynsdb.Part.part  unique:Y  comment:""
    dmmeta.xref  field:myns.FDb.ind_part  inscond:true  via:""

  dmmeta.field  field:myns.FPart.base   arg:mynsdb.Part  reftype:Base  dflt:""  comment:""
  dmmeta.field  field:myns.FPart.f_amt  arg:i32  reftype:Val  dflt:""  comment:"f_amount of part. not inherited"

dmmeta.ctype  ctype:myns.Order  comment:"not inherited"
  dmmeta.field  field:myns.FDb.order      arg:myns.Order  reftype:Tpool  dflt:""  comment:""
  dmmeta.field  field:myns.FDb.ind_order  arg:myns.Order  reftype:Thash  dflt:""  comment:""
    dmmeta.xref  field:myns.FDb.ind_order  inscond:true  via:""

  dmmeta.field  field:myns.FDb.zd_order  arg:myns.Order  reftype:Llist  dflt:""  comment:"List _db->order with fstep"
    dmmeta.cascdel  field:myns.FDb.zd_order  comment:""
    dmmeta.llist  field:myns.FDb.zd_order  havetail:Y  havecount:Y  comment:""
    dmmeta.fstep  fstep:myns.FDb.zd_order  steptype:InlineRecur  comment:""
      dmmeta.fdelay  fstep:myns.FDb.zd_order  delay:5  scale:Y  comment:""
    dmmeta.xref  field:myns.FDb.zd_order  inscond:true  via:""

  dmmeta.field  field:myns.FPart.zd_partorder  arg:myns.Order  reftype:Llist  dflt:""  comment:"List part->order"
    dmmeta.cascdel  field:myns.FPart.zd_partorder  comment:""
    dmmeta.llist  field:myns.FPart.zd_partorder  havetail:Y  havecount:Y  comment:""

  dmmeta.field  field:myns.Order.order    arg:algo.Smallstr50  reftype:Val  dflt:""  comment:""
    dmmeta.thash  field:myns.FDb.ind_order  hashfld:myns.Order.order  unique:Y  comment:""

  dmmeta.field  field:myns.Order.p_part        arg:myns.FPart  reftype:Upptr  dflt:""  comment:""
    dmmeta.xref  field:myns.FPart.zd_partorder  inscond:true  via:myns.Order.p_part/myns.Order.p_part

  dmmeta.field  field:myns.Order.quantity  arg:i32   reftype:Val  dflt:""  comment:""
  dmmeta.field  field:myns.Order.filled  arg:bool  reftype:Val  dflt:""  comment:"filled or not"

dmmeta.ctype  ctype:myns.MsgHeader  comment:""
  dmmeta.cpptype  ctype:myns.MsgHeader  ctor:Y  dtor:N  cheap_copy:N
  dmmeta.pack     ctype:myns.MsgHeader  comment:""

  dmmeta.field  field:myns.MsgHeader.type         arg:u8                   reftype:Val   dflt:""  comment:""
    dmmeta.typefld  field:myns.MsgHeader.type         comment:""
  dmmeta.field  field:myns.MsgHeader.length       arg:u8                   reftype:Val   dflt:""  comment:""
    dmmeta.lenfld  field:myns.MsgHeader.length  extra:0

  dmmeta.cfmt  cfmt:myns.MsgHeader.String  printfmt:Tuple  read:Y  print:Y  sep:""  genop:Y  comment:""

dmmeta.ctype  ctype:myns.NewOrderReqMsg  comment:"From user: new order request"
  dmmeta.cpptype  ctype:myns.NewOrderReqMsg  ctor:Y  dtor:N  cheap_copy:N
  dmmeta.msgtype  ctype:myns.NewOrderReqMsg  type:66
  dmmeta.pack     ctype:myns.NewOrderReqMsg  comment:""

  dmmeta.field  field:myns.NewOrderReqMsg.base   arg:myns.MsgHeader       reftype:Base  dflt:""  comment:""
  dmmeta.field  field:myns.NewOrderReqMsg.part_key   arg:algo.Smallstr50  reftype:Val  dflt:""  comment:">0 = buy, <0 = sell"
  dmmeta.field  field:myns.NewOrderReqMsg.amt        arg:i32              reftype:Val  dflt:""  comment:""
  
  dmmeta.cfmt  cfmt:myns.NewOrderReqMsg.String  printfmt:Tuple  read:Y  print:Y  sep:""  genop:Y  comment:""

EOF

acr_compl -install
amc

echo
echo " ==ctypes"
acr dmmeta.ctype:${targ}%.%
echo  " ==fields"
acr dmmeta.field:${targ}%.%
echo  " ==fdelay"
acr dmmeta.fdelay:${targ}%.%

restore_backup_tmp

# ai $targ
