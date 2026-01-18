// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "WarAndPeaceSwift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .executable(
            name: "WarAndPeaceSwift",
            targets: ["WarAndPeaceSwift"]
            ),
    ],
    targets: [
        .executableTarget(
            name: "WarAndPeaceSwift",
            path: "Sources/WarAndPeaceSwift"
            ),
        .testTarget(
            name: "WarAndPeaceSwiftTests",
            dependencies: ["WarAndPeaceSwift"],
            path: "Tests/WarAndPeaceSwiftTests"
            ),
    ]
)