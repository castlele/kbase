import Foundation

class Stack<T> {

    private var storage = [T]()

    func push(_ value: T) {
        storage.append(value)
    }

    @discardableResult
    func pop() -> T? {
        storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        String(describing: storage)
    }
}

class LockStack<T>: Stack<T> {

    private let lock = NSLock()

    override func push(_ value: T) {
        lock.lock()
        super.push(value)
        lock.unlock()
    }

    @discardableResult
    override func pop() -> T? {
        defer { lock.unlock() }

        lock.lock()

        return super.pop()
    }
}


class SyncStack<T>: Stack<T> {

    private let queue = DispatchQueue(label: "sync.stack")

    override func push(_ value: T) {
        queue.sync {
            super.push(value)
        }
    }

    @discardableResult
    override func pop() -> T? {
        queue.sync {
            super.pop()
        }
    }
}

actor ActorStack<T> {

    private var storage = [T]()

    func push(_ value: T) {
        storage.append(value)
    }

    @discardableResult
    func pop() -> T? {
        storage.popLast()
    }
}

extension ActorStack {
    var description: String {
        String(describing: storage)
    }
}
