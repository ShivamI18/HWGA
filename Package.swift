// swift-tools-version: 5.1
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
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "BackgroundVideoRecorder",
            dependencies: ["Alamofire", "Firebase"],
            path: "BackgroundVideoRecorder",
            swiftSettings: [
                .define("ENABLE_ARM64")
            ]
        )
    ]
)
