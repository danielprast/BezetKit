// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BezetKit",
  platforms: [
    .iOS(.v14),
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "BezetKit",
      targets: ["BezetKit"]
    ),
    .library(
      name: "BezetUIKit",
      targets: ["BezetUIKit"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/bhlvoong/LBTATools",
      exact: "1.0.17"
    ),
  ],
  targets: [
    .target(
      name: "BezetUIKit",
      dependencies: [
        "BezetKit",
        "LBTATools"
      ]
    ),
    .target(
      name: "BezetKit"
    ),
    .testTarget(
      name: "BezetKitTests",
      dependencies: ["BezetKit"]
    ),
  ]
)
