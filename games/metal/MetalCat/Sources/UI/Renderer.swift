import MetalKit

public final class Renderer: NSObject {

    private let gameObject = BasicGameObject()
}

// MARK: - MTKViewDelegate

extension Renderer: MTKViewDelegate {

    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }

    public func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
            let renderPassDescriptor = view.currentRenderPassDescriptor else {
            return
        }

        let commandBuffer = Engine.shared.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(
            descriptor: renderPassDescriptor
        )

        if let renderCommandEncoder {
            gameObject.render(renderCommandEncoder)
        }

        renderCommandEncoder?.endEncoding()

        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
