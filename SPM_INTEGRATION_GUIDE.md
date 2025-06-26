# Swift Package Manager Integration Guide

This guide provides detailed instructions for integrating the Cashfree iOS SDK using Swift Package Manager (SPM).

## Overview

The Cashfree iOS SDK consists of multiple frameworks that work together to provide a complete payment solution:

- **CashfreePG** - Main SDK that includes all payment functionality (recommended)
- **CashfreePGCoreSDK** - Core payment processing functionality
- **CashfreePGUISDK** - Pre-built UI components for payment flows
- **CashfreeAnalyticsSDK** - Analytics and tracking functionality
- **CFNetworkSDK** - Network layer for API communication

## Installation

### Method 1: Xcode GUI

1. Open your iOS project in Xcode
2. Navigate to your project settings
3. Select your app target
4. Go to the **Package Dependencies** tab
5. Click the **+** button
6. Enter the repository URL: `https://github.com/cashfree/core-ios-sdk.git`
7. Choose your preferred version rule (recommended: "Up to Next Major Version")
8. Click **Add Package**
9. Select the products you need:
   - For most use cases, select **CashfreePG** (includes all dependencies)
   - For custom implementations, select individual components as needed

### Method 2: Package.swift

Add the following to your `Package.swift` file:

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "YourApp",
    platforms: [
        .iOS(.v12)
    ],
    dependencies: [
        .package(
            url: "https://github.com/cashfree/core-ios-sdk.git",
            from: "2.2.4"
        )
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: [
                .product(name: "CashfreePG", package: "core-ios-sdk")
            ]
        )
    ]
)
```

## Usage

### Basic Integration

```swift
import CashfreePG
// Note: Due to SPM limitations, you may need to import dependencies manually
// import CashfreePGUISDK
// import CashfreePGCoreSDK
// import CashfreeAnalyticsSDK
// import CFNetworkSDK

class PaymentViewController: UIViewController {
    
    // Configure your payment session
    func initiatePayment() {
        let environment: CFENVIRONMENT = .SANDBOX // Use .PRODUCTION for live
        let paymentSessionId = "your_payment_session_id"
        let orderId = "your_order_id"
        
        // Initialize payment session
        let paymentSession = CFPaymentSession()
        paymentSession.setPaymentSessionId(paymentSessionId, 
                                         order_id: orderId, 
                                         environment: environment)
        
        // Start payment
        paymentSession.presentPayment(from: self) { [weak self] result in
            DispatchQueue.main.async {
                self?.handlePaymentResult(result)
            }
        }
    }
    
    private func handlePaymentResult(_ result: CFPaymentResult) {
        switch result.status {
        case .success:
            print("Payment successful: \(result.orderId)")
        case .failure:
            print("Payment failed: \(result.error?.localizedDescription ?? "Unknown error")")
        case .cancelled:
            print("Payment cancelled by user")
        }
    }
}
```

### Advanced Configuration

```swift
import CashfreePGCoreSDK
import CashfreePGUISDK

class AdvancedPaymentViewController: UIViewController {
    
