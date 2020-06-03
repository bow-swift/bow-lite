// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BowLite",
    products: [
        .library(
            name: "BowLite",
            targets: ["BowLite"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BowLite",
            dependencies: []),
        .testTarget(
            name: "BowLiteTests",
            dependencies: ["BowLite"]),
    ]
)
