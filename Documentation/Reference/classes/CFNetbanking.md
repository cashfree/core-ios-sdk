**CLASS**

# `CFNetbanking`

```swift
@objc final public class CFNetbanking: NSObject
```

This *CFNetbanking* class consists of all the parameters that are required to initiate payment using NetBanking payment mode. A CFNetbanking object can be build with the help of a `CFNetbankingBuilder` class that is embedded within the CFNetbanking class.
 
 ```
 do {
     let netbanking = try CFNetbanking.CFNetbankingBuilder()
         .setBankCode(3003)
         .build()
 } catch let e {
    let error = e as! CashfreeError
    print(error.localizedDescription)
 }
 ```
