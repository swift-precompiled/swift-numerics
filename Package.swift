// swift-tools-version:5.3

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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.0.0/ComplexModule.xcframework.zip",
            checksum: "4bd2e91bedad8d651e60c4630bb334987d3f5bd8f1bcfe4cccca831727041365"
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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.0.0/Numerics.xcframework.zip",
            checksum: "2c3954d86ae4233327832cec47a35ec155162bd29732fc6994dfa653cb9dd934"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: [.target(name: "RealModule"), "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.0.0/RealModule.xcframework.zip",
            checksum: "3f9a482ea1a5a437bc0927e1822cdeb1ac483f839092238ebcb68c3edfad6e57"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: [.target(name: "_NumericsShims")]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.0.0/_NumericsShims.xcframework.zip",
            checksum: "0a12b8ec9aef6295ac846b91880c4b3fc8af69edff3a9b83b82b41456c96329b"
        )
    ]
)