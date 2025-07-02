// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SuitEtecsaSdk",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SuitEtecsaSdk",
            targets: ["SuitEtecsaSdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.2")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.8.8"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.8.5")),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "2.1.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SuitEtecsaSdk", dependencies: ["Alamofire", "SwiftSoup", "CryptoSwift", "SwiftyBeaver"]),
        .testTarget(
            name: "SuitEtecsaSdkTests",
            dependencies: ["SuitEtecsaSdk"]),
    ]
)
