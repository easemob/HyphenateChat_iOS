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
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat4_24_2.zip",
            checksum: "b7119ddf64a44b6e7eac69680814583843372a75adb67ab661dabcd04bfd8d8a"
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
