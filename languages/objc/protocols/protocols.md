---
tags:
  - ios/objc
---
There are two types of protocols in Obj-c:

1. **Formal**: the one using `@protocol` keyword. Formal protocol declares `@optional` and `@required` methods to implement. All children of the object that implements this protocol have access to this methods

```objective-c
@protocol PrinterProtocol
- (void)printMessage:(NSString *)message;
@end

@implementation ConsoleLogger
/// This method is an example of the formal protocol implementation
- (void)printMessage:(NSString *)message
{
    printf("[INFO]: %s\n", [message cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end
```
2. **Informal**: the category on some parent object (usually `NSObject`). Old method of using protocols before `@protocol` was introduced. Inheriting this types of protocols is always optional.
```objective-c
// Usually should be placed in some header file
@interface NSObject (PrintableObject)
- (void)printSelf;
@end

@implementation ConsoleLogger
/// This method is an example of the informal protocol implementation
- (void)printSelf
{
    [self printMessage:@"I'm ConsoleLogger"];
}
@end
```

