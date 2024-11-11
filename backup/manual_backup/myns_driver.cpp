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
// Target: myns (exe)
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
#define N_ORDERS 6
    typedef struct
    {
        algo::Smallstr50 order_key;
        int amt;
        myns::FOrders *order_obj;
    } order_data_t;

    class mcb_t
    {
    public:
        // methods
        mcb_t();
        ~mcb_t();
        void scan();
        void test_delete_update();
        void load_data();
        //       private:
    private:
        algo::Smallstr50 eyecatcher;
        std::vector<order_data_t> order_data;
    };
}

// constructor
myns::mcb_t::mcb_t()
{
    eyecatcher = "mcb_t";
    prlog("create instance " << eyecatcher);
    order_data.resize(N_ORDERS);

}

// destructor
myns::mcb_t::~mcb_t()
{
    prlog("destroy instance " << eyecatcher);
}

void myns::mcb_t::scan()
{
    prlog("==scan  ");
    ind_beg(myns::_db_zd_orders_curs, order_obj, myns::_db)
    {
        prlog(Keyval("order", order_obj.orders) << Keyval("amount", order_obj.amt));
    }
    ind_end;
}

void  myns::mcb_t::test_delete_update()
{
    // delete by obj
    algo::Smallstr50 order_key;
    myns::FOrders *order_obj;

    auto iorder = 2;
    order_obj = order_data[iorder].order_obj;
    prlog("==delete by obj  : " << order_obj->orders);
    if (order_obj)
    {
        orders_Delete(*order_obj);
        prlog("order deleted");
    }
    else
    {
        prlog("order not found");
    }

    order_key = "order4";
    prlog("==find and delete  by key : " << order_key);
    order_obj = myns::ind_orders_Find(order_key);
    if (order_obj)
    {
        orders_Delete(*order_obj);
        prlog("order deleted");
    }
    else
    {
        prlog("order not found");
    }

    order_key = "order5"; // hash not found. ind=7
    prlog("==find and update  by key : " << order_key);
    order_obj = myns::ind_orders_Find(order_key);
    if (order_obj)
    {
        order_obj->amt += 1000;
        prlog("order updated");
    }
    else
    {
        prlog("order not found");
    }

    return ;
}

void myns::mcb_t::load_data()
{
    prlog("==generate data (exercize in char vs str vs Smallstr) ");

    for (int i = 0; i < N_ORDERS; i++)
    {
        cstring tmpcstr;
        tmpcstr << "order" << i;
        order_data[i].order_key = tmpcstr;
        order_data[i].amt = i * 10;
        order_data[i].order_obj = nullptr;
    }

    prlog("==load data into acr  ");
    for (int i = 0; i < N_ORDERS; i++)
    {
        myns::FOrders *order_obj = &orders_Alloc();
        // this has to be set before calling orders_XrefMaybe
        order_obj->orders = order_data[i].order_key;
        if (orders_XrefMaybe(*order_obj))
        {
            order_obj->amt = order_data[i].amt;
            order_data[i].order_obj = order_obj;
            prlog("order inserted in memory with xref " << order_obj->orders << " amt " << order_obj->amt);
        }
        else
        {

            // prlog("order not inserted in memory with xref " << order_obj->orders << " amt " << order_obj->amt);
            // orders_Delete(*order_obj);
        };
    };
}

// myns::mcb_t::void test_save()
// {
//     // cstring text;
//     // ind_beg(amc::_db_tracefld_curs, tracefld, amc::_db) {
//     //     dmmeta::Tracefld out;
//     //     tracefld_CopyOut(tracefld, out);
//     //     dmmeta::Tracefld_Print(out, text);
//     //     text << eol;
//     // }ind_end;
//     cstring text("");
//     ind_beg(myns::_db_zd_orders_curs, temp, myns::_db) {
//         myns::Orders out;
//         myns::orders_CopyOut(temp, out);
//         myns:orders_Print(out, text);
//         text << eol;
//     }ind_end;
//    prlog(text);
//    myns::SaveTuples();
// }
// =================


void myns::Main()
{
    prlog("manual creation and deletion of orders");

    myns::mcb_t *mcb = new myns::mcb_t();
 
    mcb->load_data();
    mcb->scan();

    mcb->test_delete_update();
    mcb->scan();

    myns::MainLoop();
    prlog("==done 29");
    delete mcb;
}
