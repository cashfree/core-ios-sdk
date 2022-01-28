**EXTENSION**

# `CFAnalytics`
```swift
extension CFAnalytics
```

## Properties
### `endTime`

```swift
@NSManaged public var endTime: String?
```

### `environment`

```swift
@NSManaged public var environment: String?
```

### `meta_data`

```swift
@NSManaged public var meta_data: Data?
```

### `order_token`

```swift
@NSManaged public var order_token: String?
```

### `platform`

```swift
@NSManaged public var platform: String?
```

### `sdk_version`

```swift
@NSManaged public var sdk_version: String?
```

### `startTime`

```swift
@NSManaged public var startTime: String?
```

### `timestamp`

```swift
@NSManaged public var timestamp: String?
```

### `transaction_id`

```swift
@NSManaged public var transaction_id: String?
```

### `x_api_version`

```swift
@NSManaged public var x_api_version: String?
```

### `x_request_id`

```swift
@NSManaged public var x_request_id: String?
```

### `events`

```swift
@NSManaged public var events: NSOrderedSet?
```

## Methods
### `fetchRequest()`

```swift
@nonobjc public class func fetchRequest() -> NSFetchRequest<CFAnalytics>
```

### `insertIntoEvents(_:at:)`

```swift
@NSManaged public func insertIntoEvents(_ value: CFEvent, at idx: Int)
```

### `removeFromEvents(at:)`

```swift
@NSManaged public func removeFromEvents(at idx: Int)
```

### `insertIntoEvents(_:at:)`

```swift
@NSManaged public func insertIntoEvents(_ values: [CFEvent], at indexes: NSIndexSet)
```

### `removeFromEvents(at:)`

```swift
@NSManaged public func removeFromEvents(at indexes: NSIndexSet)
```

### `replaceEvents(at:with:)`

```swift
@NSManaged public func replaceEvents(at idx: Int, with value: CFEvent)
```

### `replaceEvents(at:with:)`

```swift
@NSManaged public func replaceEvents(at indexes: NSIndexSet, with values: [CFEvent])
```

### `addToEvents(_:)`

```swift
@NSManaged public func addToEvents(_ value: CFEvent)
```

### `removeFromEvents(_:)`

```swift
@NSManaged public func removeFromEvents(_ value: CFEvent)
```

### `addToEvents(_:)`

```swift
@NSManaged public func addToEvents(_ values: NSOrderedSet)
```

### `removeFromEvents(_:)`

```swift
@NSManaged public func removeFromEvents(_ values: NSOrderedSet)
```
