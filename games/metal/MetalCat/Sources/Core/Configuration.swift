import Foundation

public enum Configuration {
    static let shaderLibraryPath = {
        FileManager.default.currentDirectoryPath + Constants.shadersLibPath
    }()
}

// MARK: - Constants

extension Configuration {
    private enum Constants {
        static let shadersDirPath = "/Sources/Shaders"
        static let shadersLibPath = Self.shadersDirPath + "/HelloTriangle.metallib"
    }
}
