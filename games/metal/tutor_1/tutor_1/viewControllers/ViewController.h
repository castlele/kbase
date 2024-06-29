#import <Cocoa/Cocoa.h>

#import "AssetManager.h"
#import "MetalView.h"
#import "Renderer.h"
#import "InitializableViewController.h"

@class TrainView, MTKView;

@interface ViewController : NSViewController <InitializableViewController>

@property(copy) MetalView *metalView;
@property(copy) NSButton *changeMeshButton;
@property(copy) Renderer *renderer;
@property(strong) AssetManager *assetManager;

- (void) updateMesh;

@end
