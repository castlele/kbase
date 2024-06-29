import MetalKit

final public class Engine {

    public static let shared = Engine()

    public let device: MTLDevice
    public let commandQueue: MTLCommandQueue

    private lazy var shaderLibrary = ShaderLibrary.initialize(
        withDevice: device
    )
    private lazy var vertexDescriptorLibrary = VertexDescriptorLibrary.shared
    private lazy var renderPipelineDescriptorLibrary = {
        RenderPipelineDescriptorLibrary.shared
    }()
    private lazy var renderPipelineStateLibrary = {
        RenderPipelineStateLibrary.shared
    }()

    private init() {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Can't create GPU")
        }

        guard let commandQueue = device.makeCommandQueue() else {
            fatalError("Can't create Command Queue")
        }

        self.device = device
        self.commandQueue = commandQueue
    }

    // MARK: - Public methods

    public func vertex(ofType type: VertexShaderType) -> MTLFunction {
        shaderLibrary.vertex(ofType: type)
    }

    public func fragment(ofType type: FragmentShaderType) -> MTLFunction {
        shaderLibrary.fragment(ofType: type)
    }

    public func descriptor(ofType type: VertexDescriptorType) -> MTLVertexDescriptor {
        vertexDescriptorLibrary.descriptor(ofType: type)
    }

    public func renderPipeline(
        ofType type: RenderPipelineDescriptorType
    ) -> MTLRenderPipelineDescriptor {
        renderPipelineDescriptorLibrary.renderPipeline(ofType: type)
    }

    public func renderPipelineState(
        ofType type: RenderPipelineStateType
    ) -> MTLRenderPipelineState {
        renderPipelineStateLibrary.pipelineState(ofType: type)
    }

    public func configure(view: MTKView) {
        view.clearColor = Preferences.clearColor
        view.colorPixelFormat = Preferences.mainPixelFormat
    }
}
