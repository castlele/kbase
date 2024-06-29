#import "AppDelegate.h"

#import <Cocoa/Cocoa.h>
#import <OpenGL/gl.h>

#define GL_SILENCE_DEPRECATION

int main(int argc, const char * argv[]) {
    NSApplication *app = NSApplication.sharedApplication;
    AppDelegate *delegate = [[AppDelegate alloc] init];

    app.delegate = delegate;

    glViewport(0, 0, 800, 600);

    return NSApplicationMain(argc, argv);
}
