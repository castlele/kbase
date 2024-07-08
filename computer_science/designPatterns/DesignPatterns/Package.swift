// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignPatterns",
    products: [
        .library(
            name: "DesignPatterns",
            targets: ["DesignPatterns"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing.git", branch: "main")
    ],
    targets: [
        .target(
            name: "DesignPatterns"
        ),
        .testTarget(
            name: "DesignPatternsTests",
            dependencies: [
                .target(name: "DesignPatterns"),
            ]
        ),
    ]
)
