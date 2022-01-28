**CLASS**

# `CFQRCodePayment.CFQRCodePaymentBuilder`

```swift
@objc final public class CFQRCodePaymentBuilder: NSObject
```

The CFQRCodePaymentBuilder class can be used to create an object of CFQRCodePayment. It consists of setter methods to set the values for *CFSession* . And finally a *build* method that returns an object of *CFQRCodePayment*.

## Methods
### `init()`

```swift
public override init()
```

No Argument Constructor

### `setSession(_:)`

```swift
public func setSession(_ session: CFSession) -> CFQRCodePaymentBuilder
```

This method sets the value for CFSession variable of the CFQRCodePayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFQRCodePaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `build()`

```swift
public func build() throws -> CFQRCodePayment
```

This method builds an object of *CFQRCodePayment*
- Throws: It throws an error (CashfreeError), in case *CFSession* is not set.
- Returns: It returns an object of *CFQRCodePayment*
