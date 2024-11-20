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

// Helper function to set a file descriptor to non-blocking mode
void epoll_set_nonblocking(int fd) {
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

int main() {
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

    printf("Server listening on port %d...\n", PORT);

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
                printf("Accepted new connection from %s:%d\n",
                       inet_ntoa(address.sin_addr), ntohs(address.sin_port));

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
                    printf("Received from client %d: %s\n", client_fd, buffer);

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
                    printf("Client %d disconnected\n", client_fd);
                    close(client_fd);
                }
            }
        }
    }

    close(server_fd);
    close(epoll_fd);
    return 0;
}
