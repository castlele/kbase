#import <MetalKit/MetalKit.h>

#import "AssetManager.h"

@interface TrainView : MTKView

@property(strong) AssetManager* assetManager;

- (void) renderModel;

@end
