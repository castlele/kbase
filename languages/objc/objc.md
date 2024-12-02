## Why to Use Objective-C

**Stability**: Objc was quite long on the scene of the programming languages and prove that it is stable and mature language. It has a foundation of libraries and code examples to help new developers learn and use it.

**C/C++ interoperability**: As swift language grows this point become less actual. However, right now this is very important feature to use c++ in your code base. This enables usage of powerful third party libraries or simple cross platform common c++ code across all products.

## @synthesize

`@synthesize` keyword is used to generate a property accessor. So you can write custom property getter/setter. By default clang compiler automatically generates accessors adding: `@synthesize propertyName = _propertyName`. However, there are a few exceptions:

1. property with custom getter and setter
2. readonly property with custom getter
3. @dynamic property
4. properties declared in `@protocol` or category
5. overriden properties

## Difference between atomic and nonatomic synthesized properties

**Atomic** properties ensures synchronization to prevent data races on setters and getters.

**Nonatomic** properties on the other hand are faster, but don't give this kind of synchronization between threads.