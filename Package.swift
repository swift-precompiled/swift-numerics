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
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "ComplexModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-74e1d09bd2fd628fe93814558697effeb93e3bcbcd1b601197564d298d600df6.xcframework.zip",
            checksum: "74e1d09bd2fd628fe93814558697effeb93e3bcbcd1b601197564d298d600df6"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: ["Numerics"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-bb325bf6cc2681a1f2d3681b123ec60b3413d3eff96665f4ad695a9d334929cd.xcframework.zip",
            checksum: "bb325bf6cc2681a1f2d3681b123ec60b3413d3eff96665f4ad695a9d334929cd"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-1b78f75a95b2f9d5cef9b173ae8a10e9d253d1b21d1d738f035764637c1667d9.xcframework.zip",
            checksum: "1b78f75a95b2f9d5cef9b173ae8a10e9d253d1b21d1d738f035764637c1667d9"
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/_NumericsShims-520381b9f1c6f7233f6f3bec5e006431d400689518612168f674fbb854ee16f4.xcframework.zip",
            checksum: "520381b9f1c6f7233f6f3bec5e006431d400689518612168f674fbb854ee16f4"
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