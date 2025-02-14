
#!/bin/bash
cd $HOME/arnd
ai
abt -cfg:debug %
echo "patching x2bm_pcap"
g++ \
build/release/cpp.gen.x2bm_pcap_gen.o \
build/release/cpp.x2bm_pcap.x2bm_pcap.o \
-o build/release/x2bm_pcap.tmp \
-pthread \
-Wl,--gc-sections \
-pthread \
build/release/algo_lib-x86_64.a \
build/release/lib_json-x86_64.a \
build/release/lib_json-x86_64.a \
build/release/algo_lib-x86_64.a \
build/release/lib_prot-x86_64.a \
build/release/lib_prot-x86_64.a \
-ldl \
-lm \
-lstdc++ \
-lpcap \
build/release/algo_lib-x86_64.a

# ./build/release/x2bm_pcap.tmp