import Metal

public struct BasicRenderPipelineStateDescriptor: RenderPipelineStateDescriptor {

    public let renderPipelineState: MTLRenderPipelineState

    init() {
        do {
            let pipelineState = try Engine.shared.device.makeRenderPipelineState(
                descriptor: Engine.shared.renderPipeline(ofType: .basic)
            )

            renderPipelineState = pipelineState

        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
