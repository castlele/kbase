#import "ConsoleLogger.h"

// This Function can be avoided by importing header with the needed category
static void IntroduceLogger(ConsoleLogger *logger)
{

    if ([logger respondsToSelector:@selector(printSelf)]) {
        [logger performSelector:@selector(printSelf)];
    }
}

int main()
{
    ConsoleLogger *logger = [[ConsoleLogger alloc] init];

    IntroduceLogger(logger);
    [logger printMessage:@"Hello, World!"];

    return 0;
}
