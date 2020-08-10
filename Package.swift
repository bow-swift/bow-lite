// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BowLite",

    products: [
        .library(name: "BowLite", targets: [Target.lite.name]),
    ],

    dependencies: [
        .package(url: "https://github.com/bow-swift/SwiftCheck.git", from: "0.12.1"),
    ],

    targets: Target.all
)


// MARK: - Libraries
extension Target {
    static var all: [Target] = sources + tests
    
    static var sources: [Target] {
        [
            .lite,
            .core,
            .effects,
            .optics
        ]
    }

    static var core: Target {
        .target(name: "BowLiteCore")
    }

    static var effects: Target {
        #if os(Linux)
        return .target(
            name: "BowLiteEffects",
            dependencies: [.target(name: Target.core.name)],
            exclude: ["Foundation/FileManager+iOS+Mac.swift"])
        #else
        return .target(
            name: "BowLiteEffects",
            dependencies: [.target(name: Target.core.name)])
        #endif
    }

    static var optics: Target {
        .target(
            name: "BowLiteOptics",
            dependencies: [.target(name: Target.core.name)])
    }

    static var lite: Target {
        .target(
            name: "BowLite",
            dependencies: [
                .target(name: Target.core.name),
                .target(name: Target.effects.name),
                .target(name: Target.optics.name)
            ]
        )
    }
}

// MARK: - Tests + Laws
extension Target {
    static var tests: [Target] {
        [
            .laws,
            .coreTests,
            .effectsTests
        ]
    }

    static var coreTests: Target {
        .testTarget(
            name: "BowLiteCoreTests",
            dependencies: [
                .target(name: Target.core.name),
                .target(name: Target.laws.name)
            ]
        )
    }

    static var effectsTests: Target {
        .testTarget(
            name: "BowLiteEffectsTests",
            dependencies: [
                .target(name: Target.effects.name),
                .target(name: Target.laws.name)
            ]
        )
    }

    static var laws: Target {
        .target(
            name: "BowLiteLaws",
            dependencies: [
                .target(name: Target.core.name),
                .target(name: Target.effects.name),
                .product(name: "SwiftCheck", package: "SwiftCheck")
            ],
            path: "Tests/BowLiteLaws")
    }
}
