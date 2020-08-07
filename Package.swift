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
            .bowLite,
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
            path: "Sources/BowLiteEffects",
            exclude: ["Effects/Foundation/FileManager+iOS+Mac.swift"])
        #else
        return .target(
            name: "BowLiteEffects",
            dependencies: [Target.core.asDependency],
            path: "Sources/BowLiteEffects")
        #endif
    }
    
    static var optics: Target {
        .target(name: "BowLiteOptics",
                dependencies: [Target.core.asDependency])
    }
    
    static var bowLite: Target {
        .target(name: "BowLite",
                dependencies: [Target.core.asDependency,
                               Target.effects.asDependency,
                               Target.optics.asDependency])
    }
}

// MARK: Tests + Laws
extension Target {
    static var tests: [Target] {
        [
            .bowLiteLaws,
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
    
    static var bowLiteLaws: Target {
        .testTarget(
            name: "BowLiteLaws",
            dependencies: [Target.core.asDependency,
                           Target.effects.asDependency,
                           .product(name: "SwiftCheck", package: "SwiftCheck")])
    }
}


// MARK: - Package
let package = Package(
    name: "BowLite",
    
    products: [
        .library(name: "BowLite", targets: [Target.bowLite.name]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/bow-swift/SwiftCheck.git", from: "0.12.1"),
    ],
    
    targets: [
        Target.libraries,
        Target.tests,
    ].flatMap { $0 }
)
