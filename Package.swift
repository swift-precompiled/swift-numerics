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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1-precompiled.1/ComplexModule-fa205008e9d83c5c6e80d33b6cdb16760ff7bf03f7e60f29863d29106b42fa72.xcframework.zip",
            checksum: "fa205008e9d83c5c6e80d33b6cdb16760ff7bf03f7e60f29863d29106b42fa72"
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
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1-precompiled.1/Numerics-2a8776387d73bac7bc8b29cd080c5ec0b93090d0d999d8a7cf3aabfd05842c01.xcframework.zip",
            checksum: "2a8776387d73bac7bc8b29cd080c5ec0b93090d0d999d8a7cf3aabfd05842c01"
        ),
        .target(
            name: "RealModule_Aggregation",
            dependencies: ["RealModule", "_NumericsShims_Aggregation"]
        ),
        .binaryTarget(
            name: "RealModule",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1-precompiled.1/RealModule-bf36b24a2b78f21ed6f07565e41499d94d221b0fc13c540b19f7e69f2999ed58.xcframework.zip",
            checksum: "bf36b24a2b78f21ed6f07565e41499d94d221b0fc13c540b19f7e69f2999ed58"
        ),
        .target(
            name: "_NumericsShims_Aggregation",
            dependencies: ["_NumericsShims"]
        ),
        .binaryTarget(
            name: "_NumericsShims",
            url: "https://github.com/swift-precompiled/swift-numerics/releases/download/1.1.1-precompiled.1/_NumericsShims-de63f6f0e7779b261080b681abccbdd049ffd2c3410314ad813c4aa51ad5201b.xcframework.zip",
            checksum: "de63f6f0e7779b261080b681abccbdd049ffd2c3410314ad813c4aa51ad5201b"
        )
    ]
)