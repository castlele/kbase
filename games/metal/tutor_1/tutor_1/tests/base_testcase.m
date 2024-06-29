#import "base_testcase.h"

#import <Foundation/Foundation.h>

@implementation BaseTestCase

- (void)runAllTests
{
    for (void (^func)(void) in [self tests]) {
        func();
    }
}

- (NSArray *)tests
{
    return @[
        ^() {
            [self printHello];
        }
    ];
}

- (void)printHello
{
    NSLog(@"hello world");
}

@end
