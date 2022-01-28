**CLASS**

# `CFNetbanking.CFNetbankingBuilder`

```swift
@objc final public class CFNetbankingBuilder: NSObject
```

CFNetbankingBuilder class consists of all the setters that are needed to build an object of type `CFNetbanking`

## Methods
### `init()`

```swift
public override init()
```

No Argument constructor. All variables are set using builder-setters

### `setBankCode(_:)`

```swift
@objc public func setBankCode(_ code: Int) -> CFNetbankingBuilder
```

This methos sets the bank code (Visit https://dev.cashfree.com/payment-gateway/payments/netbanking for all the bank codes)
- Parameter code: A parameter of type Integer is taken as input, which is the bank code
- Returns: It returns an instance of *CFNetbankingBuilder* to continue building the *CFNetbanking* object

#### Parameters

| Name | Description |
| ---- | ----------- |
| code | A parameter of type Integer is taken as input, which is the bank code |

### `build()`

```swift
@objc public func build() throws -> CFNetbanking
```

This method creates an object of CFNetbanking
- Throws: In case there is any mandatory parameter missing, it throws an exception
- Returns: The method returns an object of type *CFNetbanking* which can be used to initiate Netbanking payment mode.
