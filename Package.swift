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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-fc7148b846e1b08a31bc45cba7595d360d77ca139adf8eeb87386cf86ef19445.xcframework.zip",
            checksum: "fc7148b846e1b08a31bc45cba7595d360d77ca139adf8eeb87386cf86ef19445"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: ["Numerics"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-05e0656af037a3601a70ab3e26c4bdeb54abdb486ba0b7a75bf1eb14ba4b0436.xcframework.zip",
            checksum: "05e0656af037a3601a70ab3e26c4bdeb54abdb486ba0b7a75bf1eb14ba4b0436"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-562adc49d2fbfd6c8b7b1414d17e8451bc7695ec2457773ca59f6ff8149aa53f.xcframework.zip",
            checksum: "562adc49d2fbfd6c8b7b1414d17e8451bc7695ec2457773ca59f6ff8149aa53f"
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