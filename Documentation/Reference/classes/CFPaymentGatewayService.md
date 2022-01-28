**CLASS**

# `CFPaymentGatewayService`

```swift
@objc final public class CFPaymentGatewayService: NSObject
```

CFPaymentGatewayService class contains the payment initiation method. Invoking this method triggers the payment execution flow. It has a member variable of type `CFPayment`. The value of this variable can be set using `doPayment(payment: ...)` which takes in a CFPaymentt as a parameter and initiates the payment

## Code Snippet ##

```

private let cfPaymentGatewayService = CFPaymentGatewayService.getInstance()

override func viewDidLoad() {
cfPaymentGatewayService.setCallback([self, self, self, self, self])
// Callbacks are set for each of the payment mode -> Card, Netbanking, UPI, Wallet
// Recommended to set the callbacks in viewDidLoad
}

do {
   try cfPaymentGatewayService.doPayment(paymentOject: cardPayment)
} catch {
   // Handle Exceptions
}
```
* Note: The CFPayment is a *mandatory* field ( Please read documentation `CFCardPayment`, `CFEMICardPayment`, `CFUPIPayment`, `CFWalletPayment`, `CFNetbankingPayment`, `CFQRCodePayment`). The *doPayment()* method call has to be surrounded by a *do-try-catch* as it throws an exception in case the CFPayment or the callback is not set .

## Methods
### `getInstance()`

```swift
@objc static public func getInstance() -> CFPaymentGatewayService
```

This method returns the only available instance of CFPaymentGatewayService
- Returns: An instance of CFPaymentGatewayService

### `setCallback(_:)`

```swift
@objc public func setCallback(_ callback: [CFCallbackDelegate])
```

### `doPayment(payment:)`

```swift
@objc public func doPayment(payment: CFPayment) throws
```

The method call invokes the respective payment flow (netbanking, card, UPI or wallet)
- Throws: In case the CFPayment instance variable is not set or not a payment mode, the method throws an exception

### `cancelPayment()`

```swift
@objc public func cancelPayment()
```
