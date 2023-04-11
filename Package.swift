// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatGPTCLI",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "testgen", targets: ["TestGen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/ishkawa/APIKit.git", from: "5.4.0"),
    ],
    targets: [
        .executableTarget(
            name: "TestGen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Core"
            ]),
        .target(
            name: "Core",
            dependencies: [
                "APIKit",
                "API"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
        .target(
            name: "API",
            dependencies: [
                "APIKit",
            ]),
    ]
)
