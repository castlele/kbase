#import <Foundation/Foundation.h>

typedef enum LogLevel {
    LogLevelInfo,
    LogLevelError,
} LogLevel;

NSString *interpreteLogLevel(LogLevel level);

@interface BaseLogger: NSObject

- (instancetype)init;

- (void)logMessage:(NSString *)message withLevel:(LogLevel)level;

@end

@interface BaseLogger (Error)
- (void)logError:(NSError *)error;
@end
