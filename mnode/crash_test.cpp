#include <cstdio>
#include <cstdlib>
#include <unistd.h>
#include <sys/resource.h>
#include <sys/prctl.h>

int main()
{
    // Print current working directory
    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != nullptr)
        printf("Current working directory: %s\n", cwd);
    else
        perror("getcwd");

    // Ensure core dumps are allowed (important when running with sudo)
    if (prctl(PR_SET_DUMPABLE, 1) != 0)
        perror("prctl(PR_SET_DUMPABLE)");

    // Set unlimited core size programmatically
    struct rlimit rl;
    rl.rlim_cur = RLIM_INFINITY;
    rl.rlim_max = RLIM_INFINITY;
    if (setrlimit(RLIMIT_CORE, &rl) != 0)
        perror("setrlimit");

    printf("About to crash...\n");
    fflush(stdout);

    // Force segmentation fault
    volatile int *p = (int*)0;
    *p = 42;

    return 0;
}

// g++ -g -O0 crash_test.cpp -o crash_test