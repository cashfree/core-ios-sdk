**CLASS**

# `CFWalletPayment`

```swift
@objc final public class CFWalletPayment: CFPayment
```

The CFWalletPayment is a sub-class of CFPayment. An object of this class has to be created with the help of *CFWalletPaymentBuilder* class and that object has to be sent to `CFPaymentGatewayService` while initiating the payment. An object of `CFWallet`, `CFSession` for Netbanking payment are the class variables.

## Code Snippet ##

```
let cfSession = ...
let wallet = ...
let cfWalletPaymentObject = try CFWalletPayment.CFWalletPaymentBuilder()
    .setSession(cfSession)
    .setWallet(wallet)
    .build()
```

## Methods
### `printDescription()`

```swift
public override func printDescription()
```
