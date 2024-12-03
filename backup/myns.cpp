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

#include "cpp/myns/util.h"

// Definition of static members
algo::Smallstr50 myns::Mcb::eyecatcher;
std::vector<myns::part_data_t> myns::Mcb::part_data;

// constructor
myns::Mcb::Mcb()
{
    eyecatcher = "Mcb";
    prlog("create instance  " << eyecatcher);
    part_data.resize(N_PART);
}

// destructor
myns::Mcb::~Mcb()
{
    prlog("destroy instance " << eyecatcher);
}

void myns::Mcb::scan_db_part_order()
{
    prlog("==scn_db_part_order  ");
    ind_beg(myns::_db_zd_part_curs, part_obj, myns::_db)
    {
        prlog("=" << Keyval("part", part_obj.part) << Keyval("amount", part_obj.amt));
        ind_beg(myns::part_zd_partorder_curs, order_obj, part_obj)
        {
            prlog("=== " << Keyval("order", order_obj.order)
                         << Keyval("quantity", order_obj.quantity)
                         << Keyval("filled", order_obj.filled));
        };
        ind_end;
    }
    ind_end;
}

void myns::Mcb::scan_zd_db_order_via_sched1_fstep()
{
    prlog("==scn_db_order via zd !!  ");
    ind_beg(myns::_db_zd_order_curs, order_obj, myns::_db)
    {
        prlog("=== " << Keyval("order", order_obj.order)
                        << Keyval("quantity", order_obj.quantity)
                        << Keyval("filled", order_obj.filled));
    };
    ind_end;
}
void myns::Mcb::scan_zd_db_order_via_own_fstep()
{
    myns::Mcb::step_invocation_count++;
    std::ofstream outfile("av_openacr/myfile.txt");
    if (outfile.is_open()) {
        outfile << "step_invocation_count: " << myns::Mcb::step_invocation_count << std::endl;
        outfile.close();
    } else {
        prlog("Unable to open file");
    }
    prlog("==scn_db_order via zd !!  ");
    ind_beg(myns::_db_zd_order_curs, order_obj, myns::_db)
    {
        prlog("=== " << Keyval("order", order_obj.order)
                        << Keyval("quantity", order_obj.quantity)
                        << Keyval("filled", order_obj.filled));
    };
    ind_end;
}

void myns::Mcb::fill_orders(){
    prlog("==fill orders  ");
    ind_beg(myns::_db_zd_part_curs, part_obj, myns::_db)
    {
        prlog("=" << Keyval("part", part_obj.part));
        ind_beg(myns::part_zd_partorder_curs, order_obj, part_obj)
        {
            if (!order_obj.filled)
            {
                if (part_obj.amt >= order_obj.quantity)
                {
                    part_obj.amt -= order_obj.quantity;
                    order_obj.filled = true;
                    prlog("=== " << Keyval("order", order_obj.order)
                                 << Keyval("quantity", order_obj.quantity)
                                 << Keyval("filled", order_obj.filled));
                }
                else
                {
                    prlog("=== " << Keyval("order", order_obj.order)
                                 << " not enough stock");
                }
            }
        };
        ind_end;
    }
    ind_end;
}

void myns::Mcb::test_update(algo::Smallstr50 part_key)
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

