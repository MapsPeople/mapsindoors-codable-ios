// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mapsindoorsVersion = Version("4.15.1-rc.3")

let package = Package(
    name: "MapsIndoorsCodable",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MapsIndoorsCodable",
            targets: ["MapsIndoorsCodable"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MapsPeople/mapsindoors-core-ios.git", exact: mapsindoorsVersion),
    ],
    targets: [
        .target(
            name: "MapsIndoorsCodable",
            dependencies: [
                .product(name: "MapsIndoorsCore", package: "mapsindoors-core-ios"),
            ]
        ),
    ]
)
