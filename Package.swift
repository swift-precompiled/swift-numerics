// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-numerics",
    products: [
        .library(
            name: "ComplexModule",
            targets: [
                "ComplexModule",
                "RealModule",
                "_NumericsShims",
                "ComplexModule_PrecompiledProduct"
            ]
        ),
        .library(
            name: "Numerics",
            targets: [
                "Numerics",
                "ComplexModule",
                "RealModule",
                "_NumericsShims",
                "Numerics_PrecompiledProduct"
            ]
        ),
        .library(
            name: "RealModule",
            targets: [
                "RealModule",
                "_NumericsShims",
                "RealModule_PrecompiledProduct"
            ]
        )
    ],
    targets: [
        .target(
            name: "ComplexModule_Aggregation",
            dependencies: ["ComplexModule"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "ComplexModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-43457bfdc60965163f9db8f89ad7b9c834e5370323f04d973fb068197301c915.xcframework.zip",
            checksum: "43457bfdc60965163f9db8f89ad7b9c834e5370323f04d973fb068197301c915"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: ["Numerics"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-114cc6ab6ce5454326c2338afa7333fee200b6df09debf43822391ebb59db895.xcframework.zip",
            checksum: "114cc6ab6ce5454326c2338afa7333fee200b6df09debf43822391ebb59db895"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-418709cb00411af2520924802adb8da01fe98391aba05c358f72531c60506170.xcframework.zip",
            checksum: "418709cb00411af2520924802adb8da01fe98391aba05c358f72531c60506170"
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/_NumericsShims-3a83ac1a72d8ea3e304aaa2ba473b4f57c4e38044f054d69d27b82e109460dd7.xcframework.zip",
            checksum: "3a83ac1a72d8ea3e304aaa2ba473b4f57c4e38044f054d69d27b82e109460dd7"
        ),
        .target(
            name: "ComplexModule_PrecompiledProduct",
            dependencies: [
                "ComplexModule_Aggregation",
                "RealModule_Aggregation",
                "_NumericsShims"
            ],
            packageAccess: false
        ),
        .target(
            name: "Numerics_PrecompiledProduct",
            dependencies: [
                "Numerics_Aggregation",
                "ComplexModule_Aggregation",
                "RealModule_Aggregation",
                "_NumericsShims"
            ],
            packageAccess: false
        ),
        .target(
            name: "RealModule_PrecompiledProduct",
            dependencies: ["RealModule_Aggregation", "_NumericsShims"],
            packageAccess: false
        )
    ]
)