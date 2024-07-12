struct MinecraftWorld: World {

    private let world: [[Element]]

    init(_ elements: [[Element]]) {
        world = elements
    }

    func get(byPos pos: (Int, Int)) -> Element? {
        let (x, y) = pos

        guard x >= 0, x < world.count, y >= 0, y < world[x].count else {
            return nil
        }

        return world[x][y]
    }
}

