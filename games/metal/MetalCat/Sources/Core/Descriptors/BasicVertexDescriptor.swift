import Metal

public struct BasicVertexDescriptor: VertexDescriptor {

    public let vertexDescriptor: MTLVertexDescriptor

    init() {
        let vertexDescriptor = MTLVertexDescriptor()

        // Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0

        // Color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = Color4D.size

        vertexDescriptor.layouts[0].stride = Vertex.stride

        self.vertexDescriptor = vertexDescriptor
    }
}
