#import "base_testcase.h"

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    BaseTestCase *tc = [[BaseTestCase alloc] init];
    [tc runAllTests];
    return NSApplicationMain(argc, argv);
}
