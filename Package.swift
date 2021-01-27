// swift-tools-version:5.3
// The swift-tools-version declares the minimum version
// of Swift required to build this package.
// ----------------------------------------------------
//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://jessesquires.github.io/PROJECT
//
//  GitHub
//  https://github.com/jessesquires/PROJECT
//
//  Copyright © 2021-present Jesse Squires
//

import PackageDescription

let package = Package(
    name: "PROJECT",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "PROJECT",
            targets: ["PROJECT"])
    ],
    targets: [
        .target(
            name: "PROJECT",
            path: "Sources",
            exclude: ["Info.plist"]),
        .testTarget(name: "PROJECT_TESTS",
                    dependencies: ["PROJECT"],
                    path: "Tests",
                    exclude: ["Info.plist"]),
    ],
    swiftLanguageVersions: [.v5]
)
