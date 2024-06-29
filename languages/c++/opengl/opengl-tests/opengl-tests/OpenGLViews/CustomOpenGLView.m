#import "CustomOpenGLView.h"

#import <OpenGL/gl.h>

@implementation CustomOpenGLView

- (id) initWithFrame:(NSRect)frameRect pixelFormat:(NSOpenGLPixelFormat*)format
{
    self = [super initWithFrame: frameRect];

    if (self != nil) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];

        [nc addObserver: self 
               selector: @selector(_surfaceNeedsUpdate:)
                   name: NSViewGlobalFrameDidChangeNotification
                 object: self];
    }

    return self;
}

- (void) _surfaceNeedsUpdate:(NSNotification*)notification
{
    [self update];
}

static void drawAnObject()
{
    glColor3f(1.0f, 0.85f, 0.35f);
    glBegin(GL_TRIANGLES);
    glVertex3f( 0.0,  0.6, 0.0);
    glVertex3f(-0.2, -0.3, 0.0);
    glVertex3f( 0.2, -0.3, 0.0);
    glEnd();
}

- (void) lockFocus 
{
    NSOpenGLContext *context = [self openGLContext];

    [super lockFocus];
    
    if ([context view] != self) {
        [context setView: self];
    }

    [context makeCurrentContext];
}

- (void) drawRect:(NSRect)dirtyRect 
{
    [_openGLContext makeCurrentContext];
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);

    drawAnObject();

    glFlush();
    [_openGLContext flushBuffer];
}

- (void) viewDidMoveToWindow 
{
    [super viewDidMoveToWindow];

    if ([self window] == nil)
        [_openGLContext clearDrawable];
}

@end
