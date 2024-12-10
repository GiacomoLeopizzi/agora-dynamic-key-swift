// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "agora-dynamic-key-swift",
    products: [
        .library(
            name: "AgoraDynamicKey",
            targets: ["AgoraDynamicKey"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl", from: "2.21.0"),
    ],
    targets: [
        .target(
            name: "AgoraDynamicKey",
            dependencies: [
                .target(name: "CAgoraDynamicKey"),
                .product(name: "NIO", package: "swift-nio"),
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]
        ),
        .target(
            name: "CAgoraDynamicKey",
            dependencies: [
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
            ],
            exclude: [
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/README.md",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/csharp",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/deno",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/go",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/java",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/nodejs",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/perl",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/php",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/python",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/python3",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/ruby",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/rust",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/Makefile",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/parse.py",
                
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/README.md",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/sample",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/test",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/tool",
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/CMakeLists.txt",
                
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/src/README.md",
            ],
            sources: [
                "./libAgoraDynamicKey/DynamicKey/AgoraDynamicKey/cpp/src",
                "./include/testing",
            ],
            publicHeadersPath: "./include",
            swiftSettings: [
                .interoperabilityMode(.Cxx),
            ],
            linkerSettings: [
                .linkedLibrary("z"),  // zlib
            ]
        ),
        .testTarget(
            name: "AgoraDynamicKeyTests",
            dependencies: [
                .target(name: "AgoraDynamicKey"),
                .target(name: "CAgoraDynamicKey"),
                .product(name: "NIO", package: "swift-nio"),
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx),
            ]
        )
    ],
    cxxLanguageStandard: .cxx14
)
