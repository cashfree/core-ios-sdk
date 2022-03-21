# Cashfree iOS SDK (CashfreePG)

Hey! fellow developers, welcome to Cashfree's Documentation Site. Now that you are here, we believe that you are looking to integrate our payment gateway into your iOS application. This documentation will guide you through the entire integration process.

## Getting Started

Use our **CashfreePG** to integrate the Cashfree's Payment Gateway directly into your app for **iOS 11** and above. It has been designed to offload the complexity of handling and integrating payments in your app.

The following are the steps to be followed to getting the integration started:-

1. Create an account with Cashfree and get the API keys
2. Integrate our Cashfree SDK into your application
3. Create an order with Cashfree
4. Create a **session**.
5. Native Checkout
6. Seamless Checkout 
7. Select a **payment mode** and create objects for the same.
8. Create a **payment object**.
9. Initiate payment

___

# Create an account with Cashfree and get the API keys**

1. Go to the [Cashfree website](https://merchant.cashfree.com/merchant/login) and create an account. Click [here](https://docs.cashfree.com/docs/create-account) for detailed steps on how to create and activate your account.
2. Log in to your Merchant Dashboard using the same credentials.
3. Click Payment Gateway section View Dashboard click Credentials. For security purposes, you need to enter your password for verification.
4. Copy the app ID and the secret key. These values are required to create the order token from your server. Order tokens are used to authenticate the API calls made from Cashfree iOS SDK.

___

# Integrate Cashfree SDK into your application**

#### USING COCOAPODS

Open your pod file and add the following and then use `pod install`

```
pod 'CashfreePG', '~> 1.0.11'
```
___

# Creating an order with Cashfree

To process any payment on Cashfree PG, the merchant needs to create an order in the cashfree system. **This order must be created from your backend (as it uses your secret key)**.

`Note:` Please refer our [Order Creation](https://docs.cashfree.com/docs/create-order) for more details regarding parameters and more.


**Production** -> ```https://api.cashfree.com/pg/orders```\
**Sandbox** -> ```https://sandbox.cashfree.com/pg/orders```


`Note:` Please see the description of the request below.

#### **Order creation request description**
```
curl -XPOST -H 'Content-Type: application/json'
-H 'x-client-id: "YOUR APP ID GOES HERE"'
-H 'x-client-secret: "YOUR SECRET KEY GOES HERE'
-H 'x-api-version: "2021-08-21"'
-H 'x-request-id: "developer_name"'
-d '{
    "order_amount": 1.00,
    "order_id": "order_id"
    "order_currency": "INR",
    "customer_details": {
        "customer_id": "customer_id",
        "customer_name": "customer_name",
        "customer_email": "customer_email",
        "customer_phone": "customer_phone"
    },
    "order_meta": {
        "notify_url": "https://test.cashfree.com"
    },
    "order_note": "some order note here",
}' 'https://sandbox.cashfree.com/pg/orders'
```

#### **Response Example**
```
{
    "cf_order_id": 514853406,
    "order_id": "order_id",
    "entity": "order",
    "order_currency": "INR",
    "order_amount": 1.00,
    "order_expiry_time": "2021-08-22T13:09:23+05:30",
    "customer_details": {
        "customer_id": "customer_id",
        "customer_name": "customer_name",
        "customer_email": "customer_email",
        "customer_phone": "customer_phone"
    },
    "order_meta": {
        "return_url": "https://test.cashfree.com"
        "notify_url": "https://test.cashfree.com"
        "payment_methods": null
    },
    "settlements": {
        "url": "settlements_url"
    },
    "payments": {
        "url": "payments_url"
    },
    "refunds": {
        "url": "refunds_url"
    },
    "order_status": "ACTIVE",
    "order_token": "W8zVBhADaw2EDP7crdyM", // This is the order_token that has to be sent to the SDK
    "order_note": "some order note here",
    "payment_link": "https://cashfree.com/pgbillpaywebapp/#W8zVBhADaw2EDP7crdyM" // This link opens the payment page provided by Cashfree
}
```
If the order creation is successful you will receive a 200 response and the order entity in response. This order entity contains relevant details for the order and the details provided in the request.

We recommend that you store the following parameters at your end `order_id`, `cf_order_id` , `order_token`, and the `order_status`. Please refer [Order Creation Response](https://docs.cashfree.com/docs/create-order#response) page for more details.

`Note:` The **`order_token`** contains all the order details and has to be sent to the SDK while initiating the payment.

___

# **Create a session**

As discussed above, the **`order_token`** contains all the order details and is used to authenticate the payment. The SDK exposes a class **`CFSession`** which has member variables for a payment session. One of them sets the order_token value.

Cashfree provides two environments, one being the `sandbox` environment for developers to test the payment flow and responses and the other being `production` environment which gets shipped to production. This environment can be set in this session object.

The values for environment can be either `.SANDBOX` or `.PRODUCTION`.

#### **Code Snippet**
```
do {
     let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.SANDBOX)
                .setOrderToken("order_token")
                .setOrderId("order_Id")
                .build()
   } catch let e {
     let error = e as! CashfreeError
     print(error.localizedDescription)
   }
```

`Note:` Refer to our API Reference documentation for more information about the methods.

___

# Native Checkout

Cashfree provides a pre-built UI to enable the merchant to integrate the payment gateway in a jiffy. The UI SDK handles all the business logic and UI Components to make the payment smooth and easy to use. The SDK allows the merchant to customise the UI in terms of color coding and fonts and payment components. 

### Permissions
Open the info.plist file and add the following:
```xml
<key>LSApplicationCategoryType</key>
<string></string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>bhim</string>
  <string>paytm</string>
  <string>phonepe</string>
  <string>tez</string>
</array>
```

### Payment Components
The Cashfree's native checkout allows the merchant to use a seamless flow with the pre-built UI by sending payment component parameters to the SDK.

```
let paymentComponent = try CFPaymentComponent.CFPaymentComponentBuilder()
                        .enableComponents(["order-details", "card", "upi", "wallet", "netbanking", "emi", "paylater"])
                        .build()
```

The `enableComponents()` method takes in an array of string and the order in which the merchant sends the components is honoured. If this method is not called, by default all the payment modes are enabled.

```

### Theme
let theme = try CFTheme.CFThemeBuilder()
                        .setNavigationBarBackgroundColor("#C3C3C3")
                        .setNavigationBarTextColor("#FFFFFF")
                        .setButtonBackgroundColor("#FF0000")
                        .setButtonTextColor("#FFFFFF")
                        .setPrimaryFont("Futura")
                        .setSecondaryFont("Menlo")
                        .build()
```

The `CFTheme` and `CFThemeBuilder` is used to set the theming for the UI SDK. The merchant can set the above information. For more details, refer our API Documentation.

### Handling Responses

In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with Native Checkout flow and the class which is initiating this has to conform to the protocol `CFNativeCheckoutResponseDelegate`.

This protocol comprises of 2 methods:

1. `func didFinishExecution(with error: CFErrorResponse, order_id: String)`
2. `func verifyPayment(order_id: String)`

`Note:` Refer to our API Reference documentation for more information about the methods.

---

# Seamless Checkout

## **Prerequisite - Card, Wallet, Paylater and Netbanking Mode**

When any of these payment modes is being used, the user is navigated to a web page to authenticate the payment. In this case, a web-view has to be loaded. For this purpose, the SDK exposes a web-view `CFWebView` which is a subclass of `WKWebView`. You have to create a WKWebView and set the custom class to `CFWebView`.

`Note` The below code is an example code. You can add this if you are building the UI programmatically or inherit `CFWebView` class to your web-view in stroyboard.

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

`Note:` In case the user chooses to close the web-view before completing the 2FA flow, we strongly recommend you to call the `removeWebViewReference()` method. This makes sure that you do not get unnecessary callbacks later.

___

## **Select a **payment mode** and create objects for the same**

Cashfree PG provides multiple modes to make payment. You can choose any mode depending on the requirement and invoke that payment mode from the SDK. The following are supported by the iOS SDK:-

1. Card
2. Netbanking
3. UPI Collect
4. UPI Intent
5. Wallet
6. EMI
7. Paylater

---

### **Create a Card Object**

- A card object has to be created by sending all the required details i.e., Card Holder Name, Card Number, Card CVV and more
- The SDK exposes a class `CFCard` that collects these details.
- The below code snippet creates an object of `CFCard`

```
do {
        let card = try CFCard.CFCardBuilder()
            .setCardNumber("1234")
            .setCardHolderName("Suhas")
            .setCardExpiryYear("25") // in YY format
            .setCardExpiryMonth("12")
            .setCVV("123")
            .buildCard()

    } catch let e {
        let error = e as! CashfreeError
        print(error.localizedDescription)
    }
```

- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with card-payment flow and the controller which is initiating this has to conform to the protocol `CFCardPaymentDelegate`.

- This protocol comprises of 4 methods:
    - `func initiatingCardPayment()`
    - `func presentWebForAuthenticatingCardPayment()`
    - `func cardPayment(didFinishExecutingWith error: CFErrorResponse)`
    - `func verifyCardPaymentCompletion(for orderId: String)`

`Note:` Refer to our API Reference documentation for more information about the methods.
___

### **Create a Netbanking Object**

- A Netbanking object has to be created by sending all the required details i.e., Bank Code
- The SDK exposes a class `CFNetbanking` that collects these details.
- The below code snippet creates an object of `CFNetbanking`

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
`Note:` Visit to get a list of all the [bank codes.](https://docs.cashfree.com/docs/net-banking)
- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with netbanking-payment flow and the controller which is initiating this has to conform to the protocol `CFNetbankingPaymentDelegate`.

- The **CFNetbankingPaymentDelegate** protocol comprises of 4 methods:
    - `func initiatingNetbankingPayment()`
    - `func presentWebForAuthenticatingNetbankingPayment()`
    - `func netbankingPayment(didFinishExecutingWith error: CFErrorResponse)`
    - `func verifyNetbankingPaymentCompletion(for orderId: String)`

`Note:` Refer to our API Reference documentation for more information about the methods.
___

### **Create a Wallet Object**

- A Wallet object has to be created by sending all the required details i.e., provider name, phone number
- The SDK exposes a class `CFWallet` that collects these details.
- The below code snippet creates an object of `CFWallet`

```
        do {
            let wallet = try CFWallet.CFWalletBuilder()
                .setProvider("phonepe")
                .setPhone("99999999")
                .build()
        } catch let e {
            let error = e as! CashfreeError
            print(error.localizedDescription)
       }
```
`Note:` Below is the list of all provider values supported by Cashfree:-
1. phonepe
2. paytm
3. amazon
4. airtel
5. freecharge
6. mobikwik
7. jio
8. ola

- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with wallet-payment flow and the controller which is initiating this has to conform to the protocol `CFWalletPaymentDelegate`.

- The **CFWalletPaymentDelegate** protocol comprises of 4 methods:
    - `func initiatingWalletPayment()`
    - `func presentWebForAuthenticatingWalletPayment()`
    - `func verifyWalletPaymentCompletion(for orderId: String)`
    - `func walletPayment(didFinishExecutingWith error: CFErrorResponse)`

`Note:` Refer to our API Reference documentation for more information about the methods.

___

### **Create a UPI Object**

- A UPI object has to be created by sending all the required details i.e., channel and UPI ID
- The SDK exposes a class `CFUPI` that collects these details.
- Cashfree provides 2 modes of payment with UPI. One being the `collect` flow and the other being the `intent` flow.
- In the `collect` flow, the user has to enter his/her UPI ID and a request will be sent to that UPI ID to complete the payment.
- In the `intent` flow, the user has to be presented with a list of all installed UPI applications present in the phone. Clicking on one of them, the user will be redirected to the application to complete the payment
- Depending on the requirement, you can choose to use any.

#### The below code snippet creates an object of `CFUPI` collect.

```
        do {
            let cfUPICollect = try CFUPI.CFUPIBuilder()
                .setChannel(.COLLECT)
                .setUPIID("test@gocashfree")
                .build()
        } catch let e {
            let error = e as! CashfreeError
            print(error.localizedDescription)
       }
```
#### Pre-requisite for UPI Intent

- The SDK exposes a util class `CFUPIUtils` which consists of a method `getInstalledUPIApplications()` that returns a list of all the installed UPI applications in the user's phone.
- Add the following permission to `info.plist`

```xml
<key>LSApplicationCategoryType</key>
<string></string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>bhim</string>
  <string>paytm</string>
  <string>phonepe</string>
  <string>tez</string>
</array>
```

```
let upiApplications = CFUPIUtils().getInstalledUPIApplications() // Returns an array ([[String: String]])
```
#### The below code snippet creates an object of `CFUPI` intent
```
do {
            let cfUPICollect = try CFUPI.CFUPIBuilder()
                .setChannel(.INTENT)
                .setUPIID("id") // Here you have to send the "id" of the app that was clicked from the list that you received earlier
                .build()
        } catch let e {
            let error = e as! CashfreeError
            print(error.localizedDescription)
       }
```
`Note:` In the above code-snippet, inside the `setUPIID()`, the id of the clicked application has to be sent. This `id` is the key that is present in the list of objects that was retrieved in the above **Prerequisites**

- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with upi-payment flow and the controller which is initiating this has to conform to the protocol `CFUPIPaymentDelegate`.

- The **CFUPIPaymentDelegate** protocol comprises of 4 methods:
    - `func initiatingUPIPayment()`
    - `func presentWebForAuthenticatingUPIPaymentInSandBoxEnvironment()`
    - `func upiPayment(didFinishExecutingWith error: CFErrorResponse)`
    - `func verifyUPIPaymentCompletion(for orderId: String)`

`Note:` Refer to our API Reference documentation for more information about the methods.

___

### **Create a EMICard Object**
- An EMI card object has to be created by sending all the required details i.e., Card Holder Name, Card Number, Card CVV and more
- The SDK exposes a class `CFEMICard` that collects these details.
- The below code snippet creates an object of `CFEMICard`
```
do {
        let card = try CFEMICard.CFEMICardBuilder()
            .setCardNumber("1234123412341234")
            .setCardHolderName("Suhas")
            .setCardExpiryYear("25")
            .setCardExpiryMonth("12")
            .setCVV("123")
            .setEMITenure(3)
            .setBankName("ICICI")
            .buildCard()
    } catch let e {
        let error = e as! CashfreeError
        print(error.localizedDescription)
    }
```
- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with card-payment flow and the controller which is initiating this has to conform to the protocol `CFCardPaymentDelegate`.
- This protocol comprises of 3 methods:
    - `func initiatingCardPayment()`
    - `func presentWebForAuthenticatingCardPayment()`
    - `func cardPayment(didFinishExecutingWith error: CFErrorResponse)`
    - `func verifyCardPaymentCompletion(for orderId: String)`
`Note:` Refer to our API Reference documentation for more information about the methods.
---

### **Create a Paylater Object**

- A Paylater object has to be created by sending all the required details i.e., provider name, phone number
- The SDK exposes a class `CFPaylater` that collects these details.
- The below code snippet creates an object of `CFPaylater`

```
        do {
            let payLater = try CFPaylater.CFPaylaterBuilder()
                .setProvider("lazypay")
                .setPhone("99999999")
                .build()
        } catch let e {
            let error = e as! CashfreeError
            print(error.localizedDescription)
       }
```

- In order to establish a 2-way communication, the SDK exposes a protocol that is coupled tightly with wallet-payment flow and the controller which is initiating this has to conform to the protocol `CFPaylaterPaymentDelegate`.

- The **CFPaylaterPaymentDelegate** protocol comprises of 4 methods:
    - `func initiatingPaylaterPayment()`
    - `func presentWebForAuthenticatingPaylaterPayment()`
    - `func verifyPaylaterPaymentCompletion(for orderId: String)`
    - `func payLaterPayment(didFinishExecutingWith error: CFErrorResponse)`

`Note:` Refer to our API Reference documentation for more information about the methods.

---

## Create a **Payment object**

- The Payment Object is a collection of the above created **session** and **payment mode**.
- The SDK exposes separate Payment Object classes for each of the payment modes. Depending on the payment mode that you are using you can use that particular class
- The classes that help in creating this Payment Object for different payment modes are as follows:

#### 1. CFNativeCheckoutPayment

- Code Snippet to create a payment object for Native Checkout (pre-built UI SDK)

    ```
    do {
       let payment = try CFNativeCheckoutPayment.CFNativeCheckoutPaymentBuilder()
                        .setSession(session)
                        .setComponent(paymentComponent)
                        .setTheme(theme)
                        .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

#### 2. CFCardPayment

- Code Snippet to create a payment object for card

    ```
    do {
        let cardPaymentObject = try CFCardPayment.CFCardPaymentBuilder()
                .setSession(cfSession)
                .setCard(card)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

#### 3. CFNetbankingPayment

- Code Snippet to create a payment object for netbanking

    ```
    do {
        let netbankingPaymentObject = try CFNetbankingPayment.CFNetbankingPaymentBuilder()
                .setSession(cfSession)
                .setNetbanking(netbanking)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

#### 4. CFWalletPayment

- Code Snippet to create a payment object for wallet

    ```
    do {
        let cfWalletPaymentObject = try CFWalletPayment.CFWalletPaymentBuilder()
                .setSession(cfSession)
                .setWallet(wallet)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

#### 5. CFUPIPayment

- Code Snippet to create a payment object for UPI

    ```
    do {
        let cfUPIPaymentObject = try CFUPIPayment.CFUPIPaymentBuilder()
                .setSession(cfSession)
                .setUPI(cfUPI)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

---

#### 6. CFEMICardPayment
- Code Snippet to create a payment object for EMI
```
    do {
        let cardPaymentObject = try CFEMICardPayment.CFEMICardPaymentBuilder()
                .setSession(cfSession)
                .setCard(emiCard)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
```
    
Note: Refer to our API Reference documentation for more information about the methods.

#### 7. CFPaylaterPayment

- Code Snippet to create a payment object for card

    ```
    do {
        let payLaterPaymentObject = try CFPaylaterPayment.CFPaylaterPaymentBuilder()
                .setSession(cfSession)
                .setPaylater(payLaterPaymentObject)
                .build()
    } catch let e {
      let error = e as! CashfreeError
      print(error.localizedDescription)
    }
    ```

`Note:` Refer to our API Reference documentation for more information about the methods.

## Initiate payment

- Finally to initiate the payment, the above created Payment Object has to be sent to the SDK.
- The SDK exposes a class `CFPaymentGatewayService`, which can be used to set the Payment Object and initiate the payment.
- The below code snippet is an example demonstrating it's usage:

```
let gatewayService = CFPaymentGatewayService.getInstance()

override func viewDidLoad() {
  // We recommend that the callback be set separately in the viewDidLoad as well
  gatewayService.setCallback(self)
}



do {
   gatewayService.setCallback(self)
   try gatewayService.doPayment(payment: cardPaymentObject)
} catch let e {
  let error = e as! CashfreeError
  print(error.localizedDescription)
}
```

`Note:` In the `doPayment()`, you can send the payment object of any of the above created payment mode (CFCardPayment, CFNetbankingPayment, CFWalletPayment, CFUPIPayment)

`Note:` Refer to our API Reference documentation for more information about the methods.

---

## Sample Code

```
let gatewayService = CFPaymentGatewayService.getInstance()

override func viewDidLoad() {
  gatewayService.setCallback(self)
}
```

### Native Checkout
```
do {
                    let session = try CFSession.CFSessionBuilder()
                        .setOrderID(order_id)
                        .setOrderToken(order_token)
                        .setEnvironment(Utils.environment)
                        .build()
                    let paymentComponent = try CFPaymentComponent.CFPaymentComponentBuilder()
                        .enableComponents(["order-details", "card", "upi", "wallet", "netbanking", "emi", "paylater"])
                        .build()
                    let theme = try CFTheme.CFThemeBuilder()
                        .setNavigationBarBackgroundColor("#C3C3C3")
                        .setNavigationBarTextColor("#FFFFFF")
                        .setButtonBackgroundColor("#FF0000")
                        .setButtonTextColor("#FFFFFF")
                        .setPrimaryFont("Futura")
                        .setSecondaryFont("Menlo")
                        .build()
                    let payment = try CFNativeCheckoutPayment.CFNativeCheckoutPaymentBuilder()
                        .setSession(session)
                        .setComponent(paymentComponent)
                        .setTheme(theme)
                        .build()
                    gatewayService.setCallback(self)
                    try gatewayService.doPayment(payment, viewController: self)
                } catch {

                }
```

### Card

```

do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken(orderToken)
                .setOrderId("order_Id")
                .build()
            let card = try CFCard.CFCardBuilder()
                .setCardNumber("4444333322221111")
                .setCardHolderName("Name")
                .setCardExpiryMonth("05")
                .setCardExpiryYear("25")
                .setCVV("794")
                .build()
            let cardPaymentObject = try CFCardPayment.CFCardPaymentBuilder()
                .setSession(cfSession)
                .setCard(card)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cardPaymentObject, viewController: nil)
        } catch {

        }
```

---

### EMI Card

```

do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken(orderToken)
                .setOrderId("order_Id")
                .build()
            let emiCard = try CFEMICard.CFEMICardBuilder()
                .setCardNumber("4444333322221111")
                .setCardHolderName("Name")
                .setCardExpiryMonth("05")
                .setCardExpiryYear("25")
                .setCVV("794")
                .setEMITenure(3)
                .setBankName("ICICI")
                .build()
            let cardPaymentObject = try CFCardPayment.CFCardPaymentBuilder()
                .setSession(cfSession)
                .setCard(emiCard)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cardPaymentObject, viewController: nil)
        } catch {

        }
```

---

### Wallet

```
do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken(orderToken)
                .setOrderId("order_Id")
                .build()
            let wallet = try CFWallet.CFWalletBuilder()
                .setProvider("phonepe")
                .setPhone("9999999999")
                .build()
            let cfWalletPaymentObject = try CFWalletPayment.CFWalletPaymentBuilder()
                .setSession(cfSession)
                .setWallet(wallet)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cfWalletPaymentObject, viewController: nil)
        } catch {

        }
```

---

### Netbanking

```
do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken(orderToken)
                .setOrderId("order_Id")
                .build()
            let netbanking = try CFNetbanking.CFNetbankingBuilder()
                .setBankCode(3003)
                .build()
            let netbankingPaymentObject = try CFNetbankingPayment.CFNetbankingPaymentBuilder()
                .setSession(cfSession)
                .setNetbankingObject(netbanking)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(paymentt: netbankingPaymentObject, viewController: nil)
        } catch {

        }
