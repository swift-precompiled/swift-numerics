// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-numerics",
    products: [
        .library(
            name: "ComplexModule",
            targets: ["ComplexModule_PrecompiledProduct"]
        ),
        .library(
            name: "Numerics",
            targets: ["Numerics_PrecompiledProduct"]
        ),
        .library(
            name: "RealModule",
            targets: ["RealModule_PrecompiledProduct"]
        )
    ],
    targets: [
        .target(
            name: "ComplexModule_Aggregation",
            dependencies: ["ComplexModule"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "ComplexModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-98cdea63cafdf2509d935fefdad8302b49e834093d19e3b4455b9542666262ae.xcframework.zip",
            checksum: "98cdea63cafdf2509d935fefdad8302b49e834093d19e3b4455b9542666262ae"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: ["Numerics"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-93cdcde730b8f35a37159d5905af918ca4c6c1aa73c009b33682b902f77be165.xcframework.zip",
            checksum: "93cdcde730b8f35a37159d5905af918ca4c6c1aa73c009b33682b902f77be165"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-acb98fe7eb2878e81ff40568f896e26b22e2a9765d5092ba7f2e4b03c8bb2cb1.xcframework.zip",
            checksum: "acb98fe7eb2878e81ff40568f896e26b22e2a9765d5092ba7f2e4b03c8bb2cb1"
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
            ]
        ),
        .target(
            name: "Numerics_PrecompiledProduct",
            dependencies: [
                "Numerics_Aggregation",
                "ComplexModule_Aggregation",
                "RealModule_Aggregation",
                "_NumericsShims"
            ]
        ),
        .target(
            name: "RealModule_PrecompiledProduct",
            dependencies: ["RealModule_Aggregation", "_NumericsShims"]
        )
    ]
)