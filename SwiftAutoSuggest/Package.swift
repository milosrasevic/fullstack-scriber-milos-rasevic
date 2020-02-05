// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import PackageDescription

let package = Package(
    name: "swiftautosuggest",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.1.0")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
        .package(url: "https://github.com/IBM-Swift/FileKit.git", from: "0.0.2")
    ],
    targets: [
        .target(
            name: "swiftautosuggest",
            dependencies: ["Kitura" , "HeliumLogger", "FileKit"]
        ),
    ]
)
