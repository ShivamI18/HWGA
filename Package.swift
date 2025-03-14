// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "HWGA",
    platforms: [
        .iOS(.v14) // Ensures compatibility with iPhone 13+
    ],
    products: [
        .library(
            name: "HWGA",
            targets: ["HWGA"]
        )
    ],
    dependencies: [
        // If you use any dependencies, add them here
    ],
    targets: [
        .target(
            name: "HWGA",
            dependencies: [],
            path: "HWGA",
            swiftSettings: [
                .define("ENABLE_ARM64") // Ensures ARM64 compatibility for iPhone 13+
            ]
        )
    ]
)
