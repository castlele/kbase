import Foundation

class DownloadService {
    func downloadData(from urls: [String]) {
        let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)

        for url in urls {
            queue.async {
                guard let data = self.download(from: url) else {
                    print("Error downloading data from \(url)")
                    return
                }
                self.processDownloadedData(data)
            }
        }
    }

    func download(from url: String) -> Data? {
        // Download data from the given URL
        url.forEach { print($0) }
        return nil
    }

    func processDownloadedData(_ data: Data) {
        // Process the downloaded data
        // ...
    }
}

let service = DownloadService()

service.downloadData(from: ["hello", "world", "and", "other", "people"])

// Questions:
// 1. Спросить что не так?
// 2. Как исправить?
