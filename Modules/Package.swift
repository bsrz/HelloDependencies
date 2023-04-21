// swift-tools-version: 5.7

import PackageDescription

extension String {
    static let logging = "Logging"
    static let tracking = "Tracking"

    var tests: String { self + "Tests" }
}

extension Target.Dependency {
    static let logging = Self(stringLiteral: .logging)
    static let tracking = Self(stringLiteral: .tracking)

    static let dependencies = Self.product(name: "Dependencies", package: "swift-dependencies")
    static let timber = Self.product(name: "Timber", package: "timber")
}

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: .logging, targets: [.logging]),
        .library(name: .tracking, targets: [.tracking]),
    ],
    dependencies: [
        .package(url: "https://github.com/bsrz/timber.git", .upToNextMajor(from: .init(0, 1, 0))),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", .upToNextMajor(from: .init(0, 4, 1))),
    ],
    targets: [
        .target(name: .logging, dependencies: [.dependencies, .timber]),
        .testTarget(name: .logging.tests, dependencies: [.logging]),

        .target(name: .tracking, dependencies: [.dependencies, .logging])
    ]
)
