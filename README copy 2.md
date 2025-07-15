## atf_snf - IBV Sniffer testing tool
<a href="#atf_snf"></a>
local exampes:

`sudo bin/atf_snf -dev:tap0 -with_wall_clock:N`
`sudo bin/atf_snf -dev:tap0 -with_wall_clock:Y`
`sudo bin/atf_snf -list`

remote action with atf_bm:

`atf_bm -node:nj1.sn4.bm -atf_snf:"-dev:tap2 -with_wall_clock" -shell`
`atf_bm -node:nj1.sn%.bm -atf_snf:"-list" -q`

### -kapi option
The option enables parsing of tcp packets, tracking tcp pairs (source ip/port, target ip/port) , detecting Kafka requests and responses  and matching them together. The final output is written out as a set of log files, one per tcp pair.
Addionaly all traffic is saved in a pcap file that can be later read parsed into tcp pairs log files using -in_file option).

All the log and pcap files are created under  the root "temp/at_snf_logs"  . The -dir: option specifies the subfolder under  "temp/at_snf_logs"

Live sniffer example:

`sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi:true   -dir:mytest3`

creates these   logs below. Note that tcp pair is concatenated with the kafka cliend_id for convinience. The timestamp is added to simlify tracking of multiple executions.

```
temp/atf_snf_logs/mytest3/2025.07.11.14.11/tcp_pairs/192.168.108.1:35082-192.168.108.5:1047_kafka-ui-admin-1752256401-1.log
```


Example of reading previosly recorded pcap file

```
atf_snf  -kapi:true -in_file:temp/atf_snf_logs/mytest3_live/2025.07.14.15.07/atf_snf.pcap -dir:test3
```
This will read the old pcap file and create a new timestamped folder under mytest3 with the new logs files

The timing of writing out tcp_pairs log files is controlled by -live_output option. When true  , the files are created every second.  When the option is false , the user has to either issue CTRL/C and x option of send

`sudo pkill -SIGUSR1 atf_sn`

hex_print adds hex line to the log.
mult_req_per_frame is an internal option

### Table Of Contents
<a href="#table-of-contents"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Toc -->
&nbsp;&nbsp;&bull;&nbsp;  [Syntax](#syntax)<br/>
&nbsp;&nbsp;&bull;&nbsp;  [-kapi option](#-kapi-option)<br/>
&nbsp;&nbsp;&bull;&nbsp;  [Options](#options)<br/>
&nbsp;&nbsp;&bull;&nbsp;  [Inputs](#inputs)<br/>
&#128196; [atf_snf - Internals](/txt/exe/atf_snf/internals.md)<br/>

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Toc -->

### Syntax
<a href="#syntax"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Syntax -->
```
atf_snf: IBV Sniffer testing tool
Usage: atf_snf [options]
    OPTION               TYPE    DFLT      COMMENT
    -in                  string  "data"    Input directory or filename, - for stdin
    -list                                  Show device list and exist
    -dev                 regx    "mlx5_6"  device to work on, like mlx5_2
    -port                int     1         port of the device to work on, like mlx5_2
    -with_wall_clock                       if set, HCA deliver wall clock
    -kapi                                  invoke tcp header and kafka parse code
    -in_file             string  ""        input PCAP file (full reference) . Empty for live NIC capture
    -dir                 string  ""        dir for in and out files
    -mult_req_per_frame          Y         parse mode: true - multiple req/rsp are expected per frame
    -hex_print                             print hex buffer
    -live_output                           live output on snf_mon step
    -verbose             int               Verbosity level (0..255); alias -v; cumulative
    -debug               int               Debug level (0..255); alias -d; cumulative
    -help                                  Print help and exit; alias -h
    -version                               Print version and exit
    -signature                             Show signatures and exit; alias -sig

```

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Syntax -->

## -kapi option
<a href="#-kapi-option"></a>
The option enables parsing of tcp packets, tracking tcp pairs (source ip/port, target ip/port) , detecting Kafka requests and responses  and matching them together. The final output is written out as a set of log files, one per tcp pair.
Addionaly all traffic is saved in a pcap file that can be later read parsed into tcp pairs log files using -in_file option).

All the log and pcap files are created under  the root "at_snf_logs"  folder in  the current directory. The -dir: option specifies the subfolder under  "at_snf_logs"

Live sniffer example:

`sudo ~/arnd/bin/atf_snf -dev:${dev} -kapi:true   -dir:mytest3`

creates these   logs below. Note that tcp pair is concatenated with the kafka cliend_id for convinience. The timestamp is added to simlify tracking of multiple executions.

```
atf_snf_logs/mytest3/2025.07.11.14.11/tcp_pairs/192.168.108.1:35082-192.168.108.5:1047_kafka-ui-admin-1752256401-1.log
```

Example of reading previosly recorded pcap file

```
atf_snf  -kapi:true -in_file:/home/avorovich/av_openacr/atf_snf_logs/mytest3/2025.07.11.14.11/atf_snf.pcap -dir:test3
```
This will read the old pcap file and create a new timestamped folder under mytest3 with the new logs files

The timing of writing out tcp_pairs log files is controlled by -live_output option. When true  , the files are created every second.  When the option is false , the user has to either issue CTRL/C and x option of send

`sudo pkill -SIGUSR1 atf_sn`

hex_print adds hex line to the log.
mult_req_per_frame is an internal option

### Options
<a href="#options"></a>

<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Options -->
#### -in -- Input directory or filename, - for stdin
<a href="#-in"></a>

#### -list -- Show device list and exist
<a href="#-list"></a>

#### -dev -- device to work on, like mlx5_2
<a href="#-dev"></a>

#### -port -- port of the device to work on, like mlx5_2
<a href="#-port"></a>

#### -with_wall_clock -- if set, HCA deliver wall clock
<a href="#-with_wall_clock"></a>

#### -kapi -- invoke tcp header and kafka parse code
<a href="#-kapi"></a>

#### -in_file -- input PCAP file (full reference) . Empty for live NIC capture
<a href="#-in_file"></a>

#### -dir -- dir for in and out files
<a href="#-dir"></a>

#### -mult_req_per_frame -- parse mode: true - multiple req/rsp are expected per frame
<a href="#-mult_req_per_frame"></a>

#### -hex_print -- print hex buffer
<a href="#-hex_print"></a>

#### -live_output -- live output on snf_mon step
<a href="#-live_output"></a>

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Options -->

### Inputs
<a href="#inputs"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Inputs -->
`atf_snf` takes the following tables on input:
|Ssimfile|Comment|
|---|---|
|[dmmeta.dispsigcheck](/txt/ssimdb/dmmeta/dispsigcheck.md)|Check signature of input data against executable's version|
|[kapidb.kapi](/txt/ssimdb/kapidb/kapi.md)||
|[dkrdb.dctrport](/txt/ssimdb/dkrdb/dctrport.md)|definitions for all run.port substitutions|
|[omdb.omnode](/txt/ssimdb/omdb/omnode.md)|Apache Cluster nodes in Env|

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Inputs -->

