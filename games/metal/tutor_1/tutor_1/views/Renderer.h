#import <Foundation/Foundation.h>
#import <MetalKit/MetalKit.h>
#import "Mesh.h"

@interface Renderer : NSObject <MTKViewDelegate>

@property(class) id<MTLDevice> device;
@property(class) id<MTLCommandQueue> commandQueue;
@property(class) id<MTLLibrary> library;

@property(copy) MTKMesh *mesh;
@property(strong) id<MTLBuffer> vertexBuffer;
@property(strong) id<MTLRenderPipelineState> pipelineState;
@property(assign) MTLPixelFormat pixelFormat;

- (instancetype) initWithMetalView:(MTKView *)view;

- (int) setMeshWithBlock:(MTKMesh *(^)(id<MTLDevice>, NSError *))block;
- (void) showQuadMesh;
- (int) setPipelineStateWithBlock:(id<MTLRenderPipelineState> (^)(id<MTLLibrary>,
                                                                  MTLPixelFormat,
                                                                  MTLVertexDescriptor *,
                                                                  NSError *))block;

@end
