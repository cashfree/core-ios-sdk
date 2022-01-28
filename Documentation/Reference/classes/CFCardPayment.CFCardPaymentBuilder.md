**CLASS**

# `CFCardPayment.CFCardPaymentBuilder`

```swift
@objc final public class CFCardPaymentBuilder: NSObject
```

The CFCardPaymentBuilder class can be used to create an object of CFCardPayment. It consists of setter methods to set the values for *CFCard*, *CFSession* . And finally a *build* method that returns an object of *CFCardPayment*.

## Methods
### `init()`

```swift
public override init()
```

### `setCard(_:)`

```swift
@objc public func setCard(_ card: CFCard) -> CFCardPaymentBuilder
```

This method sets the value for CFCard variable of the CFCardPayment class
- Parameter card: It takes a parameter of type CFCard
- Returns: It returns an instance of *CFCardPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| card | It takes a parameter of type CFCard |

### `savePaymentMethod(_:)`

```swift
@objc public func savePaymentMethod(_ flag: Bool) -> CFCardPaymentBuilder
```

This method is used to save the payment method that is being used, making it easier for future payments.
- Parameter flag: The method accepts a boolean value. By default it is set to "false"
- Returns: It returns an instance of *CFCardPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| flag | The method accepts a boolean value. By default it is set to “false” |

### `setSession(_:)`

```swift
@objc public func setSession(_ session: CFSession) -> CFCardPaymentBuilder
```

This method sets the value for CFSession variable of the CFCardPayment class
- Parameter session: It takes a parameter of type CFSession
- Returns: It returns an instance of *CFCardPaymentBuilder* to continue the build process

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | It takes a parameter of type CFSession |

### `build()`

```swift
@objc public func build() throws -> CFCardPayment
```

This method builds an object of *CFCardPayment*
- Throws: It throws an error (CashfreeError), in case *CFCard* or *CFSession* is not set.
- Returns: It returns an object of *CFCardPayment*
