**CLASS**

# `CFEMICardPayment.CFEMICardPaymentBuilder`

```swift
@objc public class CFEMICardPaymentBuilder: NSObject
```

The CFEMICardPaymentBuilder class can be used to create an object of CFEMICardPayment. It consists of setter methods to set the values for *CFEMICard*, *CFSession*. And finally a *build* method that returns an object of *CFEMICardPayment*.

## Methods
### `init()`

```swift
public override init()
```

### `setCard(_:)`

```swift
@objc public func setCard(_ card: CFEMICard) -> CFEMICardPaymentBuilder
```

This method sets the value for CFEMICard variable of the CFEMICardPayment class
- Parameter card: It takes a parameter of type CFEMICard
- Returns: It returns an instance of *CFEMICardPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| card | It takes a parameter of type CFEMICard |

### `savePaymentMethod(_:)`

```swift
@objc public func savePaymentMethod(_ flag: Bool) -> CFEMICardPaymentBuilder
```

### `setSession(_:)`

```swift
@objc public func setSession(_ session: CFSession) -> CFEMICardPaymentBuilder
```

This method sets the value for CFSession variable of the CFEMICardPayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFEMICardPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `build()`

```swift
@objc public func build() throws -> CFEMICardPayment
```

This method builds an object of *CFEMICardPayment*
- Throws: It throws an error (CashfreeError), in case *CFEMICard* or *CFSession* is not set.
- Returns: It returns an object of *CFEMICardPayment*
