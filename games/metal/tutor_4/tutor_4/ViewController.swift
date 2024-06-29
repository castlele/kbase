import Cocoa
import MetalKit

struct Quad {
    let buffer: MTLBuffer
    
    var vertices: [Float] = [
        -1, 1, 0,
        1, -1, 0,
        -1, -1, 0,
        -1, 1, 0,
        1, 1, 0,
        1, -1, 0
    ]

    init(device: MTLDevice, scale: Float) {
        vertices = vertices.map { $0 * scale }

        guard let vertexBuffer = device.makeBuffer(bytes: &vertices,
                                                   length: MemoryLayout<Float>.stride * vertices.count,
                                                   options: []) else {
            fatalError("Oooops :)))")
        }

        self.buffer = vertexBuffer
    }
}

final class Renderer: NSObject, MTKViewDelegate {

    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    static var library: MTLLibrary!

    var pipelineState: MTLRenderPipelineState

    // MARK: - Init

    init(metalView: MTKView) {
        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue(),
              let library = device.makeDefaultLibrary() else {
            fatalError("Sadness on device creation :`(")
        }

        Renderer.device = device
        Renderer.commandQueue = commandQueue
        Renderer.library = library
        metalView.device = device

        let vertexFunction = library.makeFunction(name: "vertex_main")
        let fragmentFunction = library.makeFunction(name: "fragment_main")

        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[.zero].pixelFormat = metalView.colorPixelFormat

        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)

        } catch {
            fatalError(error.localizedDescription)
        }

        super.init()

        metalView.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1)
        metalView.delegate = self
    }

    // MARK: - Public methods

    func start() {
        // noting here hehe
    }

    // MARK: - MTKViewDelegate

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // empty implementation
    }

    func draw(in view: MTKView) {
        guard let commandBuffer = Renderer.commandQueue.makeCommandBuffer(),
              let descriptor = view.currentRenderPassDescriptor,
              let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            return
        }

        renderEncoder.setRenderPipelineState(pipelineState)
        let quad = createQuad(withScale: 0.8)

        renderEncoder.setVertexBuffer(quad.buffer, offset: .zero, index: .zero)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: .zero, vertexCount: quad.vertices.count)

        renderEncoder.endEncoding()
        guard let drawable = view.currentDrawable else {
            return
        }

        commandBuffer.present(drawable)
        commandBuffer.commit()
    }

    // MARK: - Private methods

    private func createQuad(withScale scale: Float) -> Quad {
        Quad(device: Self.device, scale: scale)
    }
}

class ViewController: NSViewController {

    private let metalView = MTKView()

    private var renderer: Renderer?

    override func loadView() {
        view = NSView(frame: NSRect(x: 0.0, y: 0.0, width: 1024.0, height: 768.0))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureLayout()

        renderer = Renderer(metalView: metalView)
    }

    private func addViews() {
        view.addSubview(metalView)
    }

    private func configureLayout() {
        metalView.frame = view.frame
    }
}