```

---

### UPI Collect

```
do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken(orderToken)
                .setOrderId("order_Id")
                .build()
            let cfUPICollect = try CFUPI.CFUPIBuilder()
                .setChannel(.COLLECT)
                .setUPIID("<SET UPI ID HERE>")
                .build()
            let cfUPIPaymentObject = try CFUPIPayment.CFUPIPaymentBuilder()
                .setSession(cfSession)
                .setUPI(cfUPICollect)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cfUPIPaymentObject, viewController: nil)
        } catch {

        }
```

---

### UPI Intent

```
do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken("orderToken")
                .setOrderId("order_Id")
                .build()
            let cfUPICollect = try CFUPI.CFUPIBuilder()
                .setChannel(.INTENT)
                .setUPIID(CFUPIUtils().getInstalledUPIApplications().first!["id"]!)
                .build()
            let cfUPIPaymentObject = try CFUPIPayment.CFUPIPaymentBuilder()
                .setSession(cfSession)
                .setUPI(cfUPICollect)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cfUPIPaymentObject, viewController: nil)
        } catch {

        }
```
`Note:` For demo purpose we are taking the "id" of the first object in the array. The "id" of the app that is clicked has to be sent as the value

---

### Paylater

```
do {
            let cfSession = try CFSession.CFSessionBuilder()
                .setEnvironment(.PRODUCTION)
                .setOrderToken("orderToken")
                .setOrderId("order_Id")
                .build()
            let cfPayLater = try CFPaylater.CFPaylaterBuilder()
                .setProvider("lazypay")
                .setPhone("9999999999")
                .build()
            let cfPaylaterObject = try CFPaylaterPayment.CFPaylaterPaymentBuilder()
                .setSession(cfSession)
                .setPaylater(cfPayLater)
                .build()
            gatewayService.setCallback(self)
            try gatewayService.doPayment(payment: cfPaylaterObject, viewController: nil)
        } catch {

        }