void myns::Mcb::test_delete()
{
    // delete by obj. comment out because Part_delete not generated
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

void myns::Mcb::add_part()
{
    prlog("==generate data (exercize in char vs str vs Smallstr) ");

    for (int i = 0; i < N_PART; i++)
    {
        cstring tmpcstr;
        tmpcstr << "part" << i;
        part_data[i].part_key = tmpcstr;
        part_data[i].amt = i * 10;
        part_data[i].part_obj = nullptr;
    }

    prlog("==load data into acr  ");
    for (int i = 0; i < N_PART; i++)
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

void myns::Mcb::add_orders_manually()
{

    for (auto i = 0; i < 10; i++)
    {
        add_order(algo::Smallstr50("part98"), 10);
        add_order(algo::Smallstr50("part99"), 10);
    }
    // duplicate order
    add_order(algo::Smallstr50("part99"), 10);
    // non-existing part
    add_order(algo::Smallstr50("part66"), 10);
}

bool myns::Mcb::add_order(algo::Smallstr50 part_key, int quantity)
{
    bool retval = true;
    myns::FPart *part_obj;
    if (!(part_obj = myns::ind_part_Find(part_key))){
        prlog("part not found " << part_key);
        retval = false;
        return retval;
    }

    myns::Order *order_obj = &order_Alloc();
    algo::cstring order_key;
    order_key << part_key << "_order_" << part_obj->zd_partorder_n;
    order_obj->order = order_key;

    order_obj->p_part = part_obj;
    order_obj->quantity = quantity;
    order_obj->filled = false;
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
        retval = false;
    };
    return retval;
}




void myns::Mcb::test_save()
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

void myns::Mcb::tcp_listen()
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
void myns::Mcb::tcp_accept()
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

// called on events on client socket like err/eof
void myns::Mcb::tcp_close(myns::Client &client_obj)
{
    close(client_obj.read.fildes.value);
    IohookRemove(client_obj.read);
    client_Delete(client_obj);
};

// called on events on client socket like read/write
void myns::Mcb::tcp_read(myns::Client &client_obj)
{
    prlog("==tcp_read fd " << client_obj.read.fildes.value);
    char buffer[BUFFER_SIZE];
    ssize_t buffer_len;
    char response[BUFFER_SIZE];
    ssize_t response_len;

    buffer_len = read(client_obj.read.fildes.value, buffer, sizeof(buffer) - 1);
    if (buffer_len > 0)
    {
        buffer[buffer_len] = '\0'; // Null-terminate the buffer
        prlog("Received from client fd " << client_obj.read.fildes.value << " buffer " << buffer);

        // Parse buffer into 6-byte char array and integer using sscanf
        char part_key[7] = ""; // 6 bytes for the string part + 1 for the null terminator
        int amt =0 ;
        sscanf(buffer, "%6s%d", part_key, &amt);

        prlog("part_key: " << part_key << ", amt: " << amt);

        // add the order
        auto retval=add_order(algo::Smallstr50(part_key), amt);

        // response  to the client
        if (retval)
        {

            response_len = sprintf(response, "added order for part %s with quantity %d \n", part_key, amt);
        }
        else
        {
            response_len = sprintf(response, "Failed to add order for part %s with quantity %d \n", part_key, amt);
        }
        if (write(client_obj.read.fildes.value, response, response_len) == -1)
        {
            prlog("write error" << client_obj.read.fildes.value);
            tcp_close(client_obj);
        }
    }
    if (buffer_len == -1 && errno != EAGAIN)
    {
        prlog("read error" << client_obj.read.fildes.value);
        tcp_close(client_obj);
    }
    else if (buffer_len == 0)
    {
        prlog("Client  disconnected " << client_obj.read.fildes.value);
        tcp_close(client_obj);
    }

}

void myns::Mcb::trm_listen()
{
    _db.terminal.fildes = algo::Fildes(0);
    algo::SetBlockingMode(_db.terminal.fildes, false);

    callback_Set0(_db.terminal, trm_read);

    IOEvtFlags flags;
    read_Set(flags, true);
    IohookAdd(_db.terminal, flags);
}

void myns::Mcb::trm_read()
{
    // prlog("==trm_read");
    char buffer[BUFFER_SIZE];
    ssize_t buffer_len;

    buffer_len = read(_db.terminal.fildes.value, buffer, sizeof(buffer) - 1);
    if (buffer_len > 0)
    {
        buffer[buffer_len] = '\0';
        char cmd[CMD_SIZE + 1];
        strncpy(cmd, buffer, CMD_SIZE);
        cmd[CMD_SIZE] = '\0';
        cmd_execute(cmd);
    }
    if (buffer_len == -1 && errno != EAGAIN)
    { // no code ?
    }
    else if (buffer_len == 0)
    {
        IohookRemove(_db.terminal);
    }
}

void myns::Mcb::cmd_execute(char cmd[CMD_SIZE])
{

    if (strcmp(cmd, "show") == 0)
    {
        scan_db_part_order();
    }
    else if (strcmp(cmd, "save") == 0)
    {
        test_save();
    }
    else if (strcmp(cmd, "exit") == 0)
    {
        terminate_mcb();
    }
    else if (strcmp(cmd, "addo") == 0)
    {
        add_orders_manually();
    }
    else if (strcmp(cmd, "fill") == 0)
    {
        fill_orders();
    }
    else
    {
        prlog("unknown command");
    }
}

void myns::Main()
{
    prlog("tests");

    myns::Mcb *mcb = new myns::Mcb();

    // mcb->add_part();
    // mcb->scan_db_part_order();

    // // mcb->test_delete();
    // // mcb->scan_db_part_order();

    // algo::Smallstr50 part_key;
    // part_key = "part5";
    // mcb->test_update(part_key);
    // part_key = "part98";
    // mcb->test_update(part_key);
    // mcb->scan_db_part_order();
    // mcb->add_orders_manually();
    // mcb->scan_db_part_order();

    mcb->tcp_listen();
    mcb->trm_listen();

    myns::MainLoop();
    mcb->terminate_mcb(mcb);
}

void myns::Mcb::terminate_mcb(Mcb *mcb)
{
    prlog("==done 35");
    delete mcb;
    exit(EXIT_SUCCESS);
}
