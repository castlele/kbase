# Coroutines

Coroutine is an instance of some job to be done. It is similar to threads in the sence that it can run in parallel with other code. But coroutine can suspend on one thread and resume work on another (it isn't bound to any particular thread).

## Coroutines builders

Coroutines builders create coroutine scope where jobs can be launched

- `runBlocking`: **bridges non coroutine world with coroutine**, this method blocks the current thread for waiting. Inside the scope of this method is a `CoroutineScope` on which other coroutines can be launched.
- `coroutineScope`: similar to `runBlocking`, but it doesn't block the current thread and suspends immediately. This builder exits only when all work is done.
- `launch`: launches a new coroutine concurrently with the rest of the code. This coroutine continues to work independently.

## Launch

`launch` method returns an object of a `Job` type. It can be used to explicitly control the coroutine:

```kotlin
val job = launch {
    delay(1000L)
    println("World")
}

// Wait until child coroutine completes
job.join()
```

## Flows

Flow is a simple data stream similar to `Iterator` design pattern, which main difference is that it emits and consumes values asynchronously.

There are three entities involved in streams of data:

1. Producer: emites data that is added to the stream.
2. \<Optional\> Intermediaries: modifies each value emitted into the stream or the stream itself.
3. Consumer: consumes the values of the stream.

### How and Cold Flows

A cold stream doesnt' produce values until one starts to collect them. On the other hand, a hot stream starts producing values immediately.

### Create a flow

A flow can be created with [**flow builders**](https://kotlinlang.org/api/kotlinx.coroutines/kotlinx-coroutines-core/kotlinx.coroutines.flow/flow.html). In the example below, flow emites values taken from api with the seted delay.

```kotlin
class NewsDataSource(
    private val api: NewsApi,
    private val refreshDelay: Long = 5000,
) {

    val latestNews: Flow<List<Article>> = flow {
        while (true) {
            val latestNews = api.getNews()
            emit(latestNews)
            delay(refreshDelay)
        }
    }
}

interface NewsApi {
    suspend fun getNews(): List<Article>
}
```

The `flow` builder is executed within a coroutine. Thus, it benefits from the same asynchronous APIs, but some restrictions apply:

- flows are sequential. After suspend function is called, the flow waits untile the suspended function completes it's work
- flows can't emit from different `CoroutineContext`s

## StateFlow

`StateFlow` only emits last known value, whereas `SharedFlow` can configure how many previous values to be emitted.