    func setupAdvancedPayment() {
        // Core SDK for custom implementations
        let coreSDK = CFPGCoreSDK()
        
        // UI SDK for pre-built components
        let uiSDK = CFPGUISDK()
        
        // Configure custom payment flow
        let paymentConfig = CFPaymentConfig()
        paymentConfig.theme = .light
        paymentConfig.showSavedCards = true
        paymentConfig.enableAnalytics = true
        
        // Apply configuration
        coreSDK.configure(with: paymentConfig)
    }
}
```

## Framework Dependencies

**Important Note**: Due to Swift Package Manager limitations, binary targets cannot depend on other binary targets within the same package. This means that unlike CocoaPods, SPM will not automatically resolve framework dependencies.

### Dependency Management

When using SPM, you need to manually ensure you import the required frameworks in the correct order:

```
CashfreePG (Requires: CashfreePGUISDK)
├── CashfreePGUISDK (Requires: CashfreePGCoreSDK)
│   └── CashfreePGCoreSDK (Requires: CashfreeAnalyticsSDK)
│       └── CashfreeAnalyticsSDK (Requires: CFNetworkSDK)
│           └── CFNetworkSDK (Base framework)
```

### Selecting the Right Package

| Package | Use Case | Manual Dependencies Required |
|---------|----------|------------------------------|
| `CashfreePG` | Complete integration with UI | Import all dependent frameworks |
| `CashfreePGUISDK` | Custom integration with pre-built UI | Import Core + Analytics + Network |
| `CashfreePGCoreSDK` | Headless integration | Import Analytics + Network |
| `CashfreeAnalyticsSDK` | Analytics only | Import Network |
| `CFNetworkSDK` | Network layer only | None |

### Recommended Approach

For most use cases, we recommend adding all required frameworks to your project and importing them as needed:

```swift
// In your Package.swift
dependencies: [
    .package(url: "https://github.com/cashfree/core-ios-sdk.git", from: "2.2.4")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "CashfreePG", package: "core-ios-sdk"),
            .product(name: "CashfreePGUISDK", package: "core-ios-sdk"),
            .product(name: "CashfreePGCoreSDK", package: "core-ios-sdk"),
            .product(name: "CashfreeAnalyticsSDK", package: "core-ios-sdk"),
            .product(name: "CFNetworkSDK", package: "core-ios-sdk")
        ]
    )
]
```

## Requirements

- **iOS**: 12.0+
- **Xcode**: 14.0+
- **Swift**: 5.7+

## Troubleshooting

### Common Issues

1. **"Package not found" error**
   - Verify the repository URL is correct
   - Check your internet connection
   - Ensure Xcode has access to GitHub

2. **Build errors after integration**
   - Clean build folder (`Product` → `Clean Build Folder`)
   - Reset package caches (`File` → `Packages` → `Reset Package Caches`)
   - Verify minimum deployment target is iOS 12.0+

3. **Import errors**
   - Ensure you've imported the correct framework
   - Check that the framework is added to your target's dependencies

4. **Missing symbol errors at runtime**
   - This is likely due to missing framework dependencies
   - Add all required frameworks to your target dependencies
   - Import all necessary frameworks in your code
   - Ensure framework linking order is correct

5. **SPM vs CocoaPods differences**
   - SPM doesn't automatically resolve binary framework dependencies
   - You may need to manually import and link dependent frameworks
   - Consider using CocoaPods if automatic dependency resolution is critical

6. **WebKit not linked error**
   - If you encounter "WebKit framework not found" or "WKWebView not available" errors:
   
   - **Solution 1**: Add WebKit framework manually to your target
     1. Select your project in Xcode
     2. Go to your app target
     3. Navigate to **Build Phases** → **Link Binary With Libraries**
     4. Click the **+** button
     5. Search for and add **WebKit.framework**

   - **Solution 2**: Import WebKit in your code
     ```swift
     import WebKit
     import CashfreePG
     ```
   - **Solution 3**: For SPM projects, ensure WebKit is added to your Package.swift dependencies:
     ```swift
     .target(
         name: "YourApp",
         dependencies: [
             .product(name: "CashfreePG", package: "core-ios-sdk")
         ],
         linkerSettings: [
             .linkedFramework("WebKit")
         ]
     )
     ```

### Support

For additional support:
- Check our [official documentation](https://docs.cashfree.com/docs/ios-native)
- File an issue on [GitHub](https://github.com/cashfree/core-ios-sdk/issues)
- Join our [Discord community](https://discord.gg/znT6X45qDS)
- Email us at care@cashfree.com

## Migration from CocoaPods

If you're migrating from CocoaPods to SPM:

1. Remove the Cashfree pods from your `Podfile`
2. Run `pod install` to remove the frameworks
3. Remove the CocoaPods-generated workspace if no other pods remain
4. Follow the SPM installation steps above
5. Update your import statements if necessary

The API remains the same, so no code changes should be required.