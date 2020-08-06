// swift-tools-version:5.2

import PackageDescription

extension Target {
    var asDependency: Target.Dependency {
        .target(name: name)
    }
}

// MARK: Libraries
extension Target {
    static var libraries: [Target] {
        [
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
            dependencies: [Target.core.asDependency],
            exclude: ["Effects/Foundation/FileManager+iOS+Mac.swift"])
        #else
        return .target(
            name: "BowLiteEffects",
            dependencies: [Target.core.asDependency])
        #endif
    }
    
    static var optics: Target {
        .target(name: "BowLiteOptics",
                dependencies: [Target.core.asDependency])
    }
}

// MARK: Laws
extension Target {
    static var laws: [Target] {
        [
            .bowLiteLaws
        ]
    }
    
    static var bowLiteLaws: Target {
        .testTarget(
            name: "BowLiteLaws",
            dependencies: [Target.core.asDependency,
                           Target.effects.asDependency,
                           .product(name: "SwiftCheck", package: "SwiftCheck")],
            path: "Tests/BowLiteLaws")
    }
}

// MARK: Tests
extension Target {
    static var tests: [Target] {
        [
            .coreTests,
            .effectsTests
        ]
    }
    
    static var coreTests: Target {
        .testTarget(
            name: "BowLiteCoreTests",
            dependencies: [Target.core.asDependency,
                           Target.bowLiteLaws.asDependency])
    }
    
    static var effectsTests: Target {
        .testTarget(name: "BowLiteEffectsTests",
                    dependencies: [Target.effects.asDependency,
                                   Target.bowLiteLaws.asDependency])
    }
}


// MARK: - Package
let package = Package(
    name: "BowLite",
    
    products: [
        .library(name: "BowLite", targets: Target.libraries.map(\.name))
    ],
    
    dependencies: [
        .package(url: "https://github.com/bow-swift/SwiftCheck.git", from: "0.12.1"),
    ],
    
    targets: [
        Target.libraries,
        Target.laws,
        Target.tests,
    ].flatMap { $0 }
)
