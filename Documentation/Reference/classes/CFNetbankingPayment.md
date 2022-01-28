**CLASS**

# `CFNetbankingPayment`

```swift
@objc final public class CFNetbankingPayment: CFPayment
```

The CFNetbankingPayment is a sub-class of CFPayment. An object of this class has to be created with the help of *CFNetbankingPaymentBuilder* class and that object has to be sent to `CFPaymentGatewayService` while initiating the payment. An object of `CFNetbanking`, `CFSession` for Netbanking payment are the class variables.

## Code Snippet ##

```
let cfSession = ...
let netbanking = ...
let netbankingPaymentObject = try CFNetbankingPayment.CFNetbankingPaymentBuilder()
    .setSession(cfSession)
    .setNetbanking(netbanking)
    .build()
```

## Methods
### `printDescription()`

```swift
public override func printDescription()
```
