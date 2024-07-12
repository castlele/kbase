import Foundation

class ClassA {
    private let queue = DispatchQueue(label: "task_1")

    func perform() {
        print(1)

        queue.sync {
            print(2)

            queue.sync {
                print(3)
            }

            queue.async {
                print(4)
            }

            print(5)
        }

        print(6)
    }
}

let obj = ClassA()
obj.perform()

// Questions:
// 1. Какие числа будут выведены на консоль при выполнении кода в том порядке, в котором они будут напечатаны?
// 1 2

// 2. Чем отличаются методы sync и async при работе с DispatchQueue?
// sync will execute immediately

// 3. Какие проблемы могут возникнуть из-за вложенного синхронного вызова (queue.sync внутри другого queue.sync)?
// Therefore, the task that's running on the serial queue is blocked waiting for the task that's running on this queue to complete. Hence, deadlock

// 4. Как это можно избежать?
// make queue concurrent or use async or use other queue
