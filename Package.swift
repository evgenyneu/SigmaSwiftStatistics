import PackageDescription

let package = Package(
    name: "SigmaSwiftStatistics",
    exclude: ["Graphics", "SigmaSwiftStatistics-Mac", "SigmaSwiftStatistics-tvOS", "SigmaSwiftStatistics-Watch", "SigmaSwiftStatistics.xcodeproj", "SigmaSwiftStatisticsTests"],
    targets: [
        Target(
            name: "SigmaSwiftStatistics")
    ]
)