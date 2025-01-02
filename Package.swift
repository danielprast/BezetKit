// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BezelKit",
  platforms: [
    .iOS(.v14),
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "BezelKit",
      targets: ["BezelKit"]
    ),
    .library(
      name: "BezelUIKit",
      targets: ["BezelUIKit"]
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
      name: "BezelUIKit",
      dependencies: [
        "BezelKit",
        "LBTATools"
      ]
    ),
    .target(
      name: "BezelKit"
    ),
    .testTarget(
      name: "BezelKitTests",
      dependencies: ["BezelKit"]
    ),
  ]
)
