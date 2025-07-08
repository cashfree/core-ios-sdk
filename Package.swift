// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CashfreePG",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CashfreePG",
            targets: ["CashfreePG"]
        ),
        .library(
            name: "CashfreePGCoreSDK",
            targets: ["CashfreePGCoreSDK"]
        ),
        .library(
            name: "CashfreePGUISDK",
            targets: ["CashfreePGUISDK"]
        ),
        .library(
            name: "CashfreeAnalyticsSDK",
            targets: ["CashfreeAnalyticsSDK"]
        ),
        .library(
            name: "CFNetworkSDK",
            targets: ["CFNetworkSDK"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        // CFNetworkSDK - Base networking framework
        .binaryTarget(
            name: "CFNetworkSDK",
            path: "CFNetworkSDK.xcframework"
        ),
        
        // CashfreeAnalyticsSDK - Depends on CFNetworkSDK
        .binaryTarget(
            name: "CashfreeAnalyticsSDK",
            path: "CashfreeAnalyticsSDK.xcframework"
        ),
        
        // CashfreePGCoreSDK - Depends on CashfreeAnalyticsSDK
        .binaryTarget(
            name: "CashfreePGCoreSDK",
            path: "CashfreePGCoreSDK.xcframework"
        ),
        
        // CashfreePGUISDK - Depends on CashfreePGCoreSDK
        .binaryTarget(
            name: "CashfreePGUISDK",
            path: "CashfreePGUISDK.xcframework"
        ),
        
        // CashfreePG - Main target that depends on CashfreePGUISDK
        .binaryTarget(
            name: "CashfreePG",
            path: "CashfreePG.xcframework"
        )
    ]
)