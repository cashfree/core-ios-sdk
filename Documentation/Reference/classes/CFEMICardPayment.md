**CLASS**

# `CFEMICardPayment`

```swift
@objc final public class CFEMICardPayment: CFPayment
```

 The CFEMICardPayment is a sub-class of CFPayment. An object of this class has to be created with the help of *CFEMICardPaymentBuilder* class and that object has to be sent to `CFPaymentGatewayService` while initiating the payment. An object of `CFEMICard`, `CFSession` for card payment are the class variables.
 
## Code Snippet ##
 
 ```
 let cfSession = ...
 let card = ...
 let cardPaymentObject = try CFEMICardPayment.CFEMICardPaymentBuilder()
     .setSession(cfSession)
     .setCallback(self)
     .build()
 ```

## Methods
### `printDescription()`

```swift
public override func printDescription()
```
