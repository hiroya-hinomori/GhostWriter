// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatGPTCLI-sample",
    products: [
        .executable(name: "sample", targets: ["ChatGPTCLI-sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "ChatGPTCLI-sample",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "ChatGPTCLICore"
            ]),
        .testTarget(
            name: "ChatGPTCLI-sampleTests",
            dependencies: ["ChatGPTCLI-sample"]),
        .target(
            name: "ChatGPTCLICore",
            dependencies: []),
        .testTarget(
            name: "ChatGPTCLICoreTests",
            dependencies: ["ChatGPTCLICore"]),
    ]
)
