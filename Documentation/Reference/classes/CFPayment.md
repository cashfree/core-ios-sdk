**CLASS**

# `CFPayment`

```swift
@objc public class CFPayment: NSObject
```

CFPaymentObject is a parent class for all the payment objects (Card, Netbanking, Wallet, UPI)

## Methods
### `init()`

```swift
public override init()
```

### `printDescription()`

```swift
@objc public func printDescription()
```

### `setPlatform(_:)`

```swift
@objc final public func setPlatform(_ platform: CFPLATFORM)
```

This method sets the platform that is being used when invoking the payment mode
- Parameter platform: It is of type CFPLATFORM, which is an enum. By default it is set to iOS

#### Parameters

| Name | Description |
| ---- | ----------- |
| platform | It is of type CFPLATFORM, which is an enum. By default it is set to iOS |