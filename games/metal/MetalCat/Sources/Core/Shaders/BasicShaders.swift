import Metal

public struct BasicVertexShader: Shader {

    public let functionName = "basic_vertex_main"

    public var library: MTLLibrary?

    public init(library: MTLLibrary?) {
        self.library = library
    }
}

public struct BasicFragmentShader: Shader {

    public let functionName = "basic_fragment_main"

    public var library: MTLLibrary?

    public init(library: MTLLibrary?) {
        self.library = library
    }
}
