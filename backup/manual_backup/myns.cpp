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
        static void scan();
        static void test_delete();
        static void test_update(algo::Smallstr50 part_key);
        static void add_part();
        static void add_order( algo::Smallstr50 part_key, int quantity);
        static void add_orders();
        static void test_save();

        //for tcp
        static void tcp_listen();
        static void tcp_accept();
        static void tcp_read(myns::Client &client_obj);
        static void tcp_close(myns::Client &client_obj);

        //for terminal
        static void trm_listen();
        static void trm_read();
    private:
        static algo::Smallstr50 eyecatcher;
        static std::vector<part_data_t> part_data;
    };
}

// Definition of static members
algo::Smallstr50 myns::mcb_t::eyecatcher;
std::vector<myns::part_data_t> myns::mcb_t::part_data;

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
        prlog("=" << Keyval("part", part_obj.part) << Keyval("amount", part_obj.amt) << Keyval("f_amt", part_obj.f_amt));
        ind_beg(myns::part_zd_order_curs, order_obj, part_obj)
        {
            prlog("=== " << Keyval("order", order_obj.order) << Keyval("quantity", order_obj.quantity));
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
    add_order( algo::Smallstr50("part98"), 98);
    add_order( algo::Smallstr50("part99"), 99);
    // duplicate order
    add_order( algo::Smallstr50("part99"), 99);
    // non-existing part
    add_order(algo::Smallstr50("part66"), 66);
}

