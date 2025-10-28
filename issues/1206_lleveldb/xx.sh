#!/bin/sh
acr_ed -create -target:atf_leveldb  -write
acr_ed -create -target:lib_leveldb -nstype:lib -write

rm -rf ~/arnd/extern/leveldb
mkdir -p ~/arnd/extern/leveldb
cp -r ~/leveldb/db/* ~/arnd/extern/leveldb/
cp -r ~/leveldb/helpers/memenv/* ~/arnd/extern/leveldb/
cp -r ~/leveldb/include/leveldb/* ~/arnd/extern/leveldb/
cp -r ~/leveldb/port/* ~/arnd/extern/leveldb/
cp -r ~/leveldb/table/* ~/arnd/extern/leveldb/
cp -r ~/leveldb/util/* ~/arnd/extern/leveldb/

#remove files that need gtest from google
rm env_posix_test.cc
rm extern/leveldb/env_test.cc
rm extern/leveldb/env_windows_test.cc
rm extern/leveldb/fault_injection_test.cc
rm extern/leveldb/filename_test.cc
rm extern/leveldb/filter_block_test.cc
rm extern/leveldb/hash_test.cc
rm extern/leveldb/log_test.cc
rm extern/leveldb/logging_test.cc
rm extern/leveldb/memenv_test.cc
rm extern/leveldb/no_destructor_test.cc
rm extern/leveldb/recovery_test.cc
rm extern/leveldb/skiplist_test.cc
rm extern/leveldb/status_test.cc
rm extern/leveldb/table_test.cc
rm extern/leveldb/version_edit_test.cc
rm extern/leveldb/version_set_test.cc
rm extern/leveldb/write_batch_test.cc
rm extern/leveldb/testutil.h
rm extern/leveldb/arena_test.cc
rm extern/leveldb/autocompact_test.cc
rm extern/leveldb/bloom_test.cc
rm extern/leveldb/cache_test.cc
rm extern/leveldb/coding_test.cc
rm extern/leveldb/corruption_test.cc
rm extern/leveldb/crc32c_test.cc
rm extern/leveldb/db_test.cc
rm extern/leveldb/dbformat_test.cc
rm extern/leveldb/env_posix_test.cc
rm extern/leveldb/testutil.cc

# copy c_test.c to c_test.cc and fix malloc and replace main

# flatten include file reference
find . -type f -exec sed -i -E 's|(#include\s+")([^"]*/)|\1|g' {} \;



# LIB : list 
cc_files=(
    #  copied from cmake library list
    builder.cc
    c.cc
    db_impl.cc
    db_iter.cc
    dbformat.cc
    dumpfile.cc
    filename.cc
    log_reader.cc
    log_writer.cc
    memtable.cc
    repair.cc
    table_cache.cc
    version_edit.cc
    version_set.cc
    write_batch.cc
    block_builder.cc
    block.cc
    filter_block.cc
    format.cc
    iterator.cc
    merger.cc
    table_builder.cc
    table.cc
    two_level_iterator.cc
    arena.cc
    bloom.cc
    cache.cc
    coding.cc
    comparator.cc
    crc32c.cc
    env.cc
    filter_policy.cc
    hash.cc
    logging.cc
    options.cc
    status.cc
    # POSIX environment
    env_posix.cc
)

# add files to acr
for file in "${cc_files[@]}"; do
    echo "dev.gitfile gitfile:extern/leveldb/$file"
    echo "dev.targsrc  targsrc:lib_leveldb/extern/leveldb/$file comment=\"\"" 
done | acr -merge -write




# EXE : hard code experimental target files (not rename .c to .cc)
cc_files=(
    c_test.cc    
)

# add files to acr
for file in "${cc_files[@]}"; do
    echo "dev.gitfile gitfile:extern/leveldb/$file"
    echo "dev.targsrc  targsrc:atf_leveldb/extern/leveldb/$file comment=\"\"" 
done | acr -merge -write



#not needed.  duplicate defs for missing declarations with use in multiple files

 bin/abt -target:% -cfg:release
 abt   -cfg:release % -install


 #old

 
find "extern/leveldb" -type f -name "*.h" | while read -r file; do
    echo "dev.gitfile gitfile:$file"
    echo "dev.targsrc  targsrc:lib_leveldb/$file" comment:""
    echo "dmmeta.nsinclude  nsinclude:lib_leveldb/$file"  sys:Y  comment:"" 
done | acr -merge -write


# cc files -from folder scan
find "extern/leveldb" -type f -name "*.cc" | while read -r file; do
    echo "dev.gitfile gitfile:$file"
    echo "dev.targsrc  targsrc:lib_leveldb/$file comment=\"\"" 
done | acr -merge -write

# not needed. make static for missing declarations  with use in the same file 
AddBoundaryInputs()
FindLargestKey()
FindSmallestBoundaryFile


dev.tool_opt  tool_opt:"%-%.%-%/lib_sqlite-CC:-DSQLITE_MAX_ATTACHED=30"  comment:""
dev.tool_opt  tool_opt:%-%.%-%/lib_sqlite-CC:-Iextern/sqlite-3500400  comment:""
dev.tool_opt  tool_opt:"%-%.%-%/lib_sqlite-CC:-DSQLITE_DQS=0"  comment:""
dev.tool_opt  tool_opt:"%-%.%-%/lib_sqlite-CC:-DSQLITE_THREADSAFE=0"  comment:""
dev.tool_opt  tool_opt:%-%.%-%/lib_sqlite-CC:-Wno-implicit-fallthrough  comment:""
dev.tool_opt  tool_opt:"%-%.%-%/%_leveldb-CC:-DLEVELDB_PLATFORM_POSIX=1"  comment:""
dev.tool_opt  tool_opt:%-%.%-%/%_leveldb-CC:-Wno-unused-parameter  comment:""
dev.tool_opt  tool_opt:%-%.%-%/%_leveldb-CC:-Wno-missing-declarations  comment:""
dev.tool_opt  tool_opt:"%-%.%-%/%_leveldb-CC:-Wno-error=implicit-fallthrough -Wno-implicit-fallthrough"  comment:""
dev.tool_opt  tool_opt:"%-%.%-%/%_leveldb-CC:-Wno-shadow -Wno-error=shadow"  comment:""
dev.tool_opt  tool_opt:"%-cl.%-x86_64/%-CC:/D AOS_SSE42"  comment:""
dev.tool_opt  tool_opt:"%-clang++.%-%/%-C:-x c"  comment:""
dev.tool_opt  tool_opt:"%-clang++.%-%/%-CPP:-x c++"  comment:""