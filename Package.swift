// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Binary targets cannot declare dependencies, so each product points at a thin
// wrapper target that pulls in its SDK plus every SDK below it in the chain:
// CFNetworkSDK -> CashfreeAnalyticsSDK -> CashfreePGCoreSDK -> CashfreePGUISDK -> CashfreePG
let package = Package(
    name: "CashfreePG",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CashfreePG",
            targets: ["CashfreePGWrapper"]
        ),
        .library(
            name: "CashfreePGUISDK",
            targets: ["CashfreePGUISDKWrapper"]
        ),
        .library(
            name: "CashfreePGCoreSDK",
            targets: ["CashfreePGCoreSDKWrapper"]
        ),
        .library(
            name: "CashfreeAnalyticsSDK",
            targets: ["CashfreeAnalyticsSDKWrapper"]
        ),
        .library(
            name: "CFNetworkSDK",
            targets: ["CFNetworkSDKWrapper"]
        )
    ],
    targets: [
        // MARK: Binary SDKs

        .binaryTarget(
            name: "CFNetworkSDK",
            path: "CFNetworkSDK.xcframework"
        ),
        .binaryTarget(
            name: "CashfreeAnalyticsSDK",
            path: "CashfreeAnalyticsSDK.xcframework"
        ),
        .binaryTarget(
            name: "CashfreePGCoreSDK",
            path: "CashfreePGCoreSDK.xcframework"
        ),
        .binaryTarget(
            name: "CashfreePGUISDK",
            path: "CashfreePGUISDK.xcframework"
        ),
        .binaryTarget(
            name: "CashfreePG",
            path: "CashfreePG.xcframework"
        ),

        // MARK: Wrappers (dependency chain)

        .target(
            name: "CFNetworkSDKWrapper",
            dependencies: ["CFNetworkSDK"],
            path: "Sources/CFNetworkSDKWrapper"
        ),
        .target(
            name: "CashfreeAnalyticsSDKWrapper",
            dependencies: ["CashfreeAnalyticsSDK", "CFNetworkSDKWrapper"],
            path: "Sources/CashfreeAnalyticsSDKWrapper"
        ),
        .target(
            name: "CashfreePGCoreSDKWrapper",
            dependencies: ["CashfreePGCoreSDK", "CashfreeAnalyticsSDKWrapper"],
            path: "Sources/CashfreePGCoreSDKWrapper",
            // CashfreePGCoreSDK uses WebKit but does not link it itself
            linkerSettings: [.linkedFramework("WebKit")]
        ),
        .target(
            name: "CashfreePGUISDKWrapper",
            dependencies: ["CashfreePGUISDK", "CashfreePGCoreSDKWrapper"],
            path: "Sources/CashfreePGUISDKWrapper"
        ),
        .target(
            name: "CashfreePGWrapper",
            dependencies: ["CashfreePG", "CashfreePGUISDKWrapper"],
            path: "Sources/CashfreePGWrapper"
        )
    ]
)
