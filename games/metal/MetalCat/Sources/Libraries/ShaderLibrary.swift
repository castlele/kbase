import Metal

final class ShaderLibrary {

    static func initialize(withDevice device: MTLDevice) -> ShaderLibrary {
        do {
            var defaultLibrary = try? device.makeDefaultLibrary(bundle: .main)

            defaultLibrary = try defaultLibrary ?? device.makeLibrary(
                filepath: Configuration.shaderLibraryPath
            )

            guard let defaultLibrary else {
                fatalError("No default library initialized")
            }

            let shaderLibrary = ShaderLibrary(defaultLibrary: defaultLibrary)

            return shaderLibrary
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    private let defaultLibrary: MTLLibrary

    private var vertexShaders: [VertexShaderType: Shader] = [:]
    private var fragmentShaders: [FragmentShaderType: Shader] = [:]

    private init(defaultLibrary: MTLLibrary) {
        self.defaultLibrary = defaultLibrary

        createShaders()
    }

    // MARK: - Public methods

    func vertex(ofType type: VertexShaderType) -> MTLFunction {
        guard let shader = vertexShaders[type] else {
            fatalError("No vertex shader found with type: \(type)")
        }

        return shader.function
    }

    func fragment(ofType type: FragmentShaderType) -> MTLFunction {
        guard let shader = fragmentShaders[type] else {
            fatalError("No fragment shader found with type: \(type)")
        }

        return shader.function
    }

    // MARK: - Private methods

    private func createShaders() {
        vertexShaders[.basic] = BasicVertexShader(library: defaultLibrary)
        fragmentShaders[.basic] = BasicFragmentShader(library: defaultLibrary)
    }
}
