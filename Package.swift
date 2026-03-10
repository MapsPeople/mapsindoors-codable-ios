// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.16.2-rc.3")
let checksum = "9e2736850ef233131ac82f25215611178189464408f16207e017d10bdb454946"

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
