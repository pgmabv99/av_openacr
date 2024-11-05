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

void myns::Main()
{
    prlog("manual creation of orders");

    myns::Orders &order14 = myns::ind_orders_GetOrCreate("order14");
    order14.amt = 14;
    prlog("order inserted in memory " << order14.orders << " amt " << order14.amt);
    myns::Orders &order16  = myns::ind_orders_GetOrCreate("order16");
    order16.amt = 16;
    prlog("order inserted in memory " << order16.orders << " amt " << order16.amt);
    prlog("==delete order16");
    orders_Delete(order16);
    
    prlog("==scan  ");
    ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    {
        prlog(Keyval("order", order.orders));
        prlog(Keyval("amount", order.amt));

    }
    ind_end;
    
    prlog("==scan list and update ");
        ind_beg(myns::_db_zd_orders_curs, order, myns::_db)
    {
        prlog(Keyval("order", order.orders));
        prlog(Keyval("amount", order.amt));
        if (order.amt < 15) {
            prlog("deleting  order " << order.orders);
            orders_Delete(order);
        } else {
            prlog("adding 1000 to order -> " << order.amt);
            order.amt +=1000;
        }

    }
    ind_end;

    myns::MainLoop();
}
