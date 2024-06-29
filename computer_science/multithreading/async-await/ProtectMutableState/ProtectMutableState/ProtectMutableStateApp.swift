import SwiftUI

@main
struct ProtectMutableStateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let image = NSImageView()

                    DispatchQueue.global(qos: .background).async {
                        image.image = NSImage(named: "baton")
                    }
                }
            //                .onAppear {
//                    let sim = DispatchSemaphore(value: 1)
//                    var array = [Int]()
//
//                    DispatchQueue.concurrentPerform(iterations: 1000) { elm in
//                        sim.wait()
//                        array.append(elm)
//                        sim.signal()
//                    }
//
//                    print(array)
//                }
//                .onAppear {
//                    let concurrentQueue = DispatchQueue(label: "com.gcd.dispatchBarrier", attributes: .concurrent)
//
//                    for value in 1...5 {
//                        concurrentQueue.async() {
//                            print("async \(value)")
//                        }
//                    }
//
//                    for value in 6...10 {
//                        concurrentQueue.async(flags: .barrier) {
//                            print("barrier \(value)")
//                        }
//                    }
//
//                    for value in 11...15 {
//                        concurrentQueue.sync() {
//                            print("sync \(value)")
//                        }
//                    }
//                }
//                .onAppear {
//                    print("Stack Test")
//                    time {
//                        let stack = Stack<Int>()
//
//                        for i in 0..<5 {
//                            stack.push(i)
//                        }
//
//                        for _ in 0..<5 {
//                            stack.pop()
//                        }
//
//                        print(stack)
//                    }
//                }
//                .onAppear {
//                    print("SyncStack Test")
//                    time {
//                        let stack = SyncStack<Int>()
//
//                        Task.detached {
//                            for i in 0..<5 {
//                                stack.push(i)
//                            }
//
//                            for _ in 0..<5 {
//                                stack.pop()
//                            }
//                        }
//
//                        Task.detached {
//                            for i in 0..<5 {
//                                stack.push(i)
//                            }
//
//                            for _ in 0..<5 {
//                                stack.pop()
//                            }
//                        }
//
//                        print(stack)
//                    }
//                }
//                .onAppear {
//                    print("LockStack Test")
//                    time {
//                        let stack = LockStack<Int>()
//
//                        Task.detached {
//                            for i in 0..<5 {
//                                stack.push(i)
//                            }
//
////                            for _ in 0..<5 {
////                                stack.pop()
////                            }
//                        }
//
//                        Task.detached {
//                            for i in 5..<10 {
//                                stack.push(i)
//                            }
//
////                            for _ in 0..<5 {
////                                stack.pop()
////                            }
//                        }
//
//                        print(stack)
//                    }
//                }
//                .onAppear {
//                    print("ActorStack Test")
//                    time {
//
//                        Task.detached {
//                            await time {
//                                let stack = ActorStack<Int>()
//                                for i in 0..<5 {
//                                    await stack.push(i)
//                                }
//
//                                for _ in 0..<5 {
//                                    await stack.pop()
//                                }
//
//                                print(await stack.description)
//                            }
//                        }
//                        Task.detached {
//                            await time {
//                                let stack = ActorStack<Int>()
//                                for i in 0..<5 {
//                                    await stack.push(i)
//                                }
//
//                                for _ in 0..<5 {
//                                    await stack.pop()
//                                }
//
//                                print(await stack.description)
//                            }
//                        }
//                    }
//                }
        }
    }
}

func time(closure: () async -> Void) async {
    let startTime = DispatchTime.now()

    await closure()


    let endTime = DispatchTime.now()
    let executionTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let milliseconds = Double(executionTime) / 1_000_000

    print("Execution time: \(milliseconds) ms")
}


func time(closure: () -> Void) {
    let startTime = DispatchTime.now()

    closure()

    let endTime = DispatchTime.now()
    let executionTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let milliseconds = Double(executionTime) / 1_000_000

    print("Execution time: \(milliseconds) ms")
}

