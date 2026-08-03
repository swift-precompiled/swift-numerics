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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-7498f86f1e35ef4be42e4f27350fec8a4bda3957c39cf1861bf2cc960ca7c1ec.xcframework.zip",
            checksum: "7498f86f1e35ef4be42e4f27350fec8a4bda3957c39cf1861bf2cc960ca7c1ec"
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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-4b38ed46a92884cbc1715351531194dd20c4ad46ea0c6c340542080e4370e7f8.xcframework.zip",
            checksum: "4b38ed46a92884cbc1715351531194dd20c4ad46ea0c6c340542080e4370e7f8"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule", "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-b4bb24381000a5f30abae027d516e993d7a6462dabca88bb602c354af69ad067.xcframework.zip",
            checksum: "b4bb24381000a5f30abae027d516e993d7a6462dabca88bb602c354af69ad067"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: ["_NumericsShims"]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/_NumericsShims-8f01b71e5d93afd91b3cab442eeaca5b3340f5889e557e307cb5f09119328474.xcframework.zip",
            checksum: "8f01b71e5d93afd91b3cab442eeaca5b3340f5889e557e307cb5f09119328474"
        )
    ]
)