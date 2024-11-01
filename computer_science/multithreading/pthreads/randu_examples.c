/* This examples were taken from https://randu.org/tutorials/threads/ */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_THREADS 2

typedef struct {
    int tid;
    double stuff;
} thread_data_t;

void *thr_func(void *arg)
{
    thread_data_t *data = (thread_data_t *)arg;

    printf("Hello from thr_func, thread id: %d\n", data->tid);

    pthread_exit(NULL);
}

int main(void)
{
    pthread_t thr[NUM_THREADS];
    thread_data_t thr_data[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; ++i)
    {
        thr_data[i].tid = i;

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
