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
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat5_1_0.zip",
            checksum: "21b8e0725a0c716fafe2196bd9e3dee43474ee721862f458677dae8e5a70ef9a"
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
