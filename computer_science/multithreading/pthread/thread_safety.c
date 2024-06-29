#include <alloca.h>
#include <stdio.h>
#include <stdint.h>
#include <pthread.h>

#define BIG 1000000000UL
uint32_t counter = 0;
// This variant is preferable in most EASY cases
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

/**
 * This variant is preferable when there is a need to pass arguments to mutex. Such as if it is recursive or should being sharable between processes
 * ```
 * pthread_mutex_t lock;
 * pthread_mutex_init(&lock, NULL);
 * ```
 */

void* count_to_big(void *arg)
{
    printf("Enter to func\n");
    for (uint32_t i = 0; i < BIG; i++) {
        printf("start iterating at %i\n", i);
        pthread_mutex_lock(&lock);
        counter++;
        pthread_mutex_unlock(&lock);
    }

    return NULL;
}

int main()
{
    pthread_t thread;

    pthread_create(&thread, NULL, count_to_big, NULL);
    count_to_big(NULL);

    pthread_join(thread, NULL);

    printf("Result is: %i\n", counter);
    return 0;
}
