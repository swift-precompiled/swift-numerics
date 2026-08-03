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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-19facd15d51f95052adad4336105ba6a6199dbd6b774ee02816dbae46c44c833.xcframework.zip",
            checksum: "19facd15d51f95052adad4336105ba6a6199dbd6b774ee02816dbae46c44c833"
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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-22762712d3753f8f3b49b1c8422282e5f1f426fae400b15e9aa32f480eff5d24.xcframework.zip",
            checksum: "22762712d3753f8f3b49b1c8422282e5f1f426fae400b15e9aa32f480eff5d24"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule", "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-d7e4e2be6fa2d80a95e6cd817b77fdddc0fefbbdef0cba29d43b30f7b75634fa.xcframework.zip",
            checksum: "d7e4e2be6fa2d80a95e6cd817b77fdddc0fefbbdef0cba29d43b30f7b75634fa"
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