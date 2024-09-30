---
tags:
  - kotlin
  - article
---
> [**Source**](https://kt.academy/article/kfde-objects)

## Objects

***Object** is an instance of the class.* Object can be created by using constructor of the class:

```kotlin
class A

val objectA = A()
```

However, in kotlin language objects can be created also using **object expression** and **object declaration**

### Object Expression

To create an object with object expression `object` keyword is used:

```kotlin
val objectInstance = object {}
```

In the current example `objectInstance` is an equivalent to `Any()`, e.g. it extends no class (except of the `Any` which is a parent to every object in kotlin), no interface and has nothing inside its body. The power of this object lies in its uniqueness: *This object equals nothing else but itself*

Therefore, it is perfectly suited to be used as some kind of token of synchronisation lock:

```kotlin
class Box {
	var value: Any? = NOT_SET

	var isInitialized: Boolean
		get() = value != NOT_SET

	companion object {
		// Alternatively Any() can be used here
		// private val NOT_SET = Any()
		private val NOT_SET = object {}
	}
}
```

And of course objects expressions can inherit from other classes of implement interfaces and even have their own bodies:

```kotlin
interface UserProducer {
	fun produce(): User
}

val producer = object : UserProducer {
	override fun produce(): User 
		= db.getRandomUser()
}
```

## Object declaration

*Object expression + name = object declaration*. This structure also creates a single object, but it can be referenced by its name from anywhere. This object is an implementation of a singleton pattern.

```kotlin
object Constants {
	val defaultPadding = object {
		val left = 16
		val right = 16
	}
}
```