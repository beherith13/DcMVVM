// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension Product {
    static func allProducts() -> [Product] {
        let products: [Product] = [
            .library(
                name: "DcMVVM",
                targets: ["DcMVVM"]),
            .library(
                name: "DcMVVM-RxSwift",
                targets: ["DcMVVM-RxSwift"]),
            .library(
                name: "DcMVVM-UIKit",
                targets: ["DcMVVM-UIKit"]),
            /* .library(
             name: "DcMVVM-ReactiveSwift",
             targets: ["DcMVVM-ReactiveSwift"]),
             .library(
             name: "DcMVVM-Combine",
             targets: ["DcMVVM-Combine"]), */
            .library(
                name: "DcMVVM-Test",
                targets: ["DcMVVM-Test"])
        ]
        
        return products
    }
}

extension Target {
    static func allTargets() -> [Target] {
        let targets: [Target] = [
            .target(
                name: "DcMVVM",
                dependencies: [],
                path: "Sources/DcMVVM/Core"),
            .target(
                name: "DcMVVM-RxSwift",
                dependencies: ["DcMVVM", "RxSwift"],
                path: "Sources/DcMVVM/RxSwift"),
            .target(
                name: "DcMVVM-UIKit",
                dependencies: ["DcMVVM"],
                path: "Sources/DcMVVM/UIKit"),
           /* .target(
                name: "DcMVVM-ReactiveSwift",
                dependencies: ["DcMVVM-Core", "ReactiveSwift"],
                path: "Sources/DcMVVM/ReactiveSwift"),
            .target(
                name: "DcMVVM-Combine",
                dependencies: ["DcMVVM-Core"],
                path: "Sources/DcMVVM/Combine"), */
            .target(
                name: "DcMVVM-Test",
                dependencies: ["DcMVVM"],
                path: "Sources/DcMVVMTest"),
        ]
        
        return targets
    }
}

let package = Package(
    name: "DcMVVM",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
    ],
    products: Product.allProducts(),
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
       // .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: "6.1.0"),
    ],
    targets: Target.allTargets(),
    swiftLanguageVersions: [.v5]
)
