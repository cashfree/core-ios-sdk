**CLASS**

# `CFUPIPayment.CFUPIPaymentBuilder`

```swift
@objc final public class CFUPIPaymentBuilder: NSObject
```

The CFUPIPaymentBuilder class can be used to create an object of CFUPIPayment. It consists of setter methods to set the values for *CFUPI*, *CFSession*. And finally a *build* method that returns an object of *CFUPIPayment*.

## Methods
### `init()`

```swift
public override init()
```

### `setUPI(_:)`

```swift
@objc public func setUPI(_ upi: CFUPI) -> CFUPIPaymentBuilder
```

This method sets the value for CFUPI variable of the CFUPIPayment class
- Parameter upi: It takes a parameter of type CFUPI
- Returns: It returns an instance of *CFUPIPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| upi | It takes a parameter of type CFUPI |

### `setSession(_:)`

```swift
@objc public func setSession(_ session: CFSession) -> CFUPIPaymentBuilder
```

This method sets the value for CFSession variable of the CFUPIPayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFUPIPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `build()`

```swift
@objc public func build() throws -> CFUPIPayment
```

This method builds an object of *CFUPIPayment*
- Throws: It throws an error (CashfreeError), in case *CFUPI* or *CFSession* is not set.
- Returns: It returns an object of *CFUPIPayment*
