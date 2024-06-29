#import "ViewController.h"
#import <OpenGL/OpenGL.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = true;
    self.view.layer.backgroundColor = [[NSColor redColor] CGColor];
}

@end
