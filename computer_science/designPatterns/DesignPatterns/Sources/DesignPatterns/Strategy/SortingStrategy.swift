public protocol SortingStrategy {

    associatedtype Element
    associatedtype S: Sequence<Element>

    func sort(
        _ sequence: S,
        type: SortingType
    ) -> S
}
