**CLASS**

# `CFEMICard.CFEMICardBuilder`

```swift
@objc final public class CFEMICardBuilder: NSObject
```

This class provides builder methods that help in creating an object of `CFEMICard`

## Methods
### `init()`

```swift
public override init()
```

No Argument Constructor. The method variables will be set using setters

### `setCardNumber(_:)`

```swift
public func setCardNumber(_ number: String) -> CFEMICardBuilder
```

The method sets the value of the card number to the CFEMICard Object.
- Parameter number: The card number has to be sent as the parameter in String format.
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| number | The card number has to be sent as the parameter in String format. |

### `setCardHolderName(_:)`

```swift
public func setCardHolderName(_ name: String) -> CFEMICardBuilder
```

The method sets the value of the card holder's name to the CFEMICard Object
- Parameter name: The card holders name has to be sent as the parameter.
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| name | The card holders name has to be sent as the parameter. |

### `setCardExpiryMonth(_:)`

```swift
public func setCardExpiryMonth(_ month: String) -> CFEMICardBuilder
```

The method sets the value of the card expiry month to the CFEMICard Object
- Parameter month: The card's expiry month has to be sent as the parameter in "mm" format.
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| month | The card’s expiry month has to be sent as the parameter in “mm” format. |

### `setCardExpiryYear(_:)`

```swift
public func setCardExpiryYear(_ year: String) -> CFEMICardBuilder
```

The method sets the value of the card expiry year to the CFEMICard Object
- Parameter year: The card's expiry year has to be sent as the parameter in "yy" format.
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| year | The card’s expiry year has to be sent as the parameter in “yy” format. |

### `setCVV(_:)`

```swift
public func setCVV(_ cvv: String) -> CFEMICardBuilder
```

The method sets the value of the card cvv to the CFEMICard object
- Parameter cvv: The card's cvv has to be sent as the parameter.
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| cvv | The card’s cvv has to be sent as the parameter. |

### `setBankName(_:)`

```swift
public func setBankName(_ bankName: String) -> CFEMICardBuilder
```

The method sets the value of the bank name to the CFEMICard object
- Parameter bankName: The bank name has to be sent as the parameter
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| bankName | The bank name has to be sent as the parameter |

### `setEMITenure(_:)`

```swift
public func setEMITenure(_ tenure: Int) -> CFEMICardBuilder
```

The method sets the value of the EMI Tenure to the CFEMICard object
- Parameter tenure: The number of months that the EMI has to be enabled has to be sent as the parameter
- Returns: The method returns an instance of CFEMICardBuilder to continue building the CFEMICard object

#### Parameters

| Name | Description |
| ---- | ----------- |
| tenure | The number of months that the EMI has to be enabled has to be sent as the parameter |

### `build()`

```swift
public func build() throws -> CFEMICard
```

This method builds an object of CFEMICard and returns the object to the user. This CFEMICard object will be used in initiating card payment.
- Throws: An error is thrown in case the mandatory parameters are nil or empty.
- Returns: The method returns an instance (object) of CFEMICard.
