#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

typedef struct {
    int id;
    pthread_t t;
} Thread;

typedef struct {
    lua_State *L;
    const char *fileName;
} ThreadData;

void *threadCall(void *data)
{
    ThreadData *threadData = data;

    printf("loading file: %s\n", threadData->fileName);

    luaL_dofile(threadData->L, threadData->fileName);

    printf("Now sleeping\n");

    sleep(1);

    printf("Done\n");
    pthread_exit(NULL);
}

static int createThread(lua_State *L)
{

    Thread t = {
        .id = 1234,
    };

    const char *fileName = luaL_checkstring(L, 1);

    ThreadData data = {
        .L = L,
        .fileName = fileName,
    };

    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);

    int rc = pthread_create(&t.t, &attr, threadCall, &data);

    if (rc != 0) {
        printf("Error\n");
    }

    pthread_attr_destroy(&attr);

    lua_pushlightuserdata(L, &t);

    pthread_join(t.t, NULL);

    return 0;
}

static int joinThread(lua_State *L)
{
    Thread *t = lua_touserdata(L, 1);

    if (!t) return 0;

    pthread_join(t->t, NULL);

    return 0;
}

static const struct luaL_Reg pthread[] = {
    {"createThread", createThread},
    {"joinThread", joinThread},
    {NULL, NULL}  /* sentinel */
};

int luaopen_pthread(lua_State *L)
{
    luaL_register(L, "pthread", pthread);
    return 1;
}
