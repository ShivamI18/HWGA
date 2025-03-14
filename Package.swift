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
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.1"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.15.0"),
        .package(url: "https://github.com/BradLarson/GPUImage.git", from: "0.1.7")
    ],
    targets: [
        .target(
            name: "BackgroundVideoRecorder",
            dependencies: [
                "Alamofire",
                "SwiftyJSON",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseDatabase", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                "GPUImage"
            ],
            path: "BackgroundVideoRecorder"
        )
    ]
)
