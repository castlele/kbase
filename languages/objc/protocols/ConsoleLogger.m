#import "ConsoleLogger.h"
#import "PrintableObject.h"

#include <stdio.h>

@implementation ConsoleLogger

- (instancetype)init
{
    self = [super init];

    return self;
}

/// This method is an example of the formal protocol implementation
- (void)printMessage:(NSString *)message
{
    printf("[INFO]: %s\n", [message cStringUsingEncoding:NSUTF8StringEncoding]);
}

/// This method is an example of the informal protocol implementation
- (void)printSelf
{
    [self printMessage:@"I'm ConsoleLogger"];
}

@end
