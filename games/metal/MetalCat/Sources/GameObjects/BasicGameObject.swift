import Metal

public final class BasicGameObject {

    private let vertices: [Vertex] = [
        .init(position: [0, 1, 0], color: [1, 0, 0, 1]),
        .init(position: [1, -1, 0], color: [0, 1, 0, 1]),
        .init(position: [-1, -1, 0], color: [0, 0, 1, 1]),
    ]

    private lazy var vertexBuffer: MTLBuffer = {
        let lenght = Vertex.stride(vertices.count)

        guard let vertexBuffer = Engine.shared.device.makeBuffer(
            bytes: vertices,
            length: lenght
        ) else {
            fatalError("Can't create vertex buffer")
        }

        return vertexBuffer
    }()

    public init() { }

    // MARK: - Public methods

    public func render(_ encoder: MTLRenderCommandEncoder) {
        encoder.setRenderPipelineState(
            Engine.shared.renderPipelineState(ofType: .basic)
        )

        encoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)

        encoder.drawPrimitives(
            type: .triangle,
            vertexStart: 0,
            vertexCount: vertices.count
        )
    }
}
