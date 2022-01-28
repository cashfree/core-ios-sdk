**CLASS**

# `CFUPIUtils`

```swift
@objc public class CFUPIUtils: NSObject
```

   **CFUPIUtils** class helps in getting any configurations that are needed prior to making the payment page. One such example is getting the list of all the installed UPI applications from the user's phone. The class provides a method called `CFUPIUtils().getInstalledUPIApplications()` which sends back a list of UPI applications installed in the user's phone.

   * NOTE: Add the following permissions to info.plist file
```
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

* ## Code Snippet ##
```
let installedApps = CFUPIUtils().getInstalledUPIApplications()
```

## Methods
### `init()`

```swift
public override init()
```

### `getInstalledUPIApplications()`

```swift
@objc public func getInstalledUPIApplications() -> [[String: String]]
```

This method returns list of installed UPI applications in the user's phone
- Returns: An array of dictionary ([String: String]) is returned. Each object consists of "displayName", "id" and "icon" as the keys with respective values in string format.
