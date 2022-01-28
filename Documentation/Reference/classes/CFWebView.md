**CLASS**

# `CFWebView`

```swift
final public class CFWebView: WKWebView, WKNavigationDelegate
```

   The class CFWebView inherits WKWebView. The user has to create a web-view and set the custom class to CFWebView (in case of storyboard UI creation) else use the below code snippet to create a web-view :-

   * Note: The *callback* has to be set explicitly (in case of Storyboards) or use the convenience initializer in case of programmatic UI creation.

* ## Code Snippet ##

```
var cashfreeWebView: CFWebView!
override func viewDidLoad() {
    super.viewDidLoad()

    .......

    self.cashfreeWebView = CFWebView(frame: .zero, configuration: WKWebViewConfiguration())
    self.cashfreeWebView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(cashfreeWebView)
    self.cashfreeWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    self.cashfreeWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    self.cashfreeWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    self.cashfreeWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

    do {
        try self.cfWebView.startAuthentication()
    } catch let e {
        let error = e as! CashfreeError
        print(error.localizedDescription)
    }
}
```

   * Note: If the UIViewController is removed from the stack (when the user closes the view controller before payment is complete), `CFWebView().removeWebViewReference()` method has to invoked to clear the reference of the web-view.

## Methods
### `init(frame:configuration:)`

```swift
@objc public override init(frame: CGRect, configuration: WKWebViewConfiguration)
```

Constructor for the CFWebView
- Parameters:
  - frame: Frame of the web-view
  - configuration: configuration of the web-view

#### Parameters

| Name | Description |
| ---- | ----------- |
| frame | Frame of the web-view |
| configuration | configuration of the web-view |

### `startAuthentication()`

```swift
@objc public func startAuthentication() throws
```

This method loads the web-view with required URL for authenticating the payment (It can be bank authentication or wallet payment authenticaion)
- Throws: It throws an exception in case the *callback* is not set or in case *URI* is invalid. In that case, the payment has to be restarted again.

### `webView(_:decidePolicyFor:decisionHandler:)`

```swift
public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
```

### `removeWebViewReference()`

```swift
public func removeWebViewReference()
```

This method has to be called when the user forcefully quits the controller in which web-view is embedded, inorder to de-reference the web-view.
