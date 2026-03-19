#!/bin/bash
set -x
set -e





acr_ed -del    -field x2read.FDb.latest_fetch_time                 -write || true
acr_ed -create -field x2read.FDb.latest_fetch_time                -arg algo.UnTime             -write -comment "latest fetch time"

# acr_ed -del    -field x2read.FDb.x2read_mon                       -write || true
# acr_ed -create -field x2read.FDb.x2read_mon                       -arg bool             -write -comment "step field for monitor"
# acr -merge -write <<EOF
#     dmmeta.fstep   fstep:x2read.FDb.x2read_mon   steptype:InlineRecur  comment:""
#     dmmeta.fdelay  fstep:x2read.FDb.x2read_mon   delay:1.000000000  scale:N  comment:""
# EOF


acr_ed -del    -field x2read.FDb.th_idle                      -write || true
acr_ed -create -field x2read.FDb.th_idle                      -arg algo_lib.FTimehook             -write -comment "time hook for idle "


#  set parms for atf_snf
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.x2read.max_idle 
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.x2read.max_idle                    arg:double          reftype:Val      dflt:0.0       comment:"idle (no data received) timeout in sec.Exit when reached(0 - no timeout)"
EOF

# =================================

#  set parms for atf_rdk
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_comp.xrun
EOF

acr -merge -write <<EOF

    dmmeta.field  field:command.atf_comp.xrun                  arg:u8            reftype:Val  dflt:0                   comment:"run option"
        dmmeta.fconst  fconst:command.atf_comp.xrun/run        value:0           comment:""
        dmmeta.fconst  fconst:command.atf_comp.xrun/memcheck        value:1           comment:""
        dmmeta.fconst  fconst:command.atf_comp.xrun/coverage        value:2           comment:""
        dmmeta.fconst  fconst:command.atf_comp.xrun/callgrind        value:3           comment:""
        dmmeta.fconst  fconst:command.atf_comp.xrun/mdbg        value:4          comment:""
EOF
amc

#  -run, -memcheck, -coverage, -callgrind, -mdbg