#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@property NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSRect windowSize = CGRectMake(0, 0, 800, 600);
    self.window = [[NSWindow alloc] initWithContentRect:windowSize
                                              styleMask:NSWindowStyleMaskClosable | NSWindowStyleMaskTitled
                                                backing:NSBackingStoreBuffered
                                                  defer:false];
    self.window.contentViewController = [[ViewController alloc] init];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

@end
