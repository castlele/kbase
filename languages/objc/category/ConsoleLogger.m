#import "ConsoleLogger.h"
#import "BaseLogger.h"

#import <Foundation/Foundation.h>
#include <stdio.h>

@implementation ConsoleLogger

- (void)logMessage:(NSString *)message withLevel:(LogLevel)level {
    NSString *stringLevel = interpreteLogLevel(level);

    printf(
        "[%s]: %s\n",
        [stringLevel cStringUsingEncoding:NSUTF8StringEncoding],
        [message cStringUsingEncoding:NSUTF8StringEncoding]
    );
}

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
