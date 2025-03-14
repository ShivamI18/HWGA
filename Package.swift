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
        dependencies: [
                .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
                .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0")
]
    ],
    targets: [
    .target(
        name: "HWGA",
        dependencies: ["Alamofire", "SwiftyJSON"],
        path: "HWGA",
        swiftSettings: [
            .define("ENABLE_ARM64") // Ensures ARM64 compatibility for iPhone 13+
        ]
    )
]
)
