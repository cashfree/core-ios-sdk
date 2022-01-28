**CLASS**

# `CFCard.CFCardBuilder`

```swift
@objc final public class CFCardBuilder: NSObject
```

This class provides builder methods that help in creating an object of `CFCard`

## Methods
### `init()`

```swift
public override init()
```

No Argument Constructor. The method variables will be set using setters

### `setCardNumber(_:)`

```swift
public func setCardNumber(_ number: String) -> CFCardBuilder
```

The method sets the value of the card number to the CFCard Object.
- Parameter number: The card number has to be sent as the parameter in String format.
- Returns: The method returns an instance of CFCardBuilder to continue building the CFCard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| number | The card number has to be sent as the parameter in String format. |

### `setCardHolderName(_:)`

```swift
public func setCardHolderName(_ name: String) -> CFCardBuilder
```

The method sets the value of the card holder's name to the CFCard Object
- Parameter name: The card holders name has to be sent as the parameter.
- Returns: The method returns an instance of CFCardBuilder to continue building the CFCard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| name | The card holders name has to be sent as the parameter. |

### `setCardExpiryMonth(_:)`

```swift
public func setCardExpiryMonth(_ month: String) -> CFCardBuilder
```

The method sets the value of the card expiry month to the CFCard Object
- Parameter month: The card's expiry month has to be sent as the parameter in "mm" format.
- Returns: The method returns an instance of CFCardBuilder to continue building the CFCard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| month | The card’s expiry month has to be sent as the parameter in “mm” format. |

### `setCardExpiryYear(_:)`

```swift
public func setCardExpiryYear(_ year: String) -> CFCardBuilder
```

The method sets the value of the card expiry year to the CFCard Object
- Parameter year: The card's expiry year has to be sent as the parameter in "yy" format.
- Returns: The method returns an instance of CFCardBuilder to continue building the CFCard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| year | The card’s expiry year has to be sent as the parameter in “yy” format. |

### `setCVV(_:)`

```swift
public func setCVV(_ cvv: String) -> CFCardBuilder
```

The method sets the value of the card cvv to the CFCard object
- Parameter cvv: The card's cvv has to be sent as the parameter.
- Returns: The method returns an instance of CFCardBuilder to continue building the CFCard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| cvv | The card’s cvv has to be sent as the parameter. |

### `build()`

```swift
public func build() throws -> CFCard
```

This method builds an object of CFCard and returns the object to the user. This CFCard object will be used in initiating card payment.
- Throws: An error is thrown in case the mandatory parameters are nil or empty.
- Returns: The method returns an instance (object) of CFCard.
