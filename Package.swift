// swift-tools-version:5.9
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
    name: "PROJECT_NAME",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "PROJECT_NAME",
            targets: ["PROJECT_NAME"]
        )
    ],
    targets: [
        .target(
            name: "PROJECT_NAME",
            path: "Sources"
        ),
        .testTarget(
            name: "PROJECT_NAME_TESTS",
            dependencies: ["PROJECT_NAME"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
