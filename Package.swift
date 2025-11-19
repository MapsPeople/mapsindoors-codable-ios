// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.16.0-rc.1")
let checksum = "4e645e8296d28ab4c142ffe0354f2106a3e599e3b832dc1549eb5fde3982798b"

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
