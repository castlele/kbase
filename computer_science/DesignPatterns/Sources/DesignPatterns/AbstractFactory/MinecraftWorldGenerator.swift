public enum ElementType {
    case player
    case block
}

public protocol Element {
    var type: ElementType { get }
}

public protocol Player: Element {
}

public protocol Block: Element {
    var blockType: String { get }
}

public protocol WorldFactory {
    func createWorld(with elements: [[Element]]) -> World
    func createPlayer() -> Player
    func createBlock(ofType type: String) -> Block
}

public final class MinecraftWorldGenerator {

    private let map: [[String]]
    private let spriteFactory: WorldFactory

    public init(map: [[String]], spriteFactory: WorldFactory) {
        self.map = map
        self.spriteFactory = spriteFactory
    }

    public func generate() -> World {
        let elements = map.map { row in
            row.map { col in
                switch col {
                case "P": spriteFactory.createPlayer()
                case "x": spriteFactory.createBlock(ofType: "grass")
                case "W": spriteFactory.createBlock(ofType: "leaves")
                default: spriteFactory.createBlock(ofType: "air")
                }
            }
        }

        return spriteFactory.createWorld(with: elements)
    }
}
