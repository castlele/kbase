import DesignPatterns
import XCTest

final class StrategyTest: XCTestCase {

    func testBubbleSortingStrategyDescending() {
        let sortingStrategy = BubleSortAlgorithmStrategy<Int>()
        let array = [2, 5, 1, 4, 3, 12, 11, 6, 10, 20]
        let context = IntArrayContext(strategy: sortingStrategy)

        let sortedArray = context.sort(array, type: .descending)

        XCTAssertEqual(array.sorted(by: >), sortedArray)
    }

    func testBubbleSortingStrategyAscending() {
        let sortingStrategy = BubleSortAlgorithmStrategy<Int>()
        let array = [2, 5, 1, 4, 3, 12, 11, 6, 10, 20]
        let context = IntArrayContext(strategy: sortingStrategy)

        let sortedArray = context.sort(array, type: .ascending)

        XCTAssertEqual(array.sorted(by: <), sortedArray)
    }

    func testBubbleSortingStrategyNSquared() {
        let sortingStrategy = BubleSortAlgorithmStrategy<Int>()
        let array = [20, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        let context = IntArrayContext(strategy: sortingStrategy)

        let sortedArray = context.sort(array, type: .ascending)

        XCTAssertEqual(array.sorted(by: <), sortedArray)
    }
}

