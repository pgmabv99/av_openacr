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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/epoll.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define MAX_EVENTS 10
#define PORT 8080
#define BUFFER_SIZE 512

namespace myns
{
    #define N_part 3
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
        void add_part();
        void add_order(algo::Smallstr50 order_key, algo::Smallstr50 part_key, int quantity);
        void add_orders();
        void test_save();
        int epol_server();
        void epoll_set_nonblocking(int fd);
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
        prlog("="<< Keyval("part", part_obj.part) << Keyval("amount", part_obj.amt) << Keyval("f_amt", part_obj.f_amt));
        ind_beg(myns::part_zd_order_curs, order_obj, part_obj)
        {
                prlog("=== "<<Keyval("order", order_obj.order) << Keyval("quantity", order_obj.quantity));
        };
        ind_end;
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

void myns::mcb_t::test_delete()
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

    return;
}

void myns::mcb_t::add_part()
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
};

void myns::mcb_t::add_orders()
{
    add_order(algo::Smallstr50 ("order98_1"),algo::Smallstr50 ( "part98"),98);
    add_order(algo::Smallstr50 ("order99_1"),algo::Smallstr50 ( "part99"),99);
    // duplicate order
    add_order(algo::Smallstr50 ("order99_1"),algo::Smallstr50 ( "part99"),99);
    // non-existing part
    add_order(algo::Smallstr50 ("order66_1"),algo::Smallstr50 ( "part66"),66);
}

void myns::mcb_t::add_order(algo::Smallstr50 order_key, algo::Smallstr50 part_key, int quantity) 
{
    myns::FPart *part_obj = myns::ind_part_Find(part_key);

    myns::Order *order_obj = &order_Alloc();
    order_obj->order = order_key;
    order_obj->p_part = part_obj;
    order_obj->quantity = quantity;
    if (order_XrefMaybe(*order_obj))
    {
        prlog("order  inserted in memory with xref " << order_obj->order 
        << " p_part "   << order_obj->p_part->part
        << " quantity " << order_obj->quantity);
    }
    else
    {

        prlog("xref: fail to insert  " << order_obj->order);
        order_Delete(*order_obj);
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

// Helper function to set a file descriptor to non-blocking mode
void myns::mcb_t::epoll_set_nonblocking(int fd) {
    int flags = fcntl(fd, F_GETFL, 0);
    if (flags == -1) {
        prlog("fcntl(F_GETFL)");
        exit(EXIT_FAILURE);
    }
    if (fcntl(fd, F_SETFL, flags | O_NONBLOCK) == -1) {
        prlog("fcntl(F_SETFL)");
        exit(EXIT_FAILURE);
    }
}
int  myns::mcb_t::epol_server(){
    int server_fd, new_socket, epoll_fd;
    struct sockaddr_in address;
    struct epoll_event event, events[MAX_EVENTS];
    int addrlen = sizeof(address);

    // Create a TCP socket
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == -1) {
        prlog("socket failed");
        exit(EXIT_FAILURE);
    }

    // Make the server socket reusable and non-blocking
    int opt = 1;
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
    epoll_set_nonblocking(server_fd);

    // Bind to the specified port
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
        prlog("bind failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Start listening for incoming connections
    if (listen(server_fd, 10) < 0) {
        prlog("listen");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Create an epoll instance
    epoll_fd = epoll_create1(0);
    if (epoll_fd == -1) {
        prlog("epoll_create1");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Add the server socket to the epoll instance
    event.events = EPOLLIN;
    event.data.fd = server_fd;
    if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, server_fd, &event) == -1) {
        prlog("epoll_ctl: server_fd");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    prlog("Server listening on port  . " << PORT);

    // Main event loop
    while (1) {
        int nfds = epoll_wait(epoll_fd, events, MAX_EVENTS, -1);
        if (nfds == -1) {
            prlog("epoll_wait");
            break;
        }

        for (int i = 0; i < nfds; i++) {
            if (events[i].data.fd == server_fd) {
                // Accept a new connection
                new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
                if (new_socket == -1) {
                    prlog("accept");
                    continue;
                }
                prlog("Accepted new connection from %s:%d\n"<<
                       inet_ntoa(address.sin_addr) << "port " << ntohs(address.sin_port));

                // Make the new socket non-blocking and add it to epoll
                epoll_set_nonblocking(new_socket);
                event.events = EPOLLIN | EPOLLET;  // Edge-triggered read event
                event.data.fd = new_socket;
                if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, new_socket, &event) == -1) {
                    prlog("epoll_ctl: new_socket");
                    close(new_socket);
                }
            } else {
                // Handle data from a connected client
                int client_fd = events[i].data.fd;
                char buffer[BUFFER_SIZE];
                ssize_t count;

                while ((count = read(client_fd, buffer, sizeof(buffer) - 1)) > 0) {
                    buffer[count] = '\0';  // Null-terminate the buffer
                    prlog("Received from client_fd " << client_fd << "buffer "<<buffer);

                    // Echo the data back to the client
                    if (write(client_fd, buffer, count) == -1) {
                        prlog("write");
                        close(client_fd);
                        break;
                    }
                }

                if (count == -1 && errno != EAGAIN) {
                    prlog("read");
                    close(client_fd);
                } else if (count == 0) {
                    // Client closed the connection
                    prlog("Client  disconnected " << client_fd);
                    close(client_fd);
                }
            }
        }
    }

    close(server_fd);
    close(epoll_fd);
    return 0;

}
void myns::Main()
{
    prlog("manual creation and deletion of part");

    myns::mcb_t *mcb = new myns::mcb_t();

    mcb->add_part();
    mcb->scan();

    // mcb->test_delete();
    // mcb->scan();

    algo::Smallstr50 part_key;
    part_key = "part5";
    mcb->test_update(part_key);
    part_key = "part98";
    mcb->test_update(part_key);
    mcb->scan();
    mcb->add_orders();
    mcb->scan();

    mcb->epol_server();

    myns::MainLoop();
    prlog("==done 31");
    delete mcb;
}
