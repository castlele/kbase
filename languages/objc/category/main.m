#import "BaseLogger.h"
#import "ConsoleLogger.h"

#import <Foundation/Foundation.h>

@interface CustomError: NSError
@end

@implementation CustomError

- (NSString *)localizedDescription {
    return @"I'm very custom error :)";
}

@end

int main()
{
    BaseLogger *baseLogger = [[BaseLogger alloc] init];

    [baseLogger logMessage:@"Using baseLogger" withLevel:LogLevelInfo];
    [baseLogger logError:[CustomError new]];

    ConsoleLogger *consoleLogger = [[ConsoleLogger alloc] init];

    [consoleLogger logMessage:@"Using consoleLogger" withLevel:LogLevelInfo];
    [consoleLogger logError:[CustomError new]];

    return 0;
}
