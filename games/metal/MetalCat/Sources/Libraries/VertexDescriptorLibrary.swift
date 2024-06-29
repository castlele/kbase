import Metal

final class VertexDescriptorLibrary {

    public static let shared = VertexDescriptorLibrary()

    private var vertexDescriptors: [VertexDescriptorType: VertexDescriptor] = [:]

    public init() {
        createDescriptors()
    }

    public func descriptor(ofType type: VertexDescriptorType) -> MTLVertexDescriptor {
        guard let descriptor = vertexDescriptors[type] else {
            fatalError("No vertex descriptor of type: \(type)")
        }

        return descriptor.vertexDescriptor
    }

    // MARK: - Private methods

    private func createDescriptors() {
        vertexDescriptors[.basic] = BasicVertexDescriptor()
    }
}
