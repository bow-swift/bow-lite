// swift-tools-version:5.2

import PackageDescription

private var bowLiteTarget: Target {
    #if os(Linux)
    return .target(
        name: "BowLite",
        dependencies: [],
        exclude: ["Effects/Foundation/FileManager+iOS+Mac.swift"])
    #else
    return .target(
        name: "BowLite",
        dependencies: [])
    #endif
}

let package = Package(
    name: "BowLite",
    products: [
        .library(
            name: "BowLite",
            targets: ["BowLite"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bow-swift/SwiftCheck.git", from: "0.12.1"),
    ],
    targets: [
        bowLiteTarget,
        .testTarget(
            name: "BowLiteTests",
            dependencies: ["BowLite", "SwiftCheck"]),
    ]
)
