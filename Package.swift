// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlgoreadMePackageData",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AlgoreadMePackageData",
            targets: ["AlgoreadMePackageData"]),
    ],
    dependencies: [
        .package(path: "../../Module/CoreNetworkNative")
    ],
    targets: [
        .target(
            name: "AlgoreadMePackageData",
            dependencies: [
                "CoreNetworkNative"
            ]
        ),
        .testTarget(
            name: "AlgoreadMePackageDataTests",
            dependencies: ["AlgoreadMePackageData"]
        ),
    ]
)
