**PROTOCOL**

# `CFNetbankingPaymentDelegate`

```swift
@objc public protocol CFNetbankingPaymentDelegate: CFCallbackDelegate
```

The UIViewController implementing the SDK's netbanking payment flow has to conform to this protocol. The protocol comes with three methods, which help in handling payment callbacks in each step, ranging from payment initiation to authentication payment to verifying the payment.
 
 ## Code Snippet ##
 
 ```
 class MyViewController: UIViewController, CFNetbankingPaymentDelegate {
 
     override func viewDidLoad() {
         ....
         ....
         ....
     }
     
    func initiatingNetbankingPayment()  {
        // Show Loader here
    }
    
    func presentWebForAuthenticatingNetbankingPayment() {
         // Present the UIViewController that embeds CFWebView and call the below method in that class
         DispatchQueue.main.async {
             self.webViewController = MyWebViewController(nibName: "WebViewController", bundle: nil)
             self.webViewController.modalPresentationStyle = .fullScreen
             self.present(self.webViewController, animated: true, completion: nil)
         }
    }
 
    func netbankingPayment(didFinishExecutingWith error: CFErrorResponse) {
        // handle errors here.
    }
 
    func verifyNetbankingPaymentCompletion(for orderId: String) {
        // Verify Payment
    }
     
 }
 ```
* Note: The payment verification has to be handled in the UIViewController that embeds the `CFWebView`

## Methods
### `initiatingNetbankingPayment()`

```swift
func initiatingNetbankingPayment()
```

  This method callback is invoked when the SDK starts creating the Netbanking payment process for the given order.
Note: Loaders can be implemented here.

### `presentWebForAuthenticatingNetbankingPayment()`

```swift
func presentWebForAuthenticatingNetbankingPayment()
```

This method callback is invoked when the payment request is created and the SDK is ready to authenticate the payment by launching the web-view. When this callback is invoked, the web-view which is a sub-class of *CFWebView* has to call a method in SDK that initiates the authentication process by navigating the user to bank payment page.

### `netbankingPayment(didFinishExecutingWith:)`

```swift
func netbankingPayment(didFinishExecutingWith error: CFErrorResponse)
```

This method callback gets invoked whenever there is a *failure in the payment creation request (invalid bank_ifsc)* or in case of *Internet Issues*
- Parameter error: The parameter *error* is of type *CFErrorResponse*. It has *status*, *message*, *code* and *type*, which consists of extra information about the error that was encountered.

#### Parameters

| Name | Description |
| ---- | ----------- |
| error | The parameter  is of type . It has , ,  and , which consists of extra information about the error that was encountered. |

### `verifyNetbankingPaymentCompletion(for:)`

```swift
func verifyNetbankingPaymentCompletion(for orderId: String)
```

This method gets invoked once the payment flow in the web-view is complete, It is your responsibility to check the status of the payment by making a call to Cashfree's server.
