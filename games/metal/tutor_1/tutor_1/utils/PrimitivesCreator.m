#import "PrimitivesCreator.h"

MTKMesh* createCube(id<MTLDevice> device, NSError *err)
{
    MTKMeshBufferAllocator *allocator = [[MTKMeshBufferAllocator alloc] initWithDevice:device];
    MDLMesh *mdlMesh = [[MDLMesh alloc] initBoxWithExtent:vector3(0.8f, 0.8f, 0.8f)
                                                 segments:vector3((uint)1, (uint)1, (uint)1)
                                            inwardNormals:FALSE
                                             geometryType:MDLGeometryTypeTriangles
                                                allocator:allocator];

    return [[MTKMesh alloc] initWithMesh:mdlMesh device:device error:&err];
}

MTKMesh* createTrain(id<MTLDevice> device, NSError *err) {
    MTKMeshBufferAllocator *allocator = [[MTKMeshBufferAllocator alloc] initWithDevice:device];
    MTLVertexDescriptor *vertexDescriptor = [MTLVertexDescriptor new];
    vertexDescriptor.attributes[0].format = MTLVertexFormatFloat3;
    vertexDescriptor.attributes[0].offset = 0;
    vertexDescriptor.attributes[0].bufferIndex = 0;
    vertexDescriptor.layouts[0].stride = sizeof(float) * 3;


    MDLVertexDescriptor *meshDescriptor = MTKModelIOVertexDescriptorFromMetal(vertexDescriptor);
    meshDescriptor.attributes[0].name = MDLVertexAttributePosition;

    NSURL *assetURL = [[NSBundle mainBundle] URLForResource:@"train" withExtension:@"obj"];
    MDLAsset *asset = [[MDLAsset alloc] initWithURL:assetURL
                                   vertexDescriptor:meshDescriptor
                                    bufferAllocator:allocator];

    MDLMesh *mdlMesh = (MDLMesh*)[asset childObjectsOfClass:[MDLMesh class]].firstObject;

    return [[MTKMesh alloc] initWithMesh:mdlMesh device:device error:&err];
}
