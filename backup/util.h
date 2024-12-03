
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
#include <arpa/inet.h>
#include <iostream>    // For std::cerr, std::endl
#include <fstream>     // For std::ofstream

#define MAX_EVENTS 10
#define PORT 8080
#define BUFFER_SIZE 512
#define CMD_SIZE 4


namespace myns
{
#define N_PART 3
    typedef struct
    {
        algo::Smallstr50 part_key;
        int amt;
        myns::FPart *part_obj;
    } part_data_t;

    class Mcb
    {
    public:
        // methods
        Mcb();
        ~Mcb();
        static void terminate_mcb(Mcb *mcb = nullptr);
        static void scan_db_part_order();
        static void scan_zd_db_order_via_sched1_fstep();
        static void scan_zd_db_order_via_own_fstep();

        static void test_delete();
        static void test_update(algo::Smallstr50 part_key);
        static void add_part();
        static bool add_order(algo::Smallstr50 part_key, int quantity);
        static void add_orders_manually();
        static void fill_orders();
        static void test_save();
        static void cmd_execute(char cmd[CMD_SIZE]);

        // for tcp
        static void tcp_listen();
        static void tcp_accept();
        static void tcp_read(myns::Client &client_obj);
        static void tcp_close(myns::Client &client_obj);

        // for terminal
        static void trm_listen();

        inline static int step_invocation_count = 0;

        static void trm_read();
    private:
        static algo::Smallstr50 eyecatcher;
        static std::vector<part_data_t> part_data;
    };
}
