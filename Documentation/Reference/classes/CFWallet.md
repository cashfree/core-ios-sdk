**CLASS**

# `CFWallet`

```swift
@objc final public class CFWallet: NSObject
```

The *CFWallet* consists of all the parameters that are required to initiate payment using Wallet Payment mode. A CFWallet object can be created with the help of `CFWalletBuilder` class that is embedded within the CFWallet class.
 
 ## Code Snippet ##
 
 ```
 do {
    let wallet = try CFWallet.CFWalletBuilder()
        .setChannel("phonepe")
        .setPhone("9999999999")
        .build()
 } catch let e {
    let error = e as! CashfreeError
    print(error.localizedDescription)
 }
 ```
 
* Note: The value of channel can be any of  the following:
 
            * phonepe
            * paytm
            * amazon
            * airtel
            * freecharge
            * mobikwik
            * jio
            * ola
