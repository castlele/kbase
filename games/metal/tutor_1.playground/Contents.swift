import PlaygroundSupport
import MetalKit

guard let device = MTLCreateSystemDefaultDevice() else {
    fatalError("Help me find GPU")
}

let frame = CGRect(origin: .zero,
                   size: CGSize(width: 600, height: 600))
let view = MTKView(frame: frame, device: device)
view.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1)

let allocator = MTKMeshBufferAllocator(device: device)
let meshModel = MDLMesh(sphereWithExtent: [0.75, 0.75, 0.75],
                        segments: [100, 100],
                        inwardNormals: false,
                        geometryType: .triangles,
                        allocator: allocator)
let mesh = try MTKMesh(mesh: meshModel, device: device)

guard let commandQueue = device.makeCommandQueue() else {
    fatalError("Help me create a command queue")
}

let shader = """
#include <metal_stdlib>

using namespace metal;

struct VertexIn {
    float4 position [[attribute(0)]];
};

vertex float4 vertex_main(const VertexIn vertex_in [[stage_in]]) {
    return vertex_in.position;
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}
"""

let library = try device.makeLibrary(source: shader, options: nil)
let vertexFunction = library.makeFunction(name: "vertex_main")
let fragmentFunction = library.makeFunction(name: "fragment_main")

let pipelineDescriptor = MTLRenderPipelineDescriptor()
pipelineDescriptor.colorAttachments[0].pixelFormat = .rgba8Unorm
pipelineDescriptor.vertexFunction = vertexFunction
pipelineDescriptor.fragmentFunction = fragmentFunction
pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)
let pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)

guard let commandBuffer = commandQueue.makeCommandBuffer(),
      let renderPassDescriptor = view.currentRenderPassDescriptor,
      let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
    fatalError("FREAKING NEED HELP")
}

renderEncoder.setRenderPipelineState(pipelineState)
renderEncoder.setVertexBuffer(mesh.vertexBuffers[0].buffer, offset: .zero, index: .zero)

guard let submesh = mesh.submeshes.first else {
    fatalError("HELP :(")
}

renderEncoder.drawIndexedPrimitives(type: .triangle,
                                    indexCount: submesh.indexCount,
                                    indexType: submesh.indexType,
                                    indexBuffer: submesh.indexBuffer.buffer,
                                    indexBufferOffset: .zero)

renderEncoder.endEncoding()

guard let drawable = view.currentDrawable else {
    fatalError(":(((((")
}

commandBuffer.present(drawable)
commandBuffer.commit()

PlaygroundPage.current.liveView = view
