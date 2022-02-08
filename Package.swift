// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SigmaSwiftStatistics",
    products: [
        .library(name: "SigmaSwiftStatistics", targets: ["SigmaSwiftStatistics"])
    ],
    targets: [
        .target(
            name: "SigmaSwiftStatistics",
            dependencies: [],
            path: "SigmaSwiftStatistics")
    ]
)