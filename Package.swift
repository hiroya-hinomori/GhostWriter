// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatGPTCLI-sample",
    products: [
        .executable(name: "sample", targets: ["sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "sample",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Core"
            ]),
        .target(
            name: "Core",
            dependencies: []),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
