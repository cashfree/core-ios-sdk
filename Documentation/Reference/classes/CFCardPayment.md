**CLASS**

# `CFCardPayment`

```swift
@objc final public class CFCardPayment: CFPayment
```

 The CFCardPayment is a sub-class of CFPayment. An object of this class has to be created with the help of *CFCardPaymentBuilder* class and that object has to be sent to `CFPaymentGatewayService` while initiating the payment. An object of `CFCard`, `CFSession` for card payment are the class variables.
 
## Code Snippet ##
 
 ```
 let cfSession = ...
 let card = ...
 let cardPaymentObject = try CFCardPayment.CFCardPaymentBuilder()
     .setSession(cfSession)
     .setCard(card)
     .build()
 ```

## Methods
### `printDescription()`

```swift
public override func printDescription()
```
