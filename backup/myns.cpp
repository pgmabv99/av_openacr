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
// Target: myns (exe) -- create program and inherit from db
// Exceptions: yes
// Source: cpp/myns/myns.cpp
//

#include "include/algo.h"
#include "include/algo.h"
#include "include/myns.h"
#include <string>
#include <cstring>
#include <vector>

namespace myns
{
#define N_part 6
    typedef struct
    {
        algo::Smallstr50 part_key;
        int amt;
        myns::FPart *part_obj;
    } part_data_t;

    class mcb_t
    {
    public:
        // methods
        mcb_t();
        ~mcb_t();
        void scan();
        void test_delete();
        void test_update(algo::Smallstr50 part_key);
        void add_data_to_struct();
        void test_save();
        //       private:
    private:
        algo::Smallstr50 eyecatcher;
        std::vector<part_data_t> part_data;
    };
}

// constructor
myns::mcb_t::mcb_t()
{
    eyecatcher = "mcb_t";
    prlog("create instance " << eyecatcher);
    part_data.resize(N_part);

}

// destructor
myns::mcb_t::~mcb_t()
{
    prlog("destroy instance " << eyecatcher);
}

void myns::mcb_t::scan()
{
    prlog("==scan  ");
    ind_beg(myns::_db_zd_part_curs, part_obj, myns::_db)
    {
        prlog(Keyval("part", part_obj.part) << Keyval("amount", part_obj.amt)  << Keyval("f_amt", part_obj.f_amt));
    }
    ind_end;
}

void myns::mcb_t::test_update(algo::Smallstr50 part_key)
{
    myns::FPart *part_obj;
    prlog("==find and update  by key : " << part_key); 
    part_obj = myns::ind_part_Find(part_key);
    if (part_obj)
    {
        part_obj->amt *= -1;
        part_obj->f_amt = 99;
        prlog("part updated");
    }
    else
    {
        prlog("part not found");
    }
}

void  myns::mcb_t::test_delete()
{
    // delete by obj
    // algo::Smallstr50 part_key;
    // myns::FPart *part_obj;

    // auto ipart = 2;
    // part_obj = part_data[ipart].part_obj;
    // prlog("==delete by obj  : " << part_obj->part);
    // if (part_obj)
    // {
    //     part_Delete(*part_obj);
    //     prlog("part deleted");
    // }
    // else
    // {
    //     prlog("part not found");
    // }

    // part_key = "part4";
    // prlog("==find and delete  by key : " << part_key);
    // part_obj = myns::ind_part_Find(part_key);
    // if (part_obj)
    // {
    //     part_Delete(*part_obj);
    //     prlog("part deleted");
    // }
    // else
    // {
    //     prlog("part not found");
    // }


    return ;
}

void myns::mcb_t::add_data_to_struct()
{
    prlog("==generate data (exercize in char vs str vs Smallstr) ");

    for (int i = 0; i < N_part; i++)
    {
        cstring tmpcstr;
        tmpcstr << "part" << i;
        part_data[i].part_key = tmpcstr;
        part_data[i].amt = i * 10;
        part_data[i].part_obj = nullptr;
    }

    prlog("==load data into acr  ");
    for (int i = 0; i < N_part; i++)
    {
        myns::FPart *part_obj = &part_Alloc();
        // this has to be set before calling part_XrefMaybe
        part_obj->part = part_data[i].part_key;
        if (part_XrefMaybe(*part_obj))
        {
            part_obj->amt = part_data[i].amt;
            part_data[i].part_obj = part_obj;
            prlog("part inserted in memory with xref " << part_obj->part << " amt " << part_obj->amt);
        }
        else
        {

            // prlog("part not inserted in memory with xref " << part_obj->part << " amt " << part_obj->amt);
            // part_Delete(*part_obj);
        };
    };
}

void myns::mcb_t::test_save()
{
    // cstring text;
    // ind_beg(amc::_db_tracefld_curs, tracefld, amc::_db) {
    //     dmmeta::Tracefld out;
    //     tracefld_CopyOut(tracefld, out);
    //     dmmeta::Tracefld_Print(out, text);
    //     text << eol;
    // }ind_end;
    cstring text("");
//     ind_beg(myns::_db_zd_part_curs, temp, myns::_db) {
//         myns::part out;
//         myns::part_CopyOut(temp, out);
//         myns:part_Print(out, text);
//         text << eol;
//     }ind_end;
//    prlog(text);
//    mynsdb::SaveTuples();
}
// =================


void myns::Main()
{
    prlog("manual creation and deletion of part");

    myns::mcb_t *mcb = new myns::mcb_t();
 
    mcb->add_data_to_struct();
    mcb->scan();

    // mcb->test_delete();
    // mcb->scan();

    algo::Smallstr50 part_key;
    part_key = "part5";
    mcb->test_update(part_key);
    part_key = "part98";
    mcb->test_update(part_key);
    mcb->scan();

    myns::MainLoop();
    prlog("==done 31");
    delete mcb;
}
