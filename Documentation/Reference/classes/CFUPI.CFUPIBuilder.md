**CLASS**

# `CFUPI.CFUPIBuilder`

```swift
@objc final public class CFUPIBuilder: NSObject
```

The *CFUPIBuilder* class consists of all the setter methods required to create an object of `CFUPI`

## Methods
### `init()`

```swift
public override init()
```

No Argument Constructor

### `setChannel(_:)`

```swift
@objc public func setChannel(_ channel: CFUPIMODE) -> CFUPIBuilder
```

This method sets the channel, which initiates the payment in a particular mde
- Parameter channel: The parameter takes in a String and sets the value of the channel.
- Returns: It returns an instance of *CFUPIBuilder* to further continue building an object of *CFUPI*

#### Parameters

| Name | Description |
| ---- | ----------- |
| channel | The parameter takes in a String and sets the value of the channel. |

### `setUpiId(_:)`

```swift
public func setUpiId(_ id: String) -> CFUPIBuilder
```

This method sets the UPI ID of the user in case of UPI Collect flow or the UPI application that has to be launched in case of UPI Intent flow to which the payment notification gets triggered.
- Parameter id: It is of type String and the *upi_vpa* value or the *id* of the installed application has to be sent as the value to this id
- Returns: It returns an instance of *CFUPIBuilder* to further continue building an object of *CFUPI*

#### Parameters

| Name | Description |
| ---- | ----------- |
| id | It is of type String and the  value or the  of the installed application has to be sent as the value to this id |

### `getUpiId()`

```swift
public func getUpiId() -> String
```

### `getChannel()`

```swift
public func getChannel() -> CFUPIMODE
```

### `build()`

```swift
@objc public func build() throws -> CFUPI
```

This methods creates an object of CFUPICollect by setting the value of channel and upi_id and returns the object back to the calling method
- Throws: In case the value is null or empty an Error (CashfreeError.UPI_ID_MSSING) is thrown and the exception can be handled gracefullt
- Returns: It returns an object of CFUPICollect which can be used to Initiate the CFUPICollect Payment Mode
