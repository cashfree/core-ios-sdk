**CLASS**

# `CFNetbankingPayment.CFNetbankingPaymentBuilder`

```swift
@objc final public class CFNetbankingPaymentBuilder: NSObject
```

The CFNetbankingPaymentBuilder class can be used to create an object of CFNetbankingObject. It consists of setter methods to set the values for *CFNetbanking*, *CFSession*. And finally a *build* method that returns an object of *CFNetbankingPayment*.

## Methods
### `init()`

```swift
public override init()
```

### `setSession(_:)`

```swift
@objc public func setSession(_ session: CFSession) -> CFNetbankingPaymentBuilder
```

This method sets the value for CFSession variable of the CFNetbankingPayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFNetbankingPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `setNetbanking(_:)`

```swift
@objc public func setNetbanking(_ netbanking: CFNetbanking) -> CFNetbankingPaymentBuilder
```

This method sets the value for CFNetbanking variable of the CFNetbankingPayment class
- Parameter netbanking: It takes a parameter of type CFNetbanking
- Returns: It returns an instance of *CFNetbankingPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| netbanking | It takes a parameter of type CFNetbanking |

### `build()`

```swift
@objc public func build() throws -> CFNetbankingPayment
```

This method builds an object of *CFNetbankingPayment*
- Throws: It throws an error (CashfreeError), in case *CFNetbanking* or *CFSession* is not set.
- Returns: It returns an object of *CFNetbankingPayment*
