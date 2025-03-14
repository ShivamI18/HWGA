// swift-tools-version: 5.1
import PackageDescription

let package = Package(
    name: "BackgroundVideoRecorder",
    platforms: [
        .iOS(.v14)  // Supports iOS 14 and above (iPhone 13 is iOS 15+)
    ],
    products: [
        .library(
            name: "BackgroundVideoRecorder",
            targets: ["BackgroundVideoRecorder"]
        )
    ],
    dependencies: [
        // Add dependencies here if needed
    ],
    targets: [
        .target(
            name: "BackgroundVideoRecorder",
            dependencies: [],
            path: "BackgroundVideoRecorder",
            swiftSettings: [
                .define("ENABLE_ARM64")  // Ensures ARM64 compatibility
            ]
        )
    ]
)
