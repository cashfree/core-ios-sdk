**CLASS**

# `CFUPIPayment`

```swift
@objc final public class CFUPIPayment: CFPayment
```

The CFUPIPayment is a sub-class of CFPayment. An object of this class has to be created with the help of *CFUPIPaymentBuilder* class and that object has to be sent to `CFPaymentGatewayService` while initiating the payment. An object of `CFUPI`, `CFSession`  for UPI payment are the class variables.

## Code Snippet ##

```
let cfSession = ...
let cfUPICollect = ...
let cfUPIPaymentObject = try CFUPIPayment.CFUPIPaymentBuilder()
    .setSession(cfSession)
    .setUPI(cfUPICollect)
    .build()
```

## Methods
### `printDescription()`

```swift
public override func printDescription()
```
