// swift-tools-version:5.2
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
//  Copyright © 2020-present Jesse Squires
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
            path: "Sources"),
        .testTarget(name: "PROJECT_TESTS",
                    dependencies: ["PROJECT"],
                    path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
