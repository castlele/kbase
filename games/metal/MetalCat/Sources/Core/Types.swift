import Foundation

public struct Vertex: MemoryLayoutRepresentable {
    let position: SIMD3<Float>
    let color: Color4D
}

public typealias Color4D = SIMD4<Float>

extension Color4D: MemoryLayoutRepresentable { }
