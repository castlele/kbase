#import <MetalKit/MetalKit.h>

id<MTLRenderPipelineState> createPipeLineState(id<MTLLibrary> lib, MTLPixelFormat pf, MTLVertexDescriptor *vd,
                                               NSString *vertexFunc, NSString *fragmentFunc,
                                               NSError *err);
