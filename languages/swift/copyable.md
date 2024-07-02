# Copyable protocol

All types by default try to conform protocol copyable by default (even generics). Hence, explicit conformance can be avoided.

Objects that conform to copyable protocol behaves the same as in swift versions below 6.0: 

- value types creates a new copy of the objects:

    ```swift
    let greeting = "Hello"
    var greet = greeting

    greet += ", World!"

    #expect(greeting == "Hello")
    ```

- reference types creates a new reference to the object (if we assume, that there is no cow or other copying mechanisms):

    ```swift
    class User {
        var name: String

        init(_ name: String) { self.name = name }
    }

    let user = User("Castle")
    let user1 = user

    user1.name = "Beckett"

    #expect(user.name == "Beckett")
    ```

## Noncopyable

With a special tilda (~) declaration we can remove `Copyable` conformance:

```swift
class User: ~Copyable { }
```

Tilda shows the absence of the protocol conformance on the object, making in our case the user class noncopyable. This means we must controll the ownership of the objects manually.

```swift
// Must end the lifetime of the User object
func remove(_ user: consuming User) {
    discard user
}

// With borrowing we have a read only access to the object without possibility to assign it to another property
func printName(_ user: borrowing User) {
}

func rename(_ user: intout User) {
}
```

As in consuming methods we should end lifetime of the object there is a new keyword `discard` that calls deinit for on the object. Unfortunetly, not every noncopyable object can be easily discarded. To be discarded stored properties of the object should contain only **trivial** types like:

- Builtin integer types (Int, UInt, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64)
- Builtin floating-point types (Float, Double, Float80)
- Builtin Boolean type (Bool)
- Raw pointer types (UnsafePointer, UnsafeMutablePointer, UnsafeRawPointer, UnsafeMutableRawPointer)
- AnyOptional and its derivatives (such as Optional)
- OptionSet types
- Function types (() -> Void, (Int) -> String)
- Tuples containing trivial types only
- Enums that have no associated values or only have associated values of trivial types.
- Structs containing stored properties of trivial types only

Consuming and borrowing works only with noncopyable types, but there is a keyword `consume` that can be used with any type:

```swift
let user = User()

let newUser = consume user

// This will cause an error, because now `user` don't have an access to its object.
// User instance can be accessed only with `newUser` property
user.name
```

### Conditionally copyable

![shiiiit](/languages/swift/res/conditionally_copyable.png)

