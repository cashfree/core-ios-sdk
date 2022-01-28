**CLASS**

# `CFSession`

```swift
final public class CFSession: NSObject
```

 The CFSession class wiith the help of CFSessionBuilder class helps in gathering mandatory information to initiate a payment session. The CFSession object can be built with the of `CFSessionBuilder` which is a class embedded inside the CFSession class.
 
* Note: In case the mandatory variables are empty or null, custom errors adhering to Error protocol will be thrown, which can be used to handle the errors gracefully.
 
 ## Code Snippet ##
 
 ```
 do {
     let cfSession = try CFSession.CFSessionBuilder()
     .setOrderToken("order_token")
     .setEnvironment(.SANDBOX)
     .setOrderId("order_id")
     .build()
} catch let e {
     let error = e as! CashfreeError
     print(error.localizedDescription)
}
 ```
* Note: The "order_token" is used to authenticate the payment requests made from SDK. It has to be generated for every payment attempt made for an order. Pass this token to the SDK while initiating the payment for that order. For generating a "order_token" you need to use our order creation API. The below code snippet is an example JSON that has to be used to generate the "order_token"
 
 ## Code Snippet ##
 
 ```
 {
     "order_amount": 1.00,
     "order_currency": "INR",
     "order_id": "order_12341234"
     "customer_details": {
         "customer_id": "customer_id",
         "customer_name": "Customer Name",
         "customer_email": "customeremail@example.com",
         "customer_phone": "customer phone"
     },
     "order_meta": {
         "notify_url": "https://cashfree.com"
     },
     "order_note": "some order note here"
 }
 ```
 
 * The above JSON has to be sent as body of the request to the end-point "https://prod.cashfree.com/pgnextgenapi-test/api/v1/orders". The request should also consist of headers, which are as follows :-
 
 ```
 Content-Type:application/json
 X-client-id:{{apiKey}}
 X-client-secret:{{apiSecret}}
 x-api-version:2021-05-21
 ```

## Methods
### `printDescription()`

```swift
@objc public func printDescription()
```
