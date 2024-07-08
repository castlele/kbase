public final class IntArrayContext<Strategy: SortingStrategy>: SortingContext where Strategy.S == [Int] {

    private let strategy: Strategy

    public init(strategy: Strategy) {
        self.strategy = strategy
    }

    public func sort(
        _ sequence: [Int],
        type: SortingType
    ) -> [Int] {
        strategy.sort(sequence, type: type)
    }
}
