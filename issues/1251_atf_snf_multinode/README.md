## atf_lat - utility to collect and process sniffer latency prints
<a href="#atf_lat"></a>

Details:
atf_lat collects statistics for several remotes sniffers and combines them  into  a single dashboard.
The Dashbord is updated on time steps  and can be watched for trends using
```
 watch -n .5 cat temp/atf_lat/dashboard.log
```
The example  of metrics are counts of acked kafka requests per tcp_connection and current consume offset vs high watermark offset (lag)  per topic/partition.
The remote sniffers collect statistics on each time step and  append the info to several om*.ssim files
The atf_lat fetches the om*.ssim files and displays  the info from current/previous  step into the dashboard.

Note1:
The default option is for atf_lat to syncronize on its own step count.  For example if the current atf_lat lat step is 10 it will filter remote om*.ssim for the remote step 10 and ignore others. Next step it will do the same for the remote step 11.
The practical implication is that if the remote session already ended , one can replay it multiple times and see the trends.

Note2.
If the current remote sniffer session is running and the user started  atf_snf N seconds later, he will see the delayed view from N seconds ago for the duration of the run.

Is that a practical limitation ? Maybe not since we   can invoke atf_lat from omcli after starting the test.


Todo:
```
--save/read om*.ssim files locally in a local folder
--expand the set of collected metrics
--UI improvements
--other ideas ???
```

Sample dashboard
```
=================== local step count 148
=================
CLIENT_ID_KEY                KAFKA_COUNT_RATE  KAFKA_COUNT  SNAPSHOT_ID  TCP_PAIR                                TIME
redpanda-console             0                 2            121          192.168.104.1:34934-192.168.104.2:1643  2025-11-20T13:00:44.370525202
redpanda-console             0                 2            121          192.168.104.1:34942-192.168.104.2:1643  2025-11-20T13:00:44.370525202
redpanda-console             0                 5            121          192.168.104.1:34958-192.168.104.2:1643  2025-11-20T13:00:44.370525202
redpanda-console             0                 6            121          192.168.104.1:34968-192.168.104.2:1643  2025-11-20T13:00:44.370525202
adminclient-1                0                 2            121          192.168.104.6:48832-192.168.104.2:1643  2025-11-20T13:00:44.370525202
adminclient-1                0                 2            121          192.168.104.7:51482-192.168.104.2:1643  2025-11-20T13:00:44.370525202
adminclient-1                0                 2            121          192.168.104.6:48834-192.168.104.2:1643  2025-11-20T13:00:44.370525202
consumer-sub-000-zC9MFNA-1   0                 3            121          192.168.104.7:49142-192.168.104.2:1643  2025-11-20T13:00:44.370525202
producer-1                   0                 3            121          192.168.104.6:48838-192.168.104.2:1643  2025-11-20T13:00:44.370525202
producer-1                   0                 3393         121          192.168.104.6:48848-192.168.104.2:1643  2025-11-20T13:00:44.370525202
consumer-sub-000-zC9MFNA-1   0                 3377         121          192.168.104.7:49156-192.168.104.2:1643  2025-11-20T13:00:44.370525202
consumer-sub-000-zC9MFNA-1   0                 2            121          192.168.104.7:49170-192.168.104.2:1643  2025-11-20T13:00:44.370525202
consumer-sub-000-zC9MFNA-1   0                 3374         121          192.168.104.7:49178-192.168.104.2:1643  2025-11-20T13:00:44.370525202
kafka-ui-admin-1763661516-1  0                 2            121          192.168.104.1:47278-192.168.104.2:1643  2025-11-20T13:00:44.370525202
kafka-ui-admin-1763661516-1  0                 10           121          192.168.104.1:47292-192.168.104.2:1643  2025-11-20T13:00:44.370525202

=================
TOPIC/PARTITION               OFFSET_FETCH_LST  HIGH_WATERMARK  LAG  SNAPSHOT_ID  HOST
test-topic-0000000-RB4kuas/0  62200             62201           1    121          nj1.sv2
test-topic-0000000-RB4kuas/1  66892             66893           1    121          nj1.sv2
test-topic-0000000-RB4kuas/2  68654             68655           1    121          nj1.sv2
test-topic-0000000-RB4kuas/3  65889             65890           1    121          nj1.sv2
test-topic-0000000-RB4kuas/4  74330             74331           1    121          nj1.sv2
test-topic-0000000-RB4kuas/5  66740             66741           1    121          nj1.sv2
test-topic-0000000-RB4kuas/6  67230             67231           1    121          nj1.sv2
test-topic-0000000-RB4kuas/7  66654             66655           1    121          nj1.sv2
test-topic-0000000-RB4kuas/8  69170             69171           1    121          nj1.sv2
test-topic-0000000-RB4kuas/9  65028             65029           1    121          nj1.sv2
```


### Table Of Contents
<a href="#table-of-contents"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Toc -->
&nbsp;&nbsp;&bull;&nbsp;  [Syntax](#syntax)<br/>
&nbsp;&nbsp;&bull;&nbsp;  [Options](#options)<br/>
&nbsp;&nbsp;&bull;&nbsp;  [Inputs](#inputs)<br/>
&#128196; [atf_lat - Internals](/txt/exe/atf_lat/internals.md)<br/>

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Toc -->

### Syntax
<a href="#syntax"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Syntax -->
```
atf_lat: utility to collect and process sniffer latency prints
Usage: atf_lat -omenv:<string> [options]
    OPTION      TYPE    DFLT    COMMENT
    -in         string  "data"  Input directory or filename, - for stdin
    -omenv      string          omcli env with the sniffers
    -omplat     string  ""      Overwrites default omenv platform
    -out_file   string  ""      ssim file to save locally
    -verbose    int             Verbosity level (0..255); alias -v; cumulative
    -debug      int             Debug level (0..255); alias -d; cumulative
    -help                       Print help and exit; alias -h
    -version                    Print version and exit
    -signature                  Show signatures and exit; alias -sig

```

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Syntax -->

### Options
<a href="#options"></a>

<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Options -->
#### -in -- Input directory or filename, - for stdin
<a href="#-in"></a>

#### -omenv -- omcli env with the sniffers
<a href="#-omenv"></a>

#### -omplat -- Overwrites default omenv platform
<a href="#-omplat"></a>

#### -out_file -- ssim file to save locally
<a href="#-out_file"></a>

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Options -->

### Inputs
<a href="#inputs"></a>
<!-- dev.mdmark  mdmark:MDSECTION  state:BEG_AUTO  param:Inputs -->
`atf_lat` takes the following tables on input:
|Ssimfile|Comment|
|---|---|
|[dmmeta.dispsigcheck](/txt/ssimdb/dmmeta/dispsigcheck.md)|Check signature of input data against executable's version|
|[omdb.omenv](/txt/ssimdb/omdb/omenv.md)|Apache Cluster Env|
|[omdb.omnode](/txt/ssimdb/omdb/omnode.md)|Apache Cluster nodes in Env|

<!-- dev.mdmark  mdmark:MDSECTION  state:END_AUTO  param:Inputs -->