void myns::mcb_t::add_order( algo::Smallstr50 part_key, int quantity)
{
    myns::FPart *part_obj = myns::ind_part_Find(part_key);
    myns::Order *order_obj = &order_Alloc();
    algo::cstring order_key;
    order_key <<part_key<<"_order_"<<part_obj->zd_order_n;
    order_obj->order = order_key;
    order_obj->p_part = part_obj;
    order_obj->quantity = quantity;
    if (order_XrefMaybe(*order_obj))
    {
        prlog("order  inserted in memory with xref " << order_obj->order
                                                     << " p_part " << order_obj->p_part->part
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


void myns::mcb_t::tcp_listen()
{
    // Create a TCP socket
    int server_fd;
    struct sockaddr_in address;
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == -1)
    {
        prlog("socket failed");
        exit(EXIT_FAILURE);
    }

    // Make the server socket reusable and non-blocking
    int opt = 1;
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));

    // native_set_nonblocking(server_fd);

    // Bind to the specified port
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0)
    {
        prlog("bind failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Start listening for incoming connections
    if (listen(server_fd, 10) < 0)
    {
        prlog("listen failed ");
        close(server_fd);
        exit(EXIT_FAILURE);
    }
    prlog("Server listening  on port  . " << PORT);

    _db.listen.fildes = algo::Fildes(server_fd);
    algo::SetBlockingMode(_db.listen.fildes, false);

    callback_Set0(_db.listen, tcp_accept);
    // _db.listen.callback_ctx = (u64)this;

    IOEvtFlags flags;
    read_Set(flags, true);
    IohookAdd(_db.listen, flags);
}

// called on events on listening socket
void myns::mcb_t::tcp_accept()
{
    struct sockaddr_in client_address;
    int addrlen = sizeof(client_address);
    prlog("==my_accept");

    int server_fd = _db.listen.fildes.value;
    // Accept a new connection
    int client_socket = accept(server_fd, (struct sockaddr *)&client_address, (socklen_t *)&addrlen);
    if (client_socket == -1)
    {
        prlog("accept??? ");
    }
    prlog("Accepted new connection from " << inet_ntoa(client_address.sin_addr) << " port " << ntohs(client_address.sin_port));

    // Client object to track the new connection
    myns::Client &client_obj = client_Alloc();

    char port_char_array[6];                                        // Array to store the port as a string (max length 5 digits + 1 for '\0')
    sprintf(port_char_array, "%d", ntohs(client_address.sin_port)); // Convert port to character array
    client_obj.client = port_char_array;

    // Make the new socket non-blocking and add it to epoll  via callback
    client_obj.read.fildes = algo::Fildes(client_socket);
    algo::SetBlockingMode(client_obj.read.fildes, false);

    callback_Set1(client_obj.read, client_obj, tcp_read);

    IOEvtFlags flags;
    read_Set(flags, true);
    IohookAdd(client_obj.read, flags);
    client_obj.lastbuff = "empty";

    if (client_XrefMaybe(client_obj))
    {
        prlog("client  object inserted in memory with xref. socket  " << client_obj.read.fildes.value);
    }
    else
    {
        prlog("xref: fail to insert.. exit  " << client_obj.read.fildes.value);
        tcp_close(client_obj);
        exit(EXIT_FAILURE);
    };
}

//called on events on client socket like err/eof
void myns::mcb_t::tcp_close(myns::Client &client_obj)
{
    close(client_obj.read.fildes.value);
    IohookRemove(client_obj.read);
    client_Delete(client_obj);
};

// called on events on client socket like read/write
void myns::mcb_t::tcp_read(myns::Client &client_obj)
{
    prlog("==tcp_read fd " << client_obj.read.fildes.value);
    char buffer[BUFFER_SIZE];

    ssize_t count;
    count = read(client_obj.read.fildes.value, buffer, sizeof(buffer) - 1);
    if (count > 0)
    {
        buffer[count] = '\0'; // Null-terminate the buffer
        prlog("Received from client fd " << client_obj.read.fildes.value << " buffer " << buffer);

        // Parse buffer into 6-byte char array and integer using sscanf
        char part_key[7]; // 6 bytes for the string part + 1 for the null terminator
        int amt;
        sscanf(buffer, "%6s%d", part_key, &amt);

        prlog("part_key: " << part_key << ", amt: " << amt);
        
        //add the order
        add_order( algo::Smallstr50(part_key), amt);

        // Echo the data back to the client
        if (write(client_obj.read.fildes.value, buffer, count) == -1)
        {
            prlog("write error" << client_obj.read.fildes.value);
            tcp_close(client_obj);
        }
    }
    if (count == -1 && errno != EAGAIN)
    {
        prlog("read error" << client_obj.read.fildes.value);
        tcp_close(client_obj);
    }
    else if (count == 0)
    {
        prlog("Client  disconnected " << client_obj.read.fildes.value);
        tcp_close(client_obj);
    }
    
    
    scan();
}

void myns::mcb_t::trm_listen(){
    _db.terminal.fildes = algo::Fildes(0);
    algo::SetBlockingMode(_db.terminal.fildes, false);

    callback_Set0(_db.terminal, trm_read);

    IOEvtFlags flags;
    read_Set(flags, true);
    IohookAdd(_db.terminal, flags);

}

void myns::mcb_t::trm_read(){
    // prlog("==trm_read");
    char buffer[BUFFER_SIZE];
    ssize_t count;
    #define CMD_LEN 4
    count = read(_db.terminal.fildes.value, buffer, sizeof(buffer) - 1);
    if (count > 0)
    {
        buffer[count] = '\0'; 

        char cmd[CMD_LEN+1]; 
    strncpy(cmd, buffer, CMD_LEN);
        cmd[CMD_LEN] = '\0'; 
        if (strcmp(cmd, "show") == 0) {
            scan();
        }
        else if (strcmp(cmd,"save") == 0){
            test_save();
        }
        else if (strcmp(cmd,"exit")==0){
            prlog("exiting");
            exit(EXIT_SUCCESS);
        }
        else{
            prlog("unknown command");
        }

    }
    if (count == -1 && errno != EAGAIN)
    { // no code ?
    }
    else if (count == 0)
    {
        IohookRemove(_db.terminal);
    }
}
void myns::Main()
{
    prlog("manual creation and deletion of part");

    myns::mcb_t *mcb = new myns::mcb_t();

    // mcb->add_part();
    // mcb->scan();

    // // mcb->test_delete();
    // // mcb->scan();

    // algo::Smallstr50 part_key;
    // part_key = "part5";
    // mcb->test_update(part_key);
    // part_key = "part98";
    // mcb->test_update(part_key);
    // mcb->scan();
    // mcb->add_orders();
    // mcb->scan();

    mcb->tcp_listen();
    mcb->trm_listen();

    myns::MainLoop();
    prlog("==done 31");
    delete mcb;
}
