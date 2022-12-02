// swift-tools-version:5.7

import Foundation
import PackageDescription

internal let package = Package(
    name: "dedici-vapor-config-exposer",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.65.1")),
        .package(url: "https://github.com/Fondation-Dedici/swift-dedici-vapor-toolbox", .upToNextMajor(from: "0.3.6")),
    ],
    targets: [
        .target(
            name: "DediciVaporConfigExposer",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "DediciVaporToolbox", package: "swift-dedici-vapor-toolbox"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        .executableTarget(
            name: "Run",
            dependencies: [.target(name: "DediciVaporConfigExposer")]
        ),
    ]
)
