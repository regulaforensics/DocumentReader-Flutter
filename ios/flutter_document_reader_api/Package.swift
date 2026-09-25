// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "flutter_document_reader_api",
    platforms: [.iOS(.v15)],
    products: [.library(name: "flutter-document-reader-api", targets: ["flutter_document_reader_api"])],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package",
            exact: "9.9.7050-rc"
        ),
    ],
    targets: [
        .target(
            name: "flutter_document_reader_api",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
            ],
            path: "src",
            publicHeadersPath: "."
        )
    ]
)
