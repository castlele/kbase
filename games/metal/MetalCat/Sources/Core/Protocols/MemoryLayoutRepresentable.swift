import Foundation

public protocol MemoryLayoutRepresentable {
    static var size: Int { get }
    static var stride: Int { get }
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension MemoryLayoutRepresentable {

    public static var size: Int {
        MemoryLayout<Self>.size
    }

    public static var stride: Int {
        MemoryLayout<Self>.stride
    }

    public static func size(_ count: Int) -> Int {
        Self.size * count
    }

    public static func stride(_ count: Int) -> Int {
        Self.stride * count
    }
}
