#import "BaseLogger.h"

NSString *interpreteLogLevel(LogLevel level)
{
    switch (level) {
    case LogLevelInfo: return @"INFO";
    case LogLevelError: return @"ERROR";
    }
}

@implementation BaseLogger

- (instancetype)init
{
    self = [super init];

    return self;
}

- (void)logMessage:(NSString *)message withLevel:(LogLevel)level
{
    NSString *stringLevel = interpreteLogLevel(level);

    NSLog(@"[%@]: %@", stringLevel, message);
}

@end

@implementation BaseLogger (Error)

- (void)logError:(NSError *)error
{
    [self logMessage:error.localizedDescription withLevel:LogLevelError];
}

@end
