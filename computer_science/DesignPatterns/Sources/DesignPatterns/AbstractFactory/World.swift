public protocol World {
    func get(byPos pos: (Int, Int)) -> Element?
}
