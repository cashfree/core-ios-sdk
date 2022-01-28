**CLASS**

# `CFUPI`

```swift
final public class CFUPI: NSObject
```

* The CFUPI class is used to set the upi_vpa or the upi_id that can be used to initiate payment using UPI Collect or UPI Intent. With the help of `CFUPIBuilder` Class, an object of CFUPI can be built and this object can be further used to initiate the payment.

## Code Snippet ##

```
do {
   let cfUPICollect = try CFUPI.CFUPIBuilder()
       .setChannel(.COLLECT)
       .setUpiId("test@gocashfree")
       .build()
} catch let e {
   let error = e as! CashfreeError
   print(error.localisedDescription)
}
```
   * Note: If you are integrating *UPI Collect* flow:
               
       * The parameter of setChannel() has to be set to .COLLECT
       * The value of setUpiId() has to contain the "upi_vpa" value (for instance:- "9999999999@ybl")

   * Note: If you are integrating *UPI Intent* flow (making payment using installed UPI applications):-
               
       * Get the list of installed UPI applications by using CFConfiguration().getInstalledUPIApplications() and build the User Interface.
       * The above method returns an array of object, with each object consisting of three key value pairs (id, displayName, icon).
       * The parameter of setChannel() has to be set to .INTENT
       * The parameter of setUpiId() has to contain the id(mentioned above) of the clicked application which is part of the list retrieved.

## Methods
### `printDescription()`

```swift
@objc public func printDescription()
```
