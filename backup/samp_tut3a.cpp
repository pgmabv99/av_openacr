#include "include/algo.h"
#include "include/samp_tut3a.h"

static void DoRead() {
    char buf;
    int rc=0;
    do {
        rc=read(samp_tut3a::_db.read.fildes.value,&buf,1);
        if (rc==1) {
            tempstr out;
            char_PrintCppSingleQuote(buf,out);
            prlog(algo::CurrUnTime()<<" "<<out);
        } else if (rc==-1 && errno==EAGAIN) {
        } else {
            IohookRemove(samp_tut3a::_db.read);
        }
    } while (rc>0);
}

void samp_tut3a::Main() {
    _db.read.fildes=algo::Fildes(0);
    algo::SetBlockingMode(_db.read.fildes,false);
    callback_Set0(_db.read,DoRead);
    IOEvtFlags flags;
    read_Set(flags,true);
    IohookAdd(_db.read,flags);
    MainLoop();
}