// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.17.2")
let checksum = "713553f21d68c5dbed139fdcb07ebc8261b24eb9db4e84e4be6d7cf68aa1cec5"

let package = Package(
    name: "MapsIndoorsCodable",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "MapsIndoorsCodable", targets: ["MapsIndoorsCodableWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MapsPeople/mapsindoors-core-ios.git", exact: mapsindoorsVersion),
    ],
    targets: [
        .binaryTarget(
            name: "MapsIndoorsCodable",
            url: "https://github.com/MapsPeople/MapsIndoors-SDK-iOS/releases/download/\(mapsindoorsVersion)/MapsIndoorsCodable.xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "MapsIndoorsCodableWrapper",
            dependencies: [
                "MapsIndoorsCodable",
                .product(name: "MapsIndoorsCore", package: "mapsindoors-core-ios"),
            ]
        ),
    ]
)
