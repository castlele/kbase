import MetalKit

public final class GameView: MTKView {

    private let renderer: Renderer

    public init(device: MTLDevice) {
        renderer = Renderer()

        super.init(frame: .zero, device: device)

        self.delegate = renderer
    }

    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("init(coder:) is unavailable")
    }
}
