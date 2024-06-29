func asyncFunc() async -> Int {
    await asyncPrint()
    async let nameTask = asyncResult()

    let name = await nameTask

    print(name)

    return 0
}

func asyncResult() async -> String {
    return "World"
}

func asyncPrint() async {
    print("HELLO, ")
}

Task {
    await asyncFunc()
}
