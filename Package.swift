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
        // Add your dependencies here, example:
        // .package(url: "https://github.com/YourDependency/Repo.git", from: "1.0.0")
        dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "8.0.0")
],
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
