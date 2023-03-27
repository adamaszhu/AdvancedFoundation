// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdvancedFoundation",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "AdvancedFoundation", targets: ["AdvancedFoundation"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(name: "AdvancedFoundation", path: "AdvancedFoundation"),
        .testTarget(
            name: "AdvancedFoundationTests",
            dependencies: ["AdvancedFoundation",
                           "Nimble",
                           "Quick"],
            path: "AdvancedFoundationTests"),
    ]
)
