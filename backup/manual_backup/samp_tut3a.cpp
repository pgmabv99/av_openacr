//
// License: GPL
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
// Target: samp_tut3a (exe)
// Exceptions: yes
// Source: cpp/samp_tut3a/samp_tut3a.cpp
//

#include "include/algo.h"
#include "include/samp_tut3a.h"

typedef struct {
    cstring name;
} mycontext_t;



static void DoRead() {
    char buf;
    int rc=0;
    mycontext_t &context=*(mycontext_t*)samp_tut3a::_db.read.callback_ctx;
    // mycontext_t &context=(mycontext_t&)samp_tut3a::_db.read.callback_ctx;
    prlog("get to context and name : "<<context.name);
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
    // mycontext_t* p_context =(mycontext_t*) calloc(1,sizeof(mycontext_t));

    mycontext_t context;
    context.name="mycontext";
    _db.read.fildes=algo::Fildes(0);
    algo::SetBlockingMode(_db.read.fildes,false);
    callback_Set0(_db.read,DoRead);
    _db.read.callback_ctx=(u64)&context;

    IOEvtFlags flags;
    read_Set(flags,true);
    IohookAdd(_db.read,flags);
    MainLoop();
}
