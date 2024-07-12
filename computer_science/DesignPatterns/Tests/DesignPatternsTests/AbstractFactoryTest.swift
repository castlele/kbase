import DesignPatterns
import XCTest

final class AbstractFactoryTest: XCTestCase {

    func testCreationOfTheMinecraftWorld() {
        let map = createMap()
        let sut = DefaultMinecraftFactory()
        let generator = MinecraftWorldGenerator(map: map, spriteFactory: sut)

        let world = generator.generate()

        XCTAssertEqual(world.get(byPos: (1, 4))?.type, .player)
    }

    func testCreationOfTheTerrariaWorld() {
        /* ... */
    }

    private func createMap() -> [[String]] {
        [
            ["" , "" , "" , "" , "" ],
            ["" , "W", "" , "" , "P"],
            ["W", "W", "W", "" , "x"],
            ["" , "|", "" , "x", "x"],
            ["x", "x", "x", "x", "x"],
        ]
    }
}
