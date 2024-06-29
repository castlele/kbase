import Cocoa
import PlaygroundSupport

func time(_ block: @escaping () -> Void) -> TimeInterval {
    let time = Date()

    block()

    return Date().timeIntervalSince(time)
}

let queue = DispatchQueue(label: "Hello")

func count() {
    print("Stared counting")
    for _ in 0..<20000 {

    }
    print("Stopped counting")
}

let two = time {
    queue.async {
        count()
    }
}

let one = time {
    count()
}

print(one)
print(two)
