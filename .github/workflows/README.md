# GitHub Actions Workflow for Swift Package Manager

This repository contains a comprehensive GitHub Actions workflow for validating the CashfreePG iOS SDK as a Swift package.

## 🤖 What the Workflow Does (Automatically)

### Swift Package Manager Validation (`swift-package-manager.yml`)

**Triggers:**
- **Pull Requests** to main/master/develop branches
- **Pushes** to main/master branches  
- **Tag pushes** (semantic versions like `1.0.11` or `v1.0.11`)
- **Manual dispatch** with validation or release mode options

**Comprehensive Validation Steps:**
1. ✅ **Swift Package Registry Requirements**
   - Validates Package.swift exists and outputs valid JSON
   - Checks Swift tools version (≥5.0 required)
   - Verifies library products are declared
   - Validates platform support declarations
   - Confirms repository URL format

2. ✅ **Dependencies & Build Validation**
   - Resolves all package dependencies
   - Validates binary package structure (XCFramework-only)
   - Ensures package meets SPM compilation standards

3. ✅ **XCFramework Validation**
   - Verifies Info.plist presence in each framework
   - Validates framework directory structure
   - Checks binary architecture support

4. ✅ **Test Execution** (if available)
   - Runs test targets when present
   - Skips gracefully for binary-only packages

5. ✅ **Detailed Reporting**
   - Generates comprehensive validation summary
   - Shows results in GitHub Actions dashboard
   - Provides clear success/failure feedback

## 🔐 Setup & Authentication

### **❌ NO AUTHENTICATION REQUIRED**

This workflow operates in **validation-only mode** and requires:

- ✅ **No secret keys** or tokens
- ✅ **No external service authentication**
- ✅ **No manual configuration**
- ✅ **Works immediately** on any public repository

### **Current Implementation Focus:**
```yaml
name: Swift Package Manager
# Comprehensive validation workflow
# No external publishing - validation only
```

The workflow ensures your package meets all Swift Package Manager standards without requiring any external service integration.

## 🚀 How to Use

### **Development Workflow:**

#### Option A: Pull Request Validation �
1. Create a PR that modifies:
   - `Package.swift`
   - Any `*.xcframework/**` files
   - Any `*.podspec` files
2. Workflow **automatically validates** the changes
3. Review validation results in the PR checks
4. Merge when validation passes

#### Option B: Tag-Based Validation 🏷️
```bash
# Create and push tag for validation
git tag 1.0.11
git push origin 1.0.11

# Workflow runs automatically in validation mode
# Check Actions tab for detailed results
```

#### Option C: Manual Validation 🔧
1. Go to your repository → **Actions** tab
2. Click **"Swift Package Manager"**
3. Click **"Run workflow"**
4. Choose:
   - **Action**: `validate` (recommended) or `release`
   - **Version**: Optional version number for manual release validation
5. Click **"Run workflow"**

### **Validation Modes:**

- **Pull Request**: Validates proposed changes
- **Push to main/master**: Validates current state
- **Tag push**: Validates tagged version (no publishing)
- **Manual validate**: On-demand validation
- **Manual release**: Release preparation validation

## � Package Distribution

### **Current Package Structure:**
- **Name**: CashfreePG
- **Type**: Binary package (XCFramework-only)
- **Platform**: iOS 12.0+
- **Swift**: 5.7+

### **Available Products:**
- `CashfreePG` - Main SDK
- `CashfreePGCoreSDK` - Core functionality
- `CashfreePGUISDK` - UI components
- `CashfreeAnalyticsSDK` - Analytics
- `CFNetworkSDK` - Networking

### **Installation Methods:**

#### Swift Package Manager (GitHub)
```swift
dependencies: [
    .package(url: "https://github.com/your-org/core-ios-sdk.git", from: "1.0.11")
]
```

#### CocoaPods (Existing)
```ruby
pod 'CashfreePG', '~> 1.0.11'
```

**Note**: The workflow validates package compatibility but does not automatically publish to external registries.

## 🎯 Validation Conditions

### ✅ **Workflow Triggers:**
- **PR validation**: Automatic on Package.swift, XCFramework, or Podspec changes
- **Branch validation**: Automatic on pushes to main/master
- **Tag validation**: `1.0.0`, `1.0.1`, `1.0.11`, `v1.0.11` (semantic versions)
- **Manual validation**: Available anytime from GitHub Actions

### ✅ **Validation Criteria:**
- Package.swift syntax and structure
- Swift tools version ≥5.7
- Platform declarations (iOS 12.0+)
- Library products exist
- XCFramework structure
- Dependency resolution
- Repository accessibility

### ❌ **Validation Will Fail For:**
- Missing Package.swift
- Invalid Swift tools version
- Missing platform declarations
- Malformed XCFrameworks
- Dependency resolution issues
- Invalid package structure

## 📦 Package Installation (For Your Users)

After successful validation, users can install via:

### Swift Package Manager (GitHub)
```swift
dependencies: [
    .package(url: "https://github.com/your-org/core-ios-sdk.git", from: "1.0.11")
]
```

### CocoaPods (Existing)
```ruby
pod 'CashfreePG', '~> 1.0.11'
```

## 🔧 Technical Implementation Details

### Workflow Architecture

The workflow uses a single comprehensive file with two main jobs:

1. **`validate`** - Main validation job
   - Runs on macOS-latest with Xcode latest-stable
   - Performs comprehensive Swift Package Registry compliance checks
   - Validates binary package structure
   - Outputs version and validation status

2. **`validation_summary`** - Reporting job
   - Generates detailed validation report
   - Shows results in GitHub Actions summary
   - Provides clear pass/fail status

