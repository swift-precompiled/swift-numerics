// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-numerics",
    products: [
        .library(
            name: "ComplexModule",
            targets: ["ComplexModule_Aggregation"]
        ),
        .library(
            name: "Numerics",
            targets: ["Numerics_Aggregation"]
        ),
        .library(
            name: "RealModule",
            targets: ["RealModule_Aggregation"]
        )
    ],
    targets: [
        .target(
            name: "ComplexModule_Aggregation",
            dependencies: ["ComplexModule", "RealModule_Aggregation"]
        ),
        .binaryTarget(
            name: "ComplexModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-bc69357a0591aa7b95f17a88e85805570f0c3810819a6bb1f61b74ec5ec494ea.xcframework.zip",
            checksum: "bc69357a0591aa7b95f17a88e85805570f0c3810819a6bb1f61b74ec5ec494ea"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: [
                "Numerics",
                "ComplexModule_Aggregation",
                "RealModule_Aggregation"
            ]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-41a63b558a342d10cf9e99bc51521f3748e5e98eaaa74c056a3a0f84dfaf9caa.xcframework.zip",
            checksum: "41a63b558a342d10cf9e99bc51521f3748e5e98eaaa74c056a3a0f84dfaf9caa"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule", "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-a80d7a2b07e90f4bfcc1ea639a6bd594b8fe99d7bfd0a7915d45d7f19153bfad.xcframework.zip",
            checksum: "a80d7a2b07e90f4bfcc1ea639a6bd594b8fe99d7bfd0a7915d45d7f19153bfad"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: ["_NumericsShims"]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/_NumericsShims-036a97a7a65cc8ec77283143d62c37c7998177caad480c8a1ee922967bc3311b.xcframework.zip",
            checksum: "036a97a7a65cc8ec77283143d62c37c7998177caad480c8a1ee922967bc3311b"
        )
    ]
)