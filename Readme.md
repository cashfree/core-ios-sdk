# Cashfree iOS SDK Sample

![GitHub](https://img.shields.io/github/license/cashfree/core-ios-sdk) ![Discord](https://img.shields.io/discord/931125665669972018?label=discord) ![GitHub last commit (branch)](https://img.shields.io/github/last-commit/cashfree/core-ios-sdk/master) ![GitHub release (with filter)](https://img.shields.io/github/v/release/cashfree/core-ios-sdk?label=latest) ![GitHub forks](https://img.shields.io/github/forks/cashfree/core-ios-sdk) ![GitHub Repo stars](https://img.shields.io/github/stars/cashfree/core-ios-sdk)


![Sample Banner Image](https://maven.cashfree.com/images/github-header-image-ios.png)

## **Description** 

Sample integration project for Cashfree Payment Gateway's iOS SDK, facilitating seamless and secure payment processing within your iOS application.



## 📦 Installation

### Swift Package Manager (Recommended)

The easiest way to integrate Cashfree iOS SDK is through Swift Package Manager

#### ** Xcode GUI**
1. Open your project in Xcode
2. Go to **File** > **Add Package Dependencies**
3. Enter the repository URL: `https://github.com/cashfree/core-ios-sdk.git`
4. Select the version rule (recommend "Up to Next Major Version")
5. Choose the products you need:
   - `CashfreePG` - Complete Payment Gateway SDK (recommended)
   - `CashfreePGCoreSDK` - Core payment processing
   - `CashfreePGUISDK` - UI components
   - `CashfreeAnalyticsSDK` - Analytics and tracking
   - `CFNetworkSDK` - Networking layer


#### **⚠️ WebKit Integration Note**
If you encounter "WebKit framework not found" errors with SPM, manually add WebKit framework:

1. Select your project → Target → **Build Phases**
2. **Link Binary With Libraries** → Add **WebKit.framework**
3. Or add to your Package.swift:

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


### CocoaPods

Add the following to your `Podfile`:

```ruby
pod 'CashfreePG', '~> 2.2.4'
```

Then run:
```bash
pod install
```

## Documentation

The Cashfree iOS SDK allows you to integrate Cashfree Payment Gateway into your application and start collecting payments from your customers. It has been designed to minimise the complexity of handling and integrating payments in your iOS project

- **[API Documentation](https://docs.cashfree.com/docs/ios)** - Complete API reference  

### Getting Started

Please replace the values for orderId, token (Payment Session ID) and environment in the example iOS project inside the repo and run the application.

```swift
    static var environment: CFENVIRONMENT = .SANDBOX
    static let payment_session_id = "payment_session_id"
    static let order_id = "order_id"

```


| Please refer our official iOS documentation [here](https://docs.cashfree.com/docs/ios-native).


## Getting help

If you have questions, concerns, bug reports, etc, you can reach out to us using one of the following 

1. File an issue in this repository's Issue Tracker.
2. Send a message in our discord channel. Join our [discord server](https://discord.gg/znT6X45qDS) to get connected instantly.
3. Send an email to care@cashfree.com

## Getting involved

For general instructions on _how_ to contribute please refer to [CONTRIBUTING](CONTRIBUTING.md).


----

## Open source licensing and other misc info
1. [LICENSE](https://github.com/cashfree/core-ios-sdk/blob/master/LICENSE.md)
2. [CODE OF CONDUCT](https://github.com/cashfree/core-ios-sdk/blob/master/CODE_OF_CONDUCT.md)
