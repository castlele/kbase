---
tags:
  - ios/objc
---
Category is a simple form of `extensions` in swift.

Main advantage of categories is that you can extend any class in your program (even that has no source). However, there is a downside. You cannot safely override methods already defined by the class itself or another category:

```objective-c
@implementation BaseLogger
- (void)logError:(NSError *)error
{
    [self logMessage:error.localizedDescription withLevel:LogLevelError];
}
@end

@implementation ConsoleLogger
- (void)logError:(NSError *)error {
    NSLog(@"I'm dumb");
}
@end

@implementation ConsoleLogger (Error)
- (void)logError:(NSError *)error {
    // Explicitly override method
    [super logError:error];
}
@end

ConsoleLogger *l = [[ConsoleLogger alloc] init];
// This line will call category's method with `super` call
[l logError:[CustomError new]];
```