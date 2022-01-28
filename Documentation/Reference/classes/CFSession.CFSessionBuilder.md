**CLASS**

# `CFSession.CFSessionBuilder`

```swift
final public class CFSessionBuilder: NSObject
```

This class provides builder methods that help in creating an object of `CFSession`

## Methods
### `init()`

```swift
public override init()
```

No Arguments Constructor

### `setOrderToken(_:)`

```swift
public func setOrderToken(_ token: String) -> CFSessionBuilder
```

The method sets the value of the generated token to the CFSession Object (The order creation should be strictly a server to server call)
- Parameter token: Send the token that is generated. The token consists of the entire order details.
- Returns: The method returns an instance of CFSessionBuilder to continue building the CFSession object

#### Parameters

| Name | Description |
| ---- | ----------- |
| token | Send the token that is generated. The token consists of the entire order details. |

### `setOrderID(_:)`

```swift
public func setOrderID(_ id: String) -> CFSessionBuilder
```

The method sets the value of the Order Id to the CFSession Object (The order creation should be strictly a server to server call)
- Parameter token: Send the Order Id of the order under process.
- Returns: The method returns an instance of CFSessionBuilder to continue building the CFSession object

#### Parameters

| Name | Description |
| ---- | ----------- |
| token | Send the Order Id of the order under process. |

### `setEnvironment(_:)`

```swift
public func setEnvironment(_ environment: CFENVIRONMENT) -> CFSessionBuilder
```

The method sets the value of the environment in which the payment has to be executed
- Parameter environment: The value of the environment can be either SANDBOX or PRODUCTION depending on the environment the payment has to be executed
- Returns: The method returns an instance of CFSessionBuilder to continue building the CFSession object

#### Parameters

| Name | Description |
| ---- | ----------- |
| environment | The value of the environment can be either SANDBOX or PRODUCTION depending on the environment the payment has to be executed |

### `build()`

```swift
public func build() throws -> CFSession
```

The method validates the input, to check if the inputs are either nil or empty
- Throws: In case of validation failure, a custom error adhering to Error protocol is thrown.
- Returns: The method returns a CFSession Object, which has to be used further in the integration process
