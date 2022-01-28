**CLASS**

# `CFCard`

```swift
@objc final public class CFCard: NSObject
```

 CFCard class consists of parameters required to make a card payment. CFCard object can be build using the `CFCardBuilder`. The CFCardBuilder class is embedded within the CFCard class and provides the users with setters to set the values of all the details that are required while making a card payment.
 
 ## Code Snippet ##

```
 do {
        let card = try CFCard.CFCardBuilder()
            .setCardNumber("1234")
            .setCardHolderName("Suhas")
            .setCardExpiryYear("25")
            .setCardExpiryMonth("12")
            .setCVV("123")
            .build()
    } catch let e {
        let error = e as! CashfreeError
        print(error.localizedDescription)
    }
```
