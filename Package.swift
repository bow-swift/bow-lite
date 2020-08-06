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

// MARK: Tests
extension Target {
    static var tests: [Target] {
        [
            .bowLiteTests,
        ]
    }
    
    static var bowLiteTests: Target {
        .testTarget(
            name: "BowLiteTests",
            dependencies: [Target.core.asDependency,
                           Target.effects.asDependency,
                           Target.optics.asDependency,
                           .product(name: "SwiftCheck", package: "SwiftCheck")])
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
        Target.tests,
    ].flatMap { $0 }
)
