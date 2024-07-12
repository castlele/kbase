public final class DefaultMinecraftFactory: WorldFactory {
    public init() { }

    public func createWorld(with elements: [[Element]]) -> World {
        MinecraftWorld(elements)
    }

    public func createPlayer() -> Player {
        Steve()
    }

    public func createBlock(ofType type: String) -> Block {
        switch type {
        case "air": AirMinecraftBlock()
        case "leaves": LeavesMinecraftBlock()
        case "grass": GrassMinecraftBlock()
        default: fatalError("Unknown block type: \(type)")
        }
    }
}
