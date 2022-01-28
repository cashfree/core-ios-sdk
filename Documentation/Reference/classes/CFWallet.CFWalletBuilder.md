**CLASS**

# `CFWallet.CFWalletBuilder`

```swift
@objc final public class CFWalletBuilder: NSObject
```

The *CFWalletBuilder* class consists of all the setters that are needed to build an object of type `CFWallet`

## Methods
### `init()`

```swift
public override init()
```

### `setChannel(_:)`

```swift
@objc public func setChannel(_ channel: String) -> CFWalletBuilder
```

This method sets the value as to which wallet has to be used to make payment.
- Parameter channel: The parameter takes in a String and the value has to be the name of the wallet (*gpay,phonepe,paytm,amazon,airtel,freecharge,mobikwik,jio,ola*)
- Returns: It returns an instance of *CFWalletBuilder* to continue building the *CFWallet* object

#### Parameters

| Name | Description |
| ---- | ----------- |
| channel | The parameter takes in a String and the value has to be the name of the wallet () |

### `setPhone(_:)`

```swift
@objc public func setPhone(_ phone: String) -> CFWalletBuilder
```

This method sets the phone number to authenticate the wallet account and make payment
- Parameter phone: The parameter takes in a String, which is the phone number.
- Returns: It returns an instance of *CFWalletBuilder* to continue building the *CFWallet* object

#### Parameters

| Name | Description |
| ---- | ----------- |
| phone | The parameter takes in a String, which is the phone number. |

### `build()`

```swift
@objc public func build() throws -> CFWallet
```

The method creates an object of *CFWallet*
- Throws: In case the mandatory parameters are empty, an exception gets thrown
- Returns: It returns an object of *CFWallet*
