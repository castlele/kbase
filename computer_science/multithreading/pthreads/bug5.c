/******************************************************************************
* FILE: bug5.c
* DESCRIPTION:
*   A simple pthreads program that dies before the threads can do their
*   work. Figure out why.
* AUTHOR: 07/06/05 Blaise Barney
* LAST REVISED: 07/11/12
******************************************************************************/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define NUM_THREADS	5

void *PrintHello(void *threadid)
{
    int i;
    double myresult=0.0;
    printf("thread=%ld: starting...\n", threadid);
    for (i=0; i<1000000; i++)
        myresult += sin(i) * tan(i);
    printf("thread=%ld result=%e. Done.\n",threadid,myresult);
    pthread_exit(NULL);
}

// Original source code: https://github.com/LLNL/HPC-Tutorials/blob/main/posix/samples/bug5.c
int main(int argc, char *argv[])
{
    pthread_t threads[NUM_THREADS];

    // Bug Fix: is to make threads detached or join them to main
    pthread_attr_t attr;

    pthread_attr_init(&attr);

    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);

    for (long t=0;t<NUM_THREADS;t++) {
        printf("Main: creating thread %ld\n", t);
        int rc = pthread_create(&threads[t], &attr, PrintHello, (void *)t);
        if (rc) {
            printf("ERROR; return code from pthread_create() is %d\n", rc);
            pthread_attr_destroy(&attr);
            exit(-1);
        }
    }

    pthread_attr_destroy(&attr);

    printf("Main: Done.\n");

    pthread_exit(NULL);
}
