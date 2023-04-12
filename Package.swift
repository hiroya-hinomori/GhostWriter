// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GhostWriter",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "testwriter", targets: ["TestWriter"]),
        .executable(name: "mockwriter", targets: ["MockWriter"]),
        .executable(name: "mapperwriter", targets: ["MapperWriter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/ishkawa/APIKit.git", from: "5.4.0"),
    ],
    targets: [
        .executableTarget(
            name: "TestWriter",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Core"
            ]),
        .executableTarget(
            name: "MockWriter",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Core"
            ]),
        .executableTarget(
            name: "MapperWriter",
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
