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
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat4_22_1.zip",
            checksum: "12443fac3051f2d7a4aeef483dcc053941b83b4283a3806dbaf7861bb04ec96c"
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
