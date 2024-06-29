import Foundation

var name = ""

func assign(str: String, queue: DispatchQueue) {
    queue.async {
        name = str
    }
    print(name)
}

func add(str: String, queue: DispatchQueue) {
    queue.async {
        name += str
    }
    print(name)
}

func main() -> Int {
    let main = DispatchQueue.main
    let global = DispatchQueue.global(qos: .background)

    assign(str: "Man", queue: main)
    assign(str: " on the", queue: global)
    add(str: " Moon", queue: main)

    print(name)

    return 0
}

while main() != 0 { }
