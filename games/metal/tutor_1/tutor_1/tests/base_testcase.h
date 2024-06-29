#import <Foundation/Foundation.h>

@interface BaseTestCase : NSObject

- (void)runAllTests;
- (NSArray *)tests;

@end
