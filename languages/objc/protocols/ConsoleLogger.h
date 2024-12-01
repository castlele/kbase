#import <Foundation/Foundation.h>
#import "PrinterProtocol.h"

@interface ConsoleLogger : NSObject <PrinterProtocol>

- (instancetype)init;

@end
