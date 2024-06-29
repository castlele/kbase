#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>

void presentationToNetwork(struct sockaddr_in sa, const char* ip)
{
    inet_pton(AF_INET, ip, &(sa.sin_addr));
}

void networkToPresentation(struct sockaddr_in sa)
{
    char ip4[INET_ADDRSTRLEN];

    inet_ntop(AF_INET, &(sa.sin_addr), ip4, INET_ADDRSTRLEN);

    printf("%s", ip4);
}

int main()
{
    struct sockaddr_in sa;
    presentationToNetwork(sa, "192.168.0.37");
    printf("%i\n", sa.sin_addr.s_addr);

    networkToPresentation(sa);

    return 0;
}