```
---

## Error Codes

There are 2 error codes that is sent from SDK to the application. One being the error code that is sent from Cashfree's Backend service when order initiation fails. Visit [here](https://docs.cashfree.com/docs/resources#errors) for details about such error codes.

The other type of error codes are the ones that are exposed by the SDK when required data is not sent to the SDK when initiating the payment. These are thrown as error.

**CashfreeError** is an Enum that inherits  Foundations **Error** class. The following are some of the error codes that are exposed by the SDK:

| ERROR CODES                 	| MESSAGE                                                                                                                                                              	|
|-----------------------------	|----------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| MISSING_CALLBACK            	| The callback is missing in the request.                                                                                                                              	|
| ORDER_ID_MISSING            	| The "order_id" is missing in the request.                                                                                                                            	|
| CARD_EMI_TENURE_MISSING     	| The "emi_tenure" is missing or invalid (It has to be greater than 0).                                                                                                	|
| INVALID_UPI_APP_ID_SENT     	| The id sent is invalid. The value has to be one of the following:   "tez://","phonepe://","paytm://","bhim://. Please refer the note in CFUPI class for more details 	|
| INVALID_PAYMENT_OBJECT_SENT 	| The payment object that is set does not match any payment mode. Please set the correct payment mode and try again.                                                   	|
| WALLET_OBJECT_MISSING       	| The CFWallet object is missing in the request                                                                                                                        	|
| NETBANKING_OBJECT_MISSING   	| The CFNetbanking object is missing in the request.                                                                                                                   	|
| UPI_OBJECT_MISSING          	| The CFUPI object is missing in the request.                                                                                                                          	|
| CARD_OBJECT_MISSING         	| The CFCard object is missing in the request.                                                                                                                         	|
| INVALID_WEB_DATA            	| The url seems to be corrupt. Please reinstantiate the order.                                                                                                         	|
| SESSION_OBJECT_MISSING      	| The "session" is missing in the request                                                                                                                              	|
| PAYMENT_OBJECT_MISSING      	| The "payment" is missing in the request                                                                                                                              	|
| ENVIRONMENT_MISSING         	| The "environment" is missing in the request.                                                                                                                         	|
| ORDER_TOKEN_MISSING         	| The "order_token" is missing in the request.                                                                                                                         	|
| CHANNEL_MISSING             	| The "channel" is missing in the request.                                                                                                                             	|
| CARD_NUMBER_MISSING         	| The "card_number" is missing in the request.                                                                                                                         	|
| CARD_EXPIRY_MONTH_MISSING   	| The "card_expiry_mm" is missing in the request.                                                                                                                      	|
| CARD_EXPIRY_YEAR_MISSING    	| The "card_expiry_yy" is missing in the request.                                                                                                                      	|
| CARD_CVV_MISSING            	| The "card_cvv" is missing in the request.                                                                                                                            	|
| UPI_ID_MISSING              	| The "upi_id" is missing in the request                                                                                                                               	|
| WALLET_CHANNEL_MISSING      	| The "channel" is missing in the wallet payment request                                                                                                               	|
| WALLET_PHONE_MISSING        	| The "phone number" is missing in the wallet payment request                                                                                                          	|
| NB_BANK_CODE_MISSING        	| The "bank_code" is missing in the request                                                                                                                            	|

## Payment Verification

Visit [here](https://docs.cashfree.com/reference#get-status) for details about verifying order payment status
