**PROTOCOL**

# `CFUPIPaymentDelegate`

```swift
@objc public protocol CFUPIPaymentDelegate: CFCallbackDelegate
```

The UIViewController implementing the SDK's UPI payment flow has to conform to this protocol. The protocol comes with three methods, which help in handling payment callbacks in each step, ranging from payment initiation to authentication payment to verifying the payment.
 
 ## Code Snippet ##
 
 ```
 class MyViewController: UIViewController, CFUPIPaymentDelegate {
     override func viewDidLoad() {
         ....
         ....
         ....
     }
     
    func initiatingUPIPayment()  {
        // Show Loader here
    }
    
    func verifyUPIPaymentCompletion() {
        // Start Payment Verification here by making an API call to Cashfree Server
    }
 
    func upiPayment(didFinishExecutingWith error: CFErrorResponse) {
        // handle errors here.
    }
 
    func presentWebForAuthenticatingUPIPaymentInSandBoxEnvironment() {
         // Present the UIViewController that embeds CFWebView and call the below method in that class
          DispatchQueue.main.async {
              self.webViewController = MyWebViewController(nibName: "WebViewController", bundle: nil)
              self.webViewController.modalPresentationStyle = .fullScreen
              self.present(self.webViewController, animated: true, completion: nil)
          }
    }
     
 }
 ```

## Methods
### `initiatingUPIPayment()`

```swift
func initiatingUPIPayment()
```

  This method callback is invoked when the SDK starts creating the UPI payment process for the given order.
Note: Loaders can be implemented here.

### `presentWebForAuthenticatingUPIPaymentInSandBoxEnvironment()`

```swift
func presentWebForAuthenticatingUPIPaymentInSandBoxEnvironment()
```

This method callback is invoked when the payment request is created and the SDK is ready to authenticate the payment by launching the web-view. When this callback is invoked, the web-view which is a sub-class of *CFWebView* has to call a method in SDK that initiates the authentication process by navigating the user to bank payment page. This method will be invoked only in case of **SANDBOX** environment.

### `verifyUPIPaymentCompletion(for:)`

```swift
func verifyUPIPaymentCompletion(for orderId: String)
```

This method callback is invoked once the payment creation is complete and the user is automatically redirected to installed UPI application (in case of *UPI Intent*) or as soon as the user gets a payment notification (in case of *UPI Collect*) to entered VPA.

### `upiPayment(didFinishExecutingWith:)`

```swift
func upiPayment(didFinishExecutingWith error: CFErrorResponse)
```

This method callback gets invoked whenever there is a *failure in the payment creation request (invalid upi_id)* or in case of *Internet Issues*
- Parameter error: The parameter *error* is of type *CFErrorResponse*. It has *status*, *message*, *code* and *type*, which consists of extra information about the error that was encountered.

#### Parameters

| Name | Description |
| ---- | ----------- |
| error | The parameter  is of type . It has , ,  and , which consists of extra information about the error that was encountered. |