### Binary Package Optimization

Since CashfreePG is a binary package (XCFramework-only):
- Skips source code compilation when appropriate
- Validates binary target structure
- Focuses on SPM compliance for binary packages

## 🔧 Validation Steps Details

### Phase 1: Swift Package Registry Requirements ✅

1. **Package.swift Validation**
   - Verifies file exists in repository root
   - Validates JSON output from `swift package dump-package`
   - Checks Swift tools version compatibility (≥5.7)

2. **Products & Platforms Validation**
   - Ensures library products are declared
   - Validates platform support declarations (iOS 12.0+)
   - Confirms repository URL format compliance

### Phase 2: Dependencies & Build ✅

3. **Dependency Resolution**
   - Runs `swift package resolve`
   - Validates all dependencies are accessible
   - Ensures package dependencies are compatible

4. **Build Validation**
   - Detects binary vs source package type
   - Skips compilation for binary-only packages
   - Validates package structure integrity

### Phase 3: Binary Package Validation ✅

5. **XCFramework Validation**
   - Checks Info.plist presence in each framework
   - Validates framework directory structure
   - Ensures binary target declarations match files

6. **Test Execution**
   - Runs test targets if available
   - Gracefully handles binary packages (no tests)
   - Reports test results

### Supported Platforms & Requirements
- **iOS:** 12.0+
- **Swift:** 5.7+
- **Xcode:** Latest stable version
- **Runner:** macOS-latest
- **Package Type:** Binary package with XCFrameworks

## 🔍 Monitoring & Validation Results

### **Check Validation Status**
1. Go to repository → **Actions** tab
2. Look for **"Swift Package Manager"** workflow
3. Click on any run to see detailed validation logs
4. Each step shows success/failure with detailed output

### **Understanding Validation Results**

#### ✅ **Successful Validation Shows:**
- All Swift Package Registry requirements met
- Dependencies resolved successfully
- Binary package structure validated
- XCFrameworks properly configured
- Package ready for distribution

#### ❌ **Failed Validation Indicates:**
```bash
Common Issues & Solutions:

1. Package.swift Syntax Error
   → Run locally: swift package dump-package
   → Fix syntax errors in Package.swift

2. Platform Declaration Missing
   → Add platforms array: platforms: [.iOS(.v12)]
   → Ensure minimum iOS version specified

3. XCFramework Structure Invalid
   → Check Info.plist exists in each *.xcframework/
   → Verify framework directory structure

4. Dependency Resolution Failed
   → Run locally: swift package resolve
   → Check all dependencies are accessible
```

### **Validation Report Features**
- Comprehensive summary in GitHub Actions
- Step-by-step validation results
- Clear success/failure indicators
- Actionable error messages for quick fixes

## 🎉 Expected Validation Results

After successful workflow execution:

1. ✅ **Package Structure Validated**
   - Swift Package Manager compliance confirmed
   - Binary package structure verified
   - All requirements met

2. ✅ **Compatibility Confirmed**
   - iOS 12.0+ platform support validated
   - Swift 5.7+ tools version confirmed
   - XCFramework structure verified

3. ✅ **Distribution Ready**
   - Package can be used via Swift Package Manager
   - CocoaPods integration remains functional
   - All products (libraries) properly declared

4. ✅ **Development Workflow Enhanced**
   - Automated validation on PRs
   - Clear feedback on package changes
   - Prevents SPM compatibility issues

## 📋 Current Workflow Structure

```
.github/
└── workflows/
    ├── README.md (📚 This comprehensive guide)
    └── swift-package-manager.yml (� Complete validation workflow)
```

**Single workflow approach provides:**
- Unified validation process
- Consistent results across all triggers
- Simplified maintenance
- Clear documentation

## 🚀 Current Workflow Status

### **✅ What Works Automatically:**
- Swift Package Manager compliance validation
- Binary package structure verification
- XCFramework validation
- Dependency resolution testing
- Platform compatibility checking
- Automated validation on PRs and releases

### **🎯 Workflow Focus:**
- **Validation-first approach** ensures package quality
- **No external dependencies** - works entirely within GitHub
- **Binary package optimized** for XCFramework distribution
- **Developer-friendly** with clear feedback and reporting

## 📚 Additional Resources

- [Swift Package Manager Documentation](https://swift.org/package-manager/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Swift Package Manager Binary Targets](https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html#binarytarget)
- [XCFramework Documentation](https://developer.apple.com/documentation/xcode/creating_a_multi-platform_binary_framework_bundle)

## ✨ Quick Start Guide

**Ready to validate your package:**

1. **Push changes:** Any commit to main/master triggers validation
2. **Create PR:** Automatic validation on Package.swift changes  
3. **Tag release:** `git tag 1.0.11 && git push origin 1.0.11`
4. **Manual validation:** Use workflow dispatch from Actions tab
5. **Review results:** Check detailed reports in GitHub Actions

**Zero configuration required - validation runs automatically!** 🚀

## � Summary

1. ✅ **COMPREHENSIVE VALIDATION** - Ensures Swift Package Manager compliance
2. ✅ **BINARY PACKAGE OPTIMIZED** - Perfect for XCFramework distribution  
3. ✅ **ZERO CONFIGURATION** - Works immediately without setup
4. ✅ **DEVELOPER FRIENDLY** - Clear feedback and actionable error messages

**Your workflow provides complete Swift Package Manager validation with no external dependencies!**

---

*This workflow ensures your Swift package meets all SPM standards for reliable distribution via Swift Package Manager and CocoaPods.*
