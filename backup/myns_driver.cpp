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

namespace myns
{

    typedef struct
    {
        // std::string name;
        algo::Smallstr50 name;
        // const char *name;
        int amt;
        myns::Orders *order_obj;
    } order_data_t;
    typedef struct
    {
        order_data_t *order_data;
    } mcb_t;
    void scan(mcb_t *mcb);
    void load_data(mcb_t *mcb);
    i32 delete_test_by_obj(mcb_t *mcb);
    i32 test_delete_update(mcb_t *mcb);
    void test_save();
    void test_scan_update();
}

void myns::scan(myns::mcb_t *mcb)
{
    (void)mcb;
    prlog("==scan  ");
    ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    {
        prlog(Keyval("order", order.orders) << Keyval("amount", order.amt));
    }
    ind_end;
}


i32 myns::test_delete_update(myns::mcb_t *mcb)
{
    // delete by obj
    algo::Smallstr50 order_key;
    myns::Orders *order_obj;

    auto iorder = 2;
    order_obj= mcb->order_data[iorder].order_obj;
    // prlog("==delete by obj  : " << order_obj->orders);
    // if (order_obj)
    // {
    //     orders_Delete(*order_obj);
    //     prlog("order deleted");
    // }
    // else
    // {
    //     prlog("order not found");
    // }
    
    order_key = "order1";    //hash found. 
    // order_key = "order4"; //hash not found. ind=7
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

    // order_key = "order4";
    // prlog("==find and delete  by key : " << order_key);
    // order_obj = myns::ind_orders_Find(order_key);
    // if (order_obj)
    // {
    //     orders_Delete(*order_obj);
    //     prlog("order deleted");
    // }
    // else
    // {
    //     prlog("order not found");
    // }

    return 0;
}

void myns::test_scan_update()
{
    // prlog("==scan list and update ");
    // ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    // {
    //     prlog(Keyval("order", order.orders) << Keyval("amount", order.amt));
    //     ;
    //     if (order.amt < 2)
    //     {
    //         prlog("adding 1000 to  " << Keyval("Order", order.orders));
    //         order.amt += 1000;
    //     }
    // }
    // ind_end;
}

void myns::load_data(myns::mcb_t *mcb)
{
    prlog("==generate data (exercize in char vs str vs Smallstr) ");
#define N_ORDERS 5
    mcb->order_data = (myns::order_data_t *)calloc(N_ORDERS, sizeof(myns::order_data_t));
    for (int i = 0; i < N_ORDERS; i++)
    {
        cstring tmpcstr;
        tmpcstr << "order" << i;
        mcb->order_data[i].name = tmpcstr;
        mcb->order_data[i].amt = i * 10;

        mcb->order_data[i].order_obj = nullptr;
    }

    prlog("==load data into acr  ");
    for (long unsigned int i = 0; i < N_ORDERS; i++)
    {
        myns::Orders *order_obj = &orders_Alloc();
        if (orders_XrefMaybe(*order_obj))
        {
            order_obj->orders = mcb->order_data[i].name;
            order_obj->amt = mcb->order_data[i].amt;
            mcb->order_data[i].order_obj = order_obj;
            // prlog("order inserted in memory " << order_obj->orders << " amt " << order_obj->amt);
        }
        else
        {
            orders_Delete(*order_obj);
        };
    };
}

// void test_save()
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

    myns::mcb_t *mcb = (myns::mcb_t *)calloc(1, sizeof(mcb_t));

    myns::load_data(mcb);
    myns::scan(mcb);


    myns::test_delete_update(mcb);
    myns::scan(mcb);

    // myns::test_scan_update();
    // myns::scan(mcb);

    myns::MainLoop();
    prlog("==done 26");
}
