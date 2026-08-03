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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/ComplexModule-13d768c58dede3a3db1d0d3e0bfd26e3bf78caff7049a551eee51b9febed364f.xcframework.zip",
            checksum: "13d768c58dede3a3db1d0d3e0bfd26e3bf78caff7049a551eee51b9febed364f"
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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/Numerics-51a1d1a527ef162844e32b5858f278a0c8afa2428266b5d268f52034b3da4fdc.xcframework.zip",
            checksum: "51a1d1a527ef162844e32b5858f278a0c8afa2428266b5d268f52034b3da4fdc"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule", "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1/RealModule-66d629158eecdcf82592c21d924f718874d3b604c6bf7b6e3e6fed1b6e032b56.xcframework.zip",
            checksum: "66d629158eecdcf82592c21d924f718874d3b604c6bf7b6e3e6fed1b6e032b56"
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