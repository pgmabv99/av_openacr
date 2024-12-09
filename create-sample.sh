#!/bin/bash
set -x
set -e

targ="sample"
# backup  the current driver code
source av_openacr/backup_tmp.sh

acr_ed -del -target:${targ}     -write
# [ -L bin/$targ ] && rm bin/$targ && [ -e "$(readlink -f bin/$targ)" ] && rm "$(readlink -f bin/$targ)"
acr_ed -create -target:${targ} -write 

acr -merge -write <<EOF
    dmmeta.ctype  ctype:sample.FDb  comment:""
      dmmeta.field  field:sample.FDb.rec      arg:sample.FRec  reftype:Tpool  dflt:""  comment:""
      dmmeta.field  field:sample.FDb.ind_hashkey  arg:sample.FRec  reftype:Thash  dflt:""  comment:""
        dmmeta.thash  field:sample.FDb.ind_hashkey  hashfld:sample.FRec.hashkey  unique:Y  comment:""
        dmmeta.xref  field:sample.FDb.ind_hashkey  inscond:true  via:""

      dmmeta.field  field:sample.FDb.bh_rec  arg:sample.FRec  reftype:Bheap  dflt:""  comment:""
        dmmeta.sortfld  field:sample.FDb.bh_rec  sortfld:sample.FRec.rec
        dmmeta.fstep  fstep:sample.FDb.bh_rec  steptype:InlineRecur  comment:""
          dmmeta.fdelay  fstep:sample.FDb.bh_rec  delay:1.0  scale:N  comment:""
        dmmeta.xref  field:sample.FDb.bh_rec  inscond:true  via:""

    dmmeta.ctype  ctype:sample.FRec  comment:""
      dmmeta.field  field:sample.FRec.rec  arg:sample.Reckey  reftype:Val  dflt:""  comment:""
      dmmeta.field  field:sample.FRec.hashkey  arg:i32  reftype:Val  dflt:""  comment:""

    dmmeta.ctype  ctype:sample.Reckey  comment:""
      dmmeta.ccmp  ctype:sample.Reckey  extrn:N  genop:Y  order:Y  minmax:N  comment:""
      dmmeta.chash  ctype:sample.Reckey  hashtype:CRC32  comment:""
      dmmeta.cpptype  ctype:sample.Reckey  ctor:Y  dtor:Y  cheap_copy:N
      dmmeta.field  field:sample.Reckey.key1  arg:i32              reftype:Val  dflt:""  comment:""
      dmmeta.field  field:sample.Reckey.key2  arg:double           reftype:Val  dflt:""  comment:""
      dmmeta.field  field:sample.Reckey.key3  arg:algo.Smallstr20  reftype:Val  dflt:""  comment:""
      dmmeta.cfmt  cfmt:sample.Reckey.String  printfmt:Sep  read:Y  print:Y  sep://  genop:Y  comment:""
EOF

acr_compl -install
amc
 
acr dmmeta.ctype:sample.% -ndown 99  -tree

restore_backup_tmp
ai sample