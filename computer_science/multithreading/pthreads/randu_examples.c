/* This examples were taken from https://randu.org/tutorials/threads/ */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_THREADS 5

typedef struct {
    int tid;
    double stuff;
} thread_data_t;

// Shared data between threads
double shared_x;
pthread_mutex_t lock_x;

void *thr_func(void *arg)
{
    thread_data_t *data = (thread_data_t *)arg;

    printf("Hello from thr_func, thread id: %d\n", data->tid);

    pthread_mutex_lock(&lock_x);
        shared_x += data->stuff;
        printf("x = %f\n", shared_x);
    pthread_mutex_unlock(&lock_x);

    pthread_exit(NULL);
}

int main(void)
{
    pthread_t thr[NUM_THREADS];
    thread_data_t thr_data[NUM_THREADS];
    pthread_mutex_init(&lock_x, NULL);

    shared_x = 0;

    for (int i = 0; i < NUM_THREADS; ++i)
    {
        thr_data[i].tid = i;
        thr_data[i].stuff = (i + 1) * NUM_THREADS;

        int status = pthread_create(&thr[i], NULL, thr_func, &thr_data[i]);

        if (status != 0)
        {
            fprintf(stderr, "error: pthread_create, status: %d\n", status);
            return EXIT_FAILURE;
        }
    }

    for (int i = 0; i < NUM_THREADS; ++i)
    {
        pthread_join(thr[i], NULL);
    }

    return EXIT_SUCCESS;
}
