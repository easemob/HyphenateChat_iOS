// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "HyphenateChat",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "HyphenateChat",
            targets: ["HyphenateChatWrapper"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AgoraIO/AgoraInfra_iOS",
            from: "1.3.0"
        ),
    ],
    targets: [
        // 1️⃣ binary SDK (name must match .xcframework inside the zip)
        .binaryTarget(
            name: "HyphenateChat",
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat4_17_1.zip",
            checksum: "9e025976606870430b31758098b3ac11c17fda178f5312b6312b7bc0dfd7c0b6"
        ),

        // 2️⃣ wrapper target
        .target(
            name: "HyphenateChatWrapper",
            dependencies: [
                "HyphenateChat",
                .product(name: "AgoraInfra_iOS", package: "AgoraInfra_iOS")
            ]
        ),

    ]
)
