// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "flutter_document_reader_api",
    platforms: [.iOS("13.0")],
    products: [.library(name: "flutter-document-reader-api", targets: ["flutter_document_reader_api"])],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package",
            exact: "9.7.6800-nightly"
        ),
    ],
    targets: [
        .target(
            name: "flutter_document_reader_api",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
            ],
            cSettings: [.headerSearchPath("include/flutter_document_reader_api")]
        ),
    ]
)
