## Why to Use Objective-C

**Stability**: Objc was quite long on the scene of the programming languages and prove that it is stable and mature language. It has a foundation of libraries and code examples to help new developers learn and use it.

**C/C++ interoperability**: As swift language grows this point become less actual. However, right now this is very important feature to use c++ in your code base. This enables usage of powerful third party libraries or simple cross platform common c++ code across all products.

## Properties

Difference between `retain`, `strong`, `weak` and `copy`
- `retain` and `strong` both indicate that the object should be retained and keep a strong reference to it. The difference lies in the context:
	- `retain` is used in manual reference counting (MRC) for managing object ownership manually.
	- `strong` is used in automatic reference counting (ARC) to indicate a strong reference without manually managing retain counts. It is the default attribute in ARC and is commonly used for instance variables and properties.
- `weak` indicates a weak reference that does not keep the object alive. It is typically used to break retain cycles and avoid strong reference cycles between objects.
- `copy` creates a copy of an object when assigning it to the property. It is useful when you want to ensure that the object’s value remains unchanged.

Difference between `assign`, `weak`, and `unsafe_unretained`:
- `assign`: The `assign` attribute is used for primitive types (e.g., `int`, `float`) and weakly-typed objects. It assigns the value directly without retaining or releasing it. This attribute is used in Manual Reference Counting (MRC) and is the default behavior for object properties.
- `weak`: The `weak` attribute is used for object references and creates a weak reference to the object. It does not retain or release the object, and if the object is deallocated, the reference is automatically set to `nil`. This attribute is used in Automatic Reference Counting (ARC) to avoid strong reference cycles.
- `unsafe_unretained`: The `unsafe_unretained` attribute is similar to `weak`, but it does not automatically set the reference to `nil` when the object is deallocated. If the referenced object is deallocated, the reference becomes a dangling pointer. This attribute is used in MRC or when dealing with legacy code.

When to use each attribute:
- Use `assign` for primitive types or weakly-typed objects that do not require memory management.
- Use `weak` for object references to avoid strong reference cycles or retain cycles.
- Use `unsafe_unretained` only when necessary, such as in MRC or when dealing with legacy code where automatic setting of the reference to `nil` is not required.

Common property attributes include:
- `readonly`: Indicates that the property can be read but not written to. The compiler generates a getter method but no setter method.
- `readwrite`: Indicates that the property can be both read and written to. This is the default attribute if none is specified.
- `nonatomic`: Specifies that the property is not thread-safe and can be accessed from multiple threads simultaneously without synchronization. It improves performance but can lead to data corruption in a multithreaded environment.
- `atomic`: Specifies that the property is thread-safe and ensures that access is synchronized. It provides data integrity in a multithreaded environment but can impact performance.
- `weak`: Specifies a weak reference to the property. The reference is automatically set to `nil` when the referenced object is deallocated. It helps to avoid strong reference cycles.
- `strong`/`retain`: Specifies a strong reference to the property, retaining the referenced object. The reference count of the object is increased.
- `copy`: Specifies that the property should make a copy of the assigned value when set. It is commonly used for NSString and block properties to ensure immutability and avoid mutability issues.
- `getter=`/`setter=`: Allows customizing the getter and setter method names for the property.
## @autoreleasepool

Block of `@autoreleasepool` is responsible for managing autoreleased objects. This objects will be automatically released on the current iteration of the run loop.

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