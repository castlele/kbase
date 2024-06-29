import Metal

final class RenderPipelineStateLibrary {

    typealias Key = RenderPipelineStateType
    typealias Value = RenderPipelineStateDescriptor

    public static let shared = RenderPipelineStateLibrary()

    private var renderPipelineStates: [Key: Value] = [:]

    private init() {
        createRenderPipelineStates()
    }

    // MARK: - Public methods

    public func pipelineState(ofType type: Key) -> MTLRenderPipelineState {
        guard let pipelineState = renderPipelineStates[type] else {
            fatalError("No pipeline state found of type: \(type)")
        }

        return pipelineState.renderPipelineState
    }

    // Private methods

    private func createRenderPipelineStates() {
        renderPipelineStates[.basic] = BasicRenderPipelineStateDescriptor()
    }
}
