# Swift Package Manager Integration Guide

This comprehensive guide provides detailed instructions for integrating the Cashfree iOS SDK using Swift Package Manager (SPM).

## Overview

The Cashfree iOS SDK consists of multiple frameworks that work together to provide a complete payment solution:

- **CashfreePG** - Main SDK that includes all payment functionality (recommended for most use cases)
- **CashfreePGCoreSDK** - Core payment processing functionality
- **CashfreePGUISDK** - Pre-built UI components for payment flows
- **CashfreeAnalyticsSDK** - Analytics and tracking functionality
- **CFNetworkSDK** - Network layer for API communication

## 📦 Installation Methods

### Method 1: Xcode GUI (Recommended for Beginners)

1. **Open your iOS project** in Xcode
2. **Navigate to your project settings**
   - Click on your project name in the navigator
   - Select your app target
3. **Go to Package Dependencies**
   - Click on the **Package Dependencies** tab
   - Click the **+** button to add a new package
4. **Add the Cashfree SDK**
   - Enter the repository URL: `https://github.com/cashfree/core-ios-sdk.git`
   - Choose your preferred version rule:
     - **Up to Next Major Version** (recommended): Automatically gets bug fixes and new features
     - **Up to Next Minor Version**: Gets bug fixes only
     - **Exact Version**: Locks to a specific version
5. **Select Products**
   - For most use cases, select **CashfreePG** (includes all dependencies)
   - For custom implementations, select individual components as needed
6. **Add to Target**
   - Ensure the package is added to your app target
   - Click **Add Package**

### Method 2: Package.swift (For Swift Packages)

Add the following to your `Package.swift` file:

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "YourApp",
    platforms: [
        .iOS(.v12)  // Minimum iOS version supported
    ],
    dependencies: [
        .package(
            url: "https://github.com/cashfree/core-ios-sdk.git",
            from: "2.5.5"
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

### Method 3: Xcode Project with Package.swift Dependencies

If you're adding SPM to an existing Xcode project programmatically:

1. Create a `Package.swift` file in your project root
2. Add the dependencies as shown in Method 2
3. In Xcode, go to **File** → **Add Package Dependencies**
4. Select **Add Local** and choose your `Package.swift` file

## 🔧 Configuration

### Import Statements

Add the following import statements to your Swift files:

```swift
import CashfreePG
import CashfreePGCoreSDK  // If using separately
import CashfreePGUISDK   // If using separately
```

### Basic Setup

```swift
import UIKit
import CashfreePG

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Cashfree SDK
        CFSDKConfiguration.shared.setEnvironment(.SANDBOX) // or .PRODUCTION
    }
}
```

## ⚠️ Common Issues and Solutions

### 1. WebKit Framework Not Found

**Problem:** Build error: "WebKit framework not found"

**Solution 1: Manual Framework Addition**
1. Select your project → Target → **Build Phases**
2. Expand **Link Binary With Libraries**
3. Click **+** and add **WebKit.framework**

**Solution 2: Package.swift Configuration**
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

**Solution 3: Build Settings**
1. Select your target → **Build Settings**
2. Search for "Other Linker Flags"
3. Add `-framework WebKit`

### 2. Binary Target Issues

**Problem:** "Binary target 'XXX' is not available for the current platform"

**Solution:**
- Ensure you're building for iOS 12.0 or later
- Check that you're using a supported architecture (arm64 for device, x86_64/arm64 for simulator)
- Clean build folder: **Product** → **Clean Build Folder**

### 3. Version Conflicts

**Problem:** Dependency resolution errors

**Solution:**
1. Update to latest Xcode version
2. Reset package caches: **File** → **Packages** → **Reset Package Caches**
3. Update packages: **File** → **Packages** → **Update to Latest Package Versions**

### 4. Build Errors with Multiple Targets

**Problem:** Package not found in test targets or extensions

**Solution:**
Add the package to all relevant targets:
```swift
.testTarget(
    name: "YourAppTests",
    dependencies: [
        "YourApp",
        .product(name: "CashfreePG", package: "core-ios-sdk")
    ]
)
```

## 🏗️ Advanced Configuration

### Custom Target Setup

For advanced users who need specific components:

```swift
.target(
    name: "PaymentModule",
    dependencies: [
        .product(name: "CashfreePGCoreSDK", package: "core-ios-sdk"),
        .product(name: "CFNetworkSDK", package: "core-ios-sdk")
    ]
),
.target(
    name: "UIModule", 
    dependencies: [
        .product(name: "CashfreePGUISDK", package: "core-ios-sdk"),
        "PaymentModule"
    ]
)
```

### Environment-Specific Configurations

```swift
#if DEBUG
    dependencies: [
        .package(url: "https://github.com/cashfree/core-ios-sdk.git", branch: "develop")
    ]
#else
    dependencies: [
        .package(url: "https://github.com/cashfree/core-ios-sdk.git", from: "2.5.5")
    ]
#endif
```

## 📱 Platform Support

### Minimum Requirements
- **iOS**: 12.0+
- **Xcode**: 14.0+
- **Swift**: 5.7+

### Supported Architectures
- **Device**: arm64
- **Simulator**: x86_64, arm64 (Apple Silicon Macs)

### Platform Declaration
Always specify minimum platform versions in your Package.swift:

```swift
platforms: [
    .iOS(.v12),
    .macOS(.v10_15) // If needed
]
```

## 🔍 Verification Steps

After installation, verify everything is working:

1. **Build your project** - Should compile without errors
2. **Import test** - Try importing `CashfreePG` in a Swift file
3. **Basic initialization** - Test SDK initialization code
4. **Run on device/simulator** - Ensure it works on both

```swift
// Quick verification code
import CashfreePG

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This should not crash
        CFSDKConfiguration.shared.setEnvironment(.SANDBOX)
        print("✅ Cashfree SDK loaded successfully")
    }
}
```

## 🚀 Next Steps

After successful installation:

1. **[API Documentation](https://docs.cashfree.com/docs/ios)** - Learn about available APIs
2. **[Sample Code](./Swift+Sample+Application/)** - Check out example implementations
3. **[Integration Guide](https://docs.cashfree.com/docs/ios-native)** - Step-by-step integration
4. **[Migration Guide](https://docs.cashfree.com/docs/ios-migration)** - Upgrading from older versions

## 📞 Support

If you encounter any issues:

1. **Check this guide** for common solutions
2. **[GitHub Issues](https://github.com/cashfree/core-ios-sdk/issues)** - Report bugs or ask questions
3. **[Discord Community](https://discord.gg/znT6X45qDS)** - Get help from developers
4. **Email Support** - contact care@cashfree.com

## 📋 Troubleshooting Checklist

- [ ] iOS deployment target is 12.0 or higher
- [ ] Using Xcode 14.0 or newer
- [ ] WebKit framework is linked
- [ ] Package caches have been reset if needed
- [ ] All targets that use the SDK have it as a dependency
- [ ] Build settings are correct for your architecture
- [ ] No conflicting dependencies

---

## 🔄 Updates and Versioning

The Cashfree iOS SDK follows [Semantic Versioning](https://semver.org/):

- **Major** (x.0.0): Breaking changes
- **Minor** (x.y.0): New features, backward compatible
- **Patch** (x.y.z): Bug fixes, backward compatible

**Recommended version specification:**
```swift
.package(url: "https://github.com/cashfree/core-ios-sdk.git", from: "2.5.5")
```

This allows automatic updates for bug fixes and new features while preventing breaking changes.