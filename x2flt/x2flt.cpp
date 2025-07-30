

// Copyright (C) 2025 AlgoRND
//
// License: X2
// This source code constitutes confidential information and trade secrets
// of AlgoX2 Corp. Unauthorized copying, distribution or sharing of this file,
// via any medium, is strictly prohibited.
// Sample exit to transform X2 data
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char buffer[1024];

    while (fgets(buffer, sizeof(buffer), stdin)) {
        // Remove trailing newline (optional)
        size_t len = strlen(buffer);
        if (len > 0 && buffer[len - 1] == '\n') {
            buffer[len - 1] = '\0';
        }
        // ADD CONVERSION LOGIC HERE
        printf("x2flt output  : =========== Not Really %s =============\n", buffer);
        fflush(stdout); // Important: flush to ensure data is sent immediately
    }

    return 0;
}
