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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-b889e0de72745cf4d2e02058edc6d8d2fe7915551a0355acd577f5121db9e518.xcframework.zip",
            checksum: "b889e0de72745cf4d2e02058edc6d8d2fe7915551a0355acd577f5121db9e518"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: ["Numerics"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-4f83c680978659119b80b772a652b0daa1ec257303ff8f60dc8b83710c835967.xcframework.zip",
            checksum: "4f83c680978659119b80b772a652b0daa1ec257303ff8f60dc8b83710c835967"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-28b1388815dbceb1a1cfda88782626fab8646e1e7b892415e7dd85ad0857ed99.xcframework.zip",
            checksum: "28b1388815dbceb1a1cfda88782626fab8646e1e7b892415e7dd85ad0857ed99"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: ["_NumericsShims"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/_NumericsShims-036a97a7a65cc8ec77283143d62c37c7998177caad480c8a1ee922967bc3311b.xcframework.zip",
            checksum: "036a97a7a65cc8ec77283143d62c37c7998177caad480c8a1ee922967bc3311b"
        ),
        .target(
            name: "ComplexModule_PrecompiledProduct",
            dependencies: [
                "ComplexModule_Aggregation",
                "RealModule_Aggregation",
                "_NumericsShims_Aggregation"
            ]
        ),
        .target(
            name: "Numerics_PrecompiledProduct",
            dependencies: [
                "Numerics_Aggregation",
                "ComplexModule_Aggregation",
                "RealModule_Aggregation",
                "_NumericsShims_Aggregation"
            ]
        ),
        .target(
            name: "RealModule_PrecompiledProduct",
            dependencies: ["RealModule_Aggregation", "_NumericsShims_Aggregation"]
        )
    ]
)