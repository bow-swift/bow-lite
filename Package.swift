// swift-tools-version:5.3

import PackageDescription

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


// MARK: - Libraries
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
        return .target(name: "BowLiteEffects",
                       dependencies: [.target(name: Target.core.name)],
                       exclude: ["Effects/Foundation/FileManager+iOS+Mac.swift"])
        #else
        return .target(name: "BowLiteEffects",
                       dependencies: [.target(name: Target.core.name)])
        #endif
    }
    
    static var optics: Target {
        .target(name: "BowLiteOptics",
                dependencies: [.target(name: Target.core.name)])
    }
    
    static var bowLite: Target {
        .target(name: "BowLite",
                dependencies: [.target(name: Target.core.name),
                               .target(name: Target.effects.name),
                               .target(name: Target.optics.name)])
    }
}

// MARK: - Tests + Laws
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
            dependencies: [.target(name: Target.core.name),
                           .target(name: Target.bowLiteLaws.name)])
    }
    
    static var effectsTests: Target {
        .testTarget(name: "BowLiteEffectsTests",
                    dependencies: [.target(name: Target.effects.name),
                                   .target(name: Target.bowLiteLaws.name)])
    }
    
    static var bowLiteLaws: Target {
        .testTarget(
            name: "BowLiteLaws",
            dependencies: [.target(name: Target.core.name),
                           .target(name: Target.effects.name),
                           .product(name: "SwiftCheck", package: "SwiftCheck")])
    }
}
