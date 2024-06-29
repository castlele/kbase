import Metal

final class RenderPipelineDescriptorLibrary {

    typealias Key = RenderPipelineDescriptorType
    typealias Value = RenderPipelineDescriptor

    public static let shared = RenderPipelineDescriptorLibrary()

    private var renderPipelineDescriptors: [Key: Value] = [:]

    private init() {
        createDescriptors()
    }

    // MARK: - Public methods

    func renderPipeline(ofType type: Key) -> MTLRenderPipelineDescriptor {
        guard let descriptor = renderPipelineDescriptors[type] else {
            fatalError("No render pipeline descriptor of type: \(type)")
        }

        return descriptor.renderPipelineDescriptor
    }

    // MAKR: - Private methods

    private func createDescriptors() {
        renderPipelineDescriptors[.basic] = BasicRenderPipelineDescriptor()
    }
}
