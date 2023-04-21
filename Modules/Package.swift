// swift-tools-version: 5.7

import PackageDescription

extension String {
    static let logging = "Logging"
    static let tracking = "Tracking"
    static let profile = "Profile"

    var data: String { self + "Data" }
    var domain: String { self + "Domain" }
    var tests: String { self + "Tests" }
}

extension Target.Dependency {
    static func named(_ name: String) -> Self { .init(stringLiteral: name) }

    static let dependencies = Self.product(name: "Dependencies", package: "swift-dependencies")
    static let timber = Self.product(name: "Timber", package: "timber")
}

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: .logging, targets: [.logging]),
        .library(name: .tracking, targets: [.tracking]),
        .library(name: .profile.data, targets: [.profile.data]),
        .library(name: .profile.domain, targets: [.profile.domain]),
    ],
    dependencies: [
        .package(url: "https://github.com/bsrz/timber.git", .upToNextMajor(from: .init(0, 1, 0))),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", .upToNextMajor(from: .init(0, 4, 1))),
    ],
    targets: [
        .target(name: .logging, dependencies: [.dependencies, .timber]),
        .testTarget(name: .logging.tests, dependencies: [.named(.logging)]),

        .target(name: .tracking, dependencies: [.dependencies, .named(.logging)]),

        .target(name: .profile.data, dependencies: [.dependencies, .named(.logging), .named(.profile.domain)]),
        .testTarget(name: .profile.data.tests, dependencies: [.dependencies, .named(.profile.data)]),
        .target(name: .profile.domain, dependencies: [.dependencies]),
    ]
)
