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
            url: "https://download-sdk.oss-cn-beijing.aliyuncs.com/downloads/HyphenateChat4_19_6.zip",
            checksum: "defb5be97eaa868889794497082bb1041b7aafe1bd19df80fa06c7f118837d79"
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
