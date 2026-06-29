// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.18.0-rc.1")
let checksum = "7336e0731bba1ccd92243a4d3c2a2d0e7ce008b2f3d630160afb331a74eb16bc"

let package = Package(
    name: "MapsIndoorsCodable",
    platforms: [.iOS(.v16)],
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
