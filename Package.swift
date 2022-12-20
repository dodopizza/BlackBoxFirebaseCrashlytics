// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "BlackBoxFirebase"
let libraryName = packageName
let targetName = libraryName
let testTargetName = targetName + "Tests"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
        .tvOS(.v12),
        .watchOS(.v7)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: libraryName,
            targets: [targetName]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/dodopizza/BlackBox-ios.git",
            from: "0.6.0"
        ),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "10.0.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: targetName,
            dependencies: [
                .product(name: "BlackBox", package: "BlackBox-ios"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: testTargetName,
            dependencies: [
                .targetItem(name: targetName, condition: nil),
                .product(name: "BlackBox", package: "BlackBox-ios")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
