#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void* my_turn(void *arg)
{
    int *iptr = (int *)malloc(sizeof(int));

    for (int i = 0; i < 5; i++) {
        sleep(1);
        *iptr = i;
        printf("My Turn! %i\n", i);
    }

    return iptr;
}

void your_turn()
{
    for (int i = 0; i < 3; i++) {
        sleep(1);
        printf("Your Turn!\n");
    }
}

int main()
{
    pthread_t thread;
    int *result;

    pthread_create(&thread, NULL, my_turn, NULL);
    your_turn();
    pthread_join(thread, (void *)&result);
    printf("Result is: %i", *result);
}
