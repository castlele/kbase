import Cocoa

final class MainViewController: NSViewController {

    private let gameView = GameView(device: Engine.shared.device)

    override func viewDidLoad() {
        super.viewDidLoad()

        Engine.shared.configure(view: gameView)

        configureLayout()
    }

    // MARK: - Private

    private func configureLayout() {
        view.addSubview(gameView)

        gameView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameView.topAnchor.constraint(equalTo: view.topAnchor),
            gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
