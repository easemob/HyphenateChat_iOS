// swift-tools-version:5.7
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
            url: "https://github.com/Shengwang-Lab/ShengwangInfra_iOS.git",
            from: "1.3.5"
        ),
    ],
    targets: [
        // 1️⃣ binary SDK (name must match .xcframework inside the zip)
        .binaryTarget(
            name: "HyphenateChat",
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat5_2_0.zip",
            checksum: "b2371d8287f5b1f448b95e5db1c88289c31be4ec677404b0bff171be743bb737"
        ),

        // 2️⃣ wrapper target
        .target(
            name: "HyphenateChatWrapper",
            dependencies: [
                "HyphenateChat",
                .product(name: "ShengwangInfra_iOS", package: "ShengwangInfra_iOS")
            ]
        ),

    ]
)
