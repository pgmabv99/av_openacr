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

namespace myns
{

    typedef struct
    {
        // std::string name;
        // algo::Smallstr50 name;
        const char *name;
        int amt;
        myns::Orders *order;
    } order_data_t;
    typedef struct
    {
        order_data_t *order_data;
    } mcb_t;
    void scan();
    void load_data(mcb_t* mcb);
}

void myns::scan()
{
    prlog("==scan  ");
    ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    {
        prlog(Keyval("order", order.orders)<<Keyval("amount", order.amt));

    }
    ind_end;
}

void myns::load_data(myns::mcb_t* mcb)
{
    myns::Orders *order = nullptr;
    #define N_ORDERS 4
    mcb->order_data = (myns::order_data_t *)calloc(N_ORDERS, sizeof(myns::order_data_t));
    for (int i = 0; i < N_ORDERS; i++)
    // {
    //     mcb->order_data[i].order = nullptr;
    //     // std::string order_name = "order" + std::to_string(i);
    //     // mcb->order_data[i].name = order_name.c_str();
    //     // mcb->order_data[i].name = algo::Smallstr50("order" + std::to_string(i));
    //     mcb->order_data[i].name = algo::Smallstr50(std::string("order")) ;
    //     mcb->order_data[i].amt = i*10;
    // }
    mcb->order_data[0] = {"order0", 0};
    mcb->order_data[1] = {"order1", 10};
    mcb->order_data[2] = {"order2", 20};
    mcb->order_data[3] = {"order3", 30};

    for (long unsigned int i = 0; i < N_ORDERS; i++)
    {
        order = &orders_Alloc();
        if (!orders_XrefMaybe(*order))
        {
            orders_Delete(*order);
            order = NULL;
        }
        else
        {
            order->orders = mcb->order_data[i].name;
            order->amt = mcb->order_data[i].amt;
            mcb->order_data[i].order = order;
            prlog("order inserted in memory " << order->orders << " amt " << order->amt);
        };
    }
}
void myns::Main()
{
    prlog("manual creation and deletion of orders");

    myns::mcb_t *mcb = (myns::mcb_t *)calloc(1, sizeof(mcb_t));

    myns::load_data(mcb);
     
    myns::scan();

    auto  iorder=3-1;
    prlog("==delete order "<<iorder);
    prlog("==delete order name "<<mcb->order_data[iorder].name);
    myns::Orders* order= mcb->order_data[iorder].order;
    orders_Delete(*order);
    
    myns::scan();
    
    // prlog("==scan list and update ");
    //     ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    // {
    //     prlog(Keyval("order", order.orders)<<Keyval("amount", order.amt));;
    //     if (order.amt < 15) {
    //         prlog("deleting  order " << order.orders);
    //         orders_Delete(order);
    //     } else {
    //         prlog("adding 1000 to order -> " << order.amt);
    //         order.amt +=1000;
    //     }

    // }
    // ind_end;

    myns::MainLoop();
}
