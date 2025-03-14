// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "BackgroundVideoRecorder",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "BackgroundVideoRecorder",
            targets: ["BackgroundVideoRecorder"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BackgroundVideoRecorder",
            dependencies: [],
            path: "BackgroundVideoRecorder"
        )
    ]
)
