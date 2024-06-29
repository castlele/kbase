#import "TrainView.h"

@implementation TrainView

- (void) renderModel
{
    MTKMeshBufferAllocator *allocator = [[MTKMeshBufferAllocator alloc] initWithDevice:self.device];
    MDLMesh *meshModel = [MDLMesh alloc];
    NSURL *assetURL = [[NSBundle mainBundle] URLForResource:@"train" withExtension:@"obj"];

    MTLVertexDescriptor *vertexDescriptor = [MTLVertexDescriptor new];
    vertexDescriptor.attributes[0].format = MTLVertexFormatFloat3;
    vertexDescriptor.attributes[0].offset = 0;
    vertexDescriptor.attributes[0].bufferIndex = 0;
    vertexDescriptor.layouts[0].stride = sizeof(float) * 3;
    MDLVertexDescriptor *meshDescriptor = MTKModelIOVertexDescriptorFromMetal(vertexDescriptor);
    meshDescriptor.attributes[0].name = MDLVertexAttributePosition;
    MDLAsset *asset = [[MDLAsset alloc] initWithURL:assetURL
                                   vertexDescriptor:meshDescriptor
                                    bufferAllocator:allocator];
    meshModel = (MDLMesh*)[asset childObjectsOfClass:[MDLMesh class]].firstObject;

    MTKMesh *mesh = [[MTKMesh alloc] initWithMesh:meshModel device:self.device error:NULL];

    id<MTLCommandQueue> commandQueue = [self.device newCommandQueue];
    id<MTLLibrary> library = [self.device newDefaultLibrary];

    id<MTLFunction> vertexFunc = [library newFunctionWithName:@"vertex_main"];
    id<MTLFunction> fragmentFunc = [library newFunctionWithName:@"fragment_main"];

    MTLRenderPipelineDescriptor *descriptor = [[MTLRenderPipelineDescriptor alloc] init];
    descriptor.colorAttachments[0].pixelFormat = MTLPixelFormatBGRA8Unorm;
    descriptor.vertexFunction = vertexFunc;
    descriptor.fragmentFunction = fragmentFunc;
    descriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor);

    id<MTLRenderPipelineState> pipelineState = [self.device newRenderPipelineStateWithDescriptor:descriptor error:NULL];
    id<MTLCommandBuffer> commandBuffer = [commandQueue commandBuffer];
    MTLRenderPassDescriptor *renderPassDescriptor = [self currentRenderPassDescriptor];
    id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];

    [renderEncoder setRenderPipelineState:pipelineState];
    [renderEncoder setVertexBuffer:mesh.vertexBuffers[0].buffer offset:0 atIndex:0];
    [renderEncoder setTriangleFillMode:MTLTriangleFillModeLines];
    for (MTKSubmesh *submesh in mesh.submeshes) {
        [renderEncoder drawIndexedPrimitives:MTLPrimitiveTypeTriangle
                                  indexCount:submesh.indexCount
                                   indexType:submesh.indexType
                                 indexBuffer:submesh.indexBuffer.buffer
                           indexBufferOffset:submesh.indexBuffer.offset];
    }

    [renderEncoder endEncoding];

    id<CAMetalDrawable> drawable = self.currentDrawable;

    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
}

@end
