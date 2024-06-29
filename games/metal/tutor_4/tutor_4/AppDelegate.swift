import SwiftUI

@main
struct TutorApp: App {
    var body: some Scene {
        Window("Hello world", id: "123") {
            ViewController()
                .showPreview()
                .frame(width: 1024, height: 768)
        }
        .windowResizability(.contentSize)
    }
}
