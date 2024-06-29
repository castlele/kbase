import Foundation

var thread: pthread_t? = nil

func someFunc(_ ptr: UnsafeMutableRawPointer) -> UnsafeMutableRawPointer? {
    for i in 0..<5 {
        print(i)
    }

    return nil
}

pthread_create(&thread, nil, someFunc(_:), nil)

someFunc(UnsafeMutableRawPointer.allocate(byteCount: 0, alignment: 0))

pthread_join(thread!, nil)
