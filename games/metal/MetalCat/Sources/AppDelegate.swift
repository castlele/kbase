import Cocoa
import MetalKit

final class AppDelegate: NSObject, NSApplicationDelegate {

    private let windowDelegate = WindowDelegate()
    private var window: NSWindow?
    private lazy var device: MTLDevice = {
        let device = MTLCreateSystemDefaultDevice()

        guard let device else { fatalError("No GPU found") }

        return device
    }()

    func applicationDidFinishLaunching(_ notification: Notification) {
        let windowRect = NSRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 800, height: 600)
        )

        window = NSWindow(
            contentRect: windowRect,
            styleMask: [.resizable, .closable, .titled],
            backing: .buffered,
            defer: true
        )

        let rootViewController = MainViewController()

        window?.contentViewController = rootViewController
        window?.delegate = windowDelegate
        window?.title = "MetalCat"
        window?.center()
        window?.makeKeyAndOrderFront(nil)

        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
    }
}
