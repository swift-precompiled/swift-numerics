// swift-tools-version:5.0

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
            dependencies: [.target(name: "ComplexModule"), "RealModule_Aggregation"]
        ),
        .binaryTarget(
            name: "ComplexModule",
            url: "https://api.github.com/repos/swift-precompiled/swift-numerics/releases/assets/210683286.zip",
            checksum: "b72d12fed2c42320e52839ca21eac72e17ee209d0777cb38659758d02f5fa5ca"
        ),
        .target(
            name: "Numerics_Aggregation",
            dependencies: [
                .target(name: "Numerics"),
                "ComplexModule_Aggregation",
                "RealModule_Aggregation"
            ]
        ),
        .binaryTarget(
            name: "Numerics",
            url: "https://api.github.com/repos/swift-precompiled/swift-numerics/releases/assets/210683287.zip",
            checksum: "d7b1dd414ec8426ca23f1ee5e7c1560f2319cb5627f2225a3c0e0988310d5eab"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: [.target(name: "RealModule"), "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://api.github.com/repos/swift-precompiled/swift-numerics/releases/assets/210683289.zip",
            checksum: "425b53e34548de28eada52071f4f849728e608b1b4f8075d520c3f8593ab0680"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: [.target(name: "_NumericsShims")]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://api.github.com/repos/swift-precompiled/swift-numerics/releases/assets/210683291.zip",
            checksum: "75005cbb5823840e8e80292e25a6a342b46d86d9b90c25855ab744b38db1d51d"
        )
    ]
)