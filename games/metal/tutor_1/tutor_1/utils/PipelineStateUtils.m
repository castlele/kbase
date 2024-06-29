#import "PipelineStateUtils.h"
#import "Renderer.h"

id<MTLRenderPipelineState> createPipeLineState(id<MTLLibrary> lib, MTLPixelFormat pf, MTLVertexDescriptor *vd,
                                               NSString *vertexFunc, NSString *fragmentFunc,
                                               NSError *err) {

    id<MTLFunction> vertex = [lib newFunctionWithName:vertexFunc];
    id<MTLFunction> fragment = [lib newFunctionWithName:fragmentFunc];

    MTLRenderPipelineDescriptor *pd = [[MTLRenderPipelineDescriptor alloc] init];
    pd.vertexFunction = vertex;
    pd.fragmentFunction = fragment;
    pd.colorAttachments[0].pixelFormat = pf;
    pd.vertexDescriptor = vd;

    return [Renderer.device newRenderPipelineStateWithDescriptor:pd error:&err];
}
