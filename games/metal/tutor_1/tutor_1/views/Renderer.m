#import "Renderer.h"

@implementation Renderer

{
    Quad *quad;
}

static id<MTLDevice> _device = nil;
static id<MTLCommandQueue> _commandQueue = nil;
static id<MTLLibrary> _library = nil;

@synthesize mesh, vertexBuffer, pipelineState, pixelFormat;

+ (id<MTLDevice>) device
{
    return _device;
}

+ (void) setDevice:(id<MTLDevice>)device
{
    _device = device;
}

+ (id<MTLCommandQueue>) commandQueue
{
    return _commandQueue;
}

+ (void) setCommandQueue:(id<MTLCommandQueue>)queue
{
    _commandQueue = queue;
}

+ (id<MTLLibrary>) library
{
    return _library;
}

+ (void) setLibrary:(id<MTLLibrary>)lib
{
    _library = lib;
}

// MARK: - Init

- (instancetype) initWithMetalView:(MTKView *)view
{
    Renderer.device = MTLCreateSystemDefaultDevice();
    Renderer.commandQueue = [Renderer.device newCommandQueue];
    Renderer.library = [Renderer.device newDefaultLibrary];

    self = [super init];

    if (self) {
        pixelFormat = view.colorPixelFormat;
        view.device = Renderer.device;
        view.delegate = self;
        // TODO: looks like wrong place to do this
        view.clearColor = MTLClearColorMake(1, 1, 0.8, 1);
    }

    return self;
}

// MARK: - Public methods

- (int) setMeshWithBlock:(MTKMesh *(^)(id<MTLDevice>, NSError *))block
{
    NSError *err;
    mesh = block(Renderer.device, err);

    if (err) {
        NSLog(@"Creating of mesh failed with error: %@", err);
        return 1;
    }

    vertexBuffer = mesh.vertexBuffers[0].buffer;

    return 0;
}

- (void) showQuadMesh
{
    Quad *q = [[Quad alloc] initWithDevice:Renderer.device scale:1];
    self->quad = q;
}

- (int) setPipelineStateWithBlock:(id<MTLRenderPipelineState> (^)(id<MTLLibrary>,
                                                                  MTLPixelFormat,
                                                                  MTLVertexDescriptor *,
                                                                  NSError *))block
{
    MTLVertexDescriptor *vd = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor);
    NSError *err;
    pipelineState = block(Renderer.library, pixelFormat, vd, err);

    if (err) {
        NSLog(@"Creating of pipeline state failed with error: %@", err);
        return 1;
    }

    return 0;
}

// MARK: - MTKViewDelegate conformance

- (void) mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size
{
}

/*
 guard
 let commandBuffer = Renderer.commandQueue.makeCommandBuffer(),
 let descriptor = view.currentRenderPassDescriptor,
 let renderEncoder =
 commandBuffer.makeRenderCommandEncoder(
 descriptor: descriptor) else {
 return
 }
 renderEncoder.setRenderPipelineState(pipelineState)

 // do drawing here

 renderEncoder.endEncoding()
 guard let drawable = view.currentDrawable else {
 return
 }
 commandBuffer.present(drawable)
 commandBuffer.commit()

 */

- (void) drawInMTKView:(MTKView *)view
{

    id<MTLCommandBuffer> commandBuffer = [Renderer.commandQueue commandBuffer];
    MTLRenderPassDescriptor *renderPassDescriptor = [view currentRenderPassDescriptor];
    id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];

    [renderEncoder setRenderPipelineState:pipelineState];
//    [renderEncoder setTriangleFillMode:MTLTriangleFillModeLines];

    bool isQuad = [self drawQuadIfNeeded:renderEncoder];

    if (!isQuad) {
        [renderEncoder setVertexBuffer:vertexBuffer offset:0 atIndex:0];

        for (MTKSubmesh *submesh in mesh.submeshes) {
            [renderEncoder drawIndexedPrimitives:MTLPrimitiveTypeTriangle
                                      indexCount:submesh.indexCount
                                       indexType:submesh.indexType
                                     indexBuffer:submesh.indexBuffer.buffer
                               indexBufferOffset:submesh.indexBuffer.offset];
        }
    }

    [renderEncoder endEncoding];

    [commandBuffer presentDrawable:view.currentDrawable];
    [commandBuffer commit];
}

// MARK: - Private methods

- (BOOL) drawQuadIfNeeded:(id<MTLRenderCommandEncoder>)r
{
    if (self->quad == NULL) {
        return false;
    }

    [r setVertexBuffer:self->quad.buffer offset:0 atIndex:0];
    [r drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:self->quad.vertices.count];
    return true;
}

@end
