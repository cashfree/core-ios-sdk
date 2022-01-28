**CLASS**

# `CFEMICard`

```swift
@objc final public class CFEMICard: NSObject
```

 CFEMICard class consists of parameters required to make a card payment. CFEMICard object can be build using the `CFEMICardBuilder`. The CFEMICardBuilder class is embedded within the CFEMICard class and provides the users with setters to set the values of all the details that are required while making a card payment.
 
 ## Code Snippet ##

```
 do {
        let card = try CFEMICard.CFEMICardBuilder()
            .setChannel("moto")
            .setCardNumber("1234")
            .setCardHolderName("Suhas")
            .setCardExpiryYear("25")
            .setCardExpiryMonth("12")
            .setCVV("123")
            .setBankName("ICICI")
            .setEMITenure(3)
            .build()

    } catch let e {
        let error = e as! CashfreeError
        print(error.localizedDescription)
    }
```

## Methods
### `printDescription()`

```swift
@objc public func printDescription()
```
