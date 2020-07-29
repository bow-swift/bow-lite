// swift-tools-version:5.2

import PackageDescription

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
        .target(
            name: "BowLite",
            dependencies: []),
        .testTarget(
            name: "BowLiteTests",
            dependencies: ["BowLite", "SwiftCheck"]),
    ]
)
