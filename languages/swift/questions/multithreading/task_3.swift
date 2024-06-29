import Foundation

class CounterService {
    var counter = 0

    func incrementCounter() {
        DispatchQueue.global().async {
            for _ in 0..<1_000 {
                self.counter += 1
            }
        }
    }

    func decrementCounter() {
        DispatchQueue.global().async {
            for _ in 0..<1_000 {
                self.counter -= 1
            }
        }
    }

    func printCounter() {
        DispatchQueue.global().async {
            print("Counter value: \(self.counter)")
        }
    }
}

let service = CounterService()
service.incrementCounter()
service.decrementCounter()
service.printCounter()

// Questions:
// 1. Что выведет в консоль?
// Everytime different resoults

// 2. Каким образом можно изменить код, чтобы гарантировать последовательное выполнение операций над counter?
// Different kinds of synchonizations

class SyncCounterService: CounterService {
    override var counter: Int {
        get {
            _counter
        }
        set {
            queue.async {
                self._counter = newValue
            }
        }
    }

    private let queue = DispatchQueue(label: "SyncCounterService")
    private var _counter: Int = 0
}

let syncService = SyncCounterService()
syncService.incrementCounter()
syncService.decrementCounter()
syncService.printCounter()
