**CLASS**

# `CFWalletPayment.CFWalletPaymentBuilder`

```swift
@objc final public class CFWalletPaymentBuilder: NSObject
```

The CFWalletPaymentBuilder class can be used to create an object of CFWalletPayment. It consists of setter methods to set the values for *CFWallet*, *CFSession*. And finally a *build* method that returns an object of *CFWalletPayment*.

## Methods
### `init()`

```swift
public override init()
```

### `setSession(_:)`

```swift
@objc public func setSession(_ session: CFSession) -> CFWalletPaymentBuilder
```

This method sets the value for CFSession variable of the CFWalletPayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFWalletPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `setWallet(_:)`

```swift
@objc public func setWallet(_ wallet: CFWallet) -> CFWalletPaymentBuilder
```

This method sets the value for CFWallet variable of the CFWalletPayment class
- Parameter wallet: It takes a parameter of type CFWallet
- Returns: It returns an instance of *CFWalletPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| wallet | It takes a parameter of type CFWallet |

### `build()`

```swift
@objc public func build() throws -> CFWalletPayment
```

This method builds an object of *CFWalletPayment*
- Throws: It throws an error (CashfreeError), in case *CFWallet* or *CFSession* is not set.
- Returns: It returns an object of *CFWalletPayment*
