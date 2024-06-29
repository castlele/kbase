func solution() async {
    let task = Task {
        print(1)
    }

    await task.result

    await withTaskGroup(of: Void.self) { group in
        for
    }
}

Task {
    await solution()
}
