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
    prlog("Hello, World!");
    prlog("list of ");
    ind_beg(myns::_db_orders_curs, order, myns::_db)
    {
        prlog(Keyval("order", order.orders));
        prlog(Keyval("amount", order.amt));
        if (order.amt > 15) {
            // orders(order);
            // prlog("deleted order");
            order.amt +=1000;
            prlog("adding 1000 to order -> " << order.amt);
        }

    }
    ind_end;
    myns::MainLoop();
}
