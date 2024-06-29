import Metal

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {

    public var renderPipelineDescriptor: MTLRenderPipelineDescriptor

    init() {
        let pipelineDescriptor = MTLRenderPipelineDescriptor()

        pipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        pipelineDescriptor.vertexFunction = Engine.shared.vertex(ofType: .basic)
        pipelineDescriptor.fragmentFunction = Engine.shared.fragment(ofType: .basic)
        pipelineDescriptor.vertexDescriptor = Engine.shared.descriptor(ofType: .basic)

        self.renderPipelineDescriptor = pipelineDescriptor
    }
}
