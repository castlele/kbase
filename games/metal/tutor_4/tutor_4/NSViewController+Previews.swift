import SwiftUI

public extension NSViewController {

    private struct Preview: NSViewControllerRepresentable {
        let viewController: NSViewController

        func makeNSViewController(context: Context) -> NSViewController {
            viewController
        }

        func updateNSViewController(_ nsViewController: NSViewController, context: Context) {
            //
        }
    }

    func showPreview() -> some View {
        Preview(viewController: self)
    }
}
