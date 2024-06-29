import Metal

public protocol Shader {
    var library: MTLLibrary? { get set }
    var functionName: String { get }
    var function: MTLFunction { get }
}

extension Shader {
    public var function: MTLFunction {
        guard let library else {
            fatalError("No library provided")
        }

        guard let function = library.makeFunction(name: functionName) else {
            fatalError("Can't create shader function with name: \(functionName)")
        }

        return function
    }
}
