import Foundation

class ClassA {
    private let queue1 = DispatchQueue(label: "queue_1", qos: .utility)
    private let queue2 = DispatchQueue(label: "queue_2", qos: .userInteractive)

    func perform() {
        queue2.async {
            // Perform high priority task
            Array(repeating: 0, count: 200)
                .forEach { print($0) }
        }

        queue1.async {
            // Perform low priority task that takes a long time
            Array(repeating: 0, count: 1000)
                .forEach { print($0) }

            self.queue2.sync {
                // Perform additional high priority operations
                Array(repeating: 0, count: 100)
                    .forEach { print($0) }
            }
        }
    }
}

let obj = ClassA()
obj.perform()

// Questions:
// 1. Что не так?
// Can be deadlock on `self.queue2.sync` if hight priority queue2 will be waiting for low priority queue1 and queue1 will be waiting for queue2

// 2. Как исправить?
// async
