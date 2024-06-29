import Foundation

let max = 10000000

var counter = Int()
let group = DispatchGroup()

func countDown() {
    group.enter()
    for _ in 0..<max {
        counter += 1
    }
    group.leave()
}

func main() {
    DispatchQueue.global().async {
        countDown()
    }
    countDown()

    group.notify(queue: .main) {
        print("Final result is: \(counter)")
    }
}

main()
dispatchMain()
