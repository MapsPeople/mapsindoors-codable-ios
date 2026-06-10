// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.17.1")
let checksum = "b2daf3459794942566aaf90b8c641e7c104fd896d84920687430fbb1317d8e6f"

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
