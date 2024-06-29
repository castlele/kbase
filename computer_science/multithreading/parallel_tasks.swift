import Foundation

func main() {
    dispatchWork {
        operationQueue {
            Task {
                await asyncAwait {
                    print("All tasks are done!")
                    exit(0)
                }
            }
        }
    }

    dispatchMain()
}

func dispatchWork(completion: () -> Void) {
    print("Running parallel tasks with GCD")
    let start = DispatchTime.now()
    let workers: Int = 8
    let numbers: [Int] = Array(repeating: 1, count: 1_000_000_000)

    var sum = 0
    DispatchQueue.concurrentPerform(iterations: workers) { index in
        let start = index * numbers.count / workers
        let end = (index + 1) * numbers.count / workers
        print("Worker #\(index), items: \(numbers[start..<end].count)")

        sum += numbers[start..<end].reduce(0, +)
    }

    print("GCD Sum: \(sum)")
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("Time spent: \(timeInterval)")
    print("Ended up running parallel tasks with GCD")
    completion()
}

func operationQueue(completion: () -> Void) {
    print("Running parallel tasks with Operation Queue")
    let start = DispatchTime.now()
    let workers: Int = 8
    let numbers: [Int] = Array(repeating: 1, count: 1_000_000_000)

    let operationQueue = OperationQueue()
    operationQueue.maxConcurrentOperationCount = 4

    var sum = 0
    for index in 0..<workers {
        let operation = BlockOperation {
            let start = index * numbers.count / workers
            let end = (index + 1) * numbers.count / workers
            print("Worker #\(index), items: \(numbers[start..<end].count)")

            sum += numbers[start..<end].reduce(0, +)
        }
        operationQueue.addOperation(operation)
    }

    operationQueue.waitUntilAllOperationsAreFinished()

    print("Operation Queue sum: \(sum)")
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("Time spent: \(timeInterval)")
    print("Ended up running parallel tasks with Operation Queue")
    completion()
}

func asyncAwait(completion: () -> Void) async {
    print("Running parallel tasks with async await")
    let start = DispatchTime.now()
    let workers: Int = 8
    let numbers: [Int] = Array(repeating: 1, count: 1_000_000_000)

    let sum = await withTaskGroup(of: Int.self) { group in
        for i in 0..<workers {
            group.addTask {
                let start = i * numbers.count / workers
                let end = (i + 1) * numbers.count / workers
                return numbers[start..<end].reduce(0, +)
            }
        }

        var summary = 0
        for await result in group {
            summary += result
        }
        return summary
    }

    print("Async await sum: \(sum)")
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("Time spent: \(timeInterval)")
    print("Ended up running parallel tasks with async await")
    completion()
}

main()
