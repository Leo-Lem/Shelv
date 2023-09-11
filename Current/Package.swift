// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Current",
  platforms: [.iOS(.v17)]
)

// MARK: - (DEPENDENCIES)

package.dependencies = [
  .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.0.0"),
  .package(name: "Model", path: "./model")
]

// MARK: - (TARGETS)

let src = Target.target(
  name: package.name,
  dependencies: [
    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
    .product(name: "Model", package: "Model")
  ],
  path: "src",
  resources: [
    .process("Assets.xcassets")
  ]
)

let test = Target.testTarget(
  name: "\(src.name)Tests",
  dependencies: [.target(name: src.name)],
  path: "test"
)

package.targets = [src, test]

// MARK: - (PRODUCTS)

package.products = [.library(name: package.name, targets: [src.name])]
