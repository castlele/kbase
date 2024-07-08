public final class BubleSortAlgorithmStrategy<Element: Comparable>: SortingStrategy {

    public init() { }

    public func sort(
        _ sequence: [Element],
        type: SortingType
    ) -> [Element] {
        var mutableSequence = sequence

        let compare: (Element, Element) -> Bool = switch type {
        case .descending: { lhs, rhs in rhs > lhs }
        case .ascending: { lhs, rhs in rhs < lhs }
        }

        for i in 0..<mutableSequence.count {
            var swapped = false

            for j in 0..<mutableSequence.count - i - 1 {
                if compare(mutableSequence[j], mutableSequence[j + 1]) {
                    let tmp = mutableSequence[j]

                    mutableSequence[j] = mutableSequence[j + 1]
                    mutableSequence[j + 1] = tmp
                    swapped = true
                }
            }

            guard swapped else { break }
        }

        return mutableSequence
    }
}
