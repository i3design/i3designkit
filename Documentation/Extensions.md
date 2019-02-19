# Extensions
## Array
### subtract()

自身の配列から指定された配列に含まれるものを除外する

##### required
Array.Element は Equtable に準拠する

```swift
public mutating func subtract(_ other: [Element])
```

example:

```swift
let list = ["a","b","c"]
list.subtract(["c", "d"])
print(list) // => ["a", "b"]
```

## Calendar
Calendarのinitializer

```swift
// initialize with Calendar.Identifier.gregorian
public static var gregorian: Calendar

// initialize with Calendar.Identifier.japanese
public static var japanese: Calendar

// initialize with Calendar.Identifier.iso8601
public static var iso8601: Calendar
```

## DateFormatter
###String型をDate型に変換
失敗した場合はnilを返す.

```swift
public static func date(from: String, format: String, calendar: Calendar) -> Date?
```
example:

```swift
let data = DateFormatter.date(from: "20190214 12:01:30", format: "yyyyMMdd HH:mm:ss")
print(data) // => "Optional(2019-02-14 03:01:30 +0000)"
```

### Date型をString型に変換
失敗した場合はnilを返す.

```swift
public static func string(from date: Date, format: String, calender: Calendar = .gregorian) -> String?
```

example:

```swift
DateFormatter.string(from: Date(), format: "yyyyMMdd HH:mm:ss") // => "20190214 12:01:30"

```

## JSONDecoder
### JSON文字列を指定した型のオブジェクトに変換
```swift
public func decode<T>(_ type: T.Type, string: String, using: String.Encoding = .utf8) throws -> T
    where T: Decodable
```
example:

```swift
struct Decode: Decodable {
    var title: String
}

let jsonString = """
{
    "title": "タイトル"
}
"""

do {
    let value = try JSONDecoder().decode(Decode.self, string: jsonString, using: .utf8)
    print(value.title) // => "タイトル"
}
catch {
	// error handling
}
```
### JSON文字列を指定した型のオブジェクトに変換（型推論）

```swift
public func decode<T>(string: String, using: String.Encoding = .utf8) throws -> T where T: Decodable
```

example:

```swift
let jsonString = """
{
    "title": "タイトル"
}
"""

do {
    let value: Decode = try JSONDecoder().decode(string: jsonString, using: .utf8)
    print(value.title) // => "タイトル"
}
catch {
	// error handling
}
```

## Locale
Localeのinitializer

```swift
// initialize with identifier "jp_JP"
public static var ja_JP: Locale
    
// initialize with identifier "en_US"
public static var en_US: Locale

// initialize with identifier "en_US_POSIX"
public static var en_US_POSIX: Locale
```

## NSObject
クラス名を文字列で取得

```swift
public static var className: String

public var className: String

```
example:

```swift
class MyObject: NSObject {}

MyObject.className // => "MyObject"
MyObject().className // => "MyObject" 
```

## NumberFormatter
### NSNumberを文字列に変換
```swift
public class func string(from number: NSNumber, style: NumberFormatter.Style, locale: Locale) -> String?
```
example:

```swift
let number = NSNumber(value: 1234)
let locale = Locale(identifier: "ja_JP")
NumberFormatter.string(from: number, style: .none, locale: locale) // => "1234"
```

### 日本円の書式に変換された文字列を取得
```swift
public class func jpyString(from value: Int) -> String?
```
example:

```swift
NumberFormatter.jpyString(from: 1234) // => "¥1,234"
```

### ３桁区切りの文字列を取得
```swift
public class func decimalString(from value: Int) -> String?
```
example:

```swift
NumberFormatter.decimalString(from: 1234) // => "1,234"
```

## Sequence

### Data型の配列を指定の Decodable の型配列に変換

```swift
public func decodes<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
    where T: Decodable, Iterator.Element == Data
```
example:

```swift
private struct MyObject: Codable {
    let title: String
}

do {
	let data = try JSONEncoder().encode(MyObject(title: "タイトル"))
	let objects = try [data].decodes(MyObject.self)
	objects[0].title // => "タイトル"
}
catch {
    // error handling
}
```

### Data型の配列を指定の Decodable の型配列に変換（型推論）

```swift
public func decodes<T>(_ decoder: JSONDecoder = JSONDecoder()) throws -> [T]
    where T: Decodable, Iterator.Element == Data {

```
example:

```swift
do {
	let data = try JSONEncoder().encode(MyObject(title: "タイトル"))
	let objects: [MyObject] = try [data].decodes()
	objects[0].title // => "タイトル"
}
catch {
    // error handling
}
```

### Json書式の文字列配列を指定の Decodable の型配列に変換

```swift
public func decodes<T>(_ type: T.Type, using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
    where T: Decodable, Iterator.Element == String
```
example:

```swift
let jsonString = "{\"title\": \"タイトル\"}"
do {
    let objects = try [jsonString].decodes(MyObject.self, using: .utf8)
    objects[0].title // => "タイトル"
}
catch {
    // error handling
}
```

### Json書式の文字列配列を指定の Decodable の型配列に変換（型推論）

```swift
public func decodes<T>(using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
    where T: Decodable, Iterator.Element == String
```
example:

```swift
let jsonString = "{\"title\": \"タイトル\"}"
do {
    let objects: [MyObject] = try [jsonString].decodes(using: .utf8)
    objects[0].title // => "タイトル"
}
catch {
    // error handling
}
```

### description

```swift
```
example:

```swift
```
