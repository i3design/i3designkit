# Extensions

## Array
### subtract(_:)

自身の配列から指定された配列に含まれるものを除外する

##### Declaration
```swift
mutating func subtract(_ other: [Element])
```
Available when `Element` conforms to `Equtable`

##### Parameters
- other: 除外したい`Element`の配列.


##### Discussion
**Self**に含まれないものは無視される.
 
```swift
let list = ["a","b","c"]
list.subtract(["c", "d"])
print(list) // => ["a", "b"]
```

## Calendar
### gregorian
`Calendar.Identifier.gregorian`を指定した`Calender`を取得する

##### Declaration
```swift
static var gregorian: Calendar { get }
```

##### Discussion
```swift
let calendar = Calendar.gregorian
print(calendar.identifier) // => "gregorian"
```

デフォルト引数に特定のカレンダーを指定する場合にも使える

```swift
func setCalenar(_ :Calendar == .gregorian)
```
---
### japanese
`Calendar.Identifier.japanese`を指定した`Calender`を取得する

##### Declaration
```swift
static var japanese: Calendar { get }
```

##### Discussion
和暦の扱いとなることに注意

```swift
let calendar = Calendar.japanese
print(calendar.identifier) // => "japanese"
```
---
### iso8601
`Calendar.Identifier.iso8601`を指定した`Calender`を取得する

##### Declaration
```swift
static var iso8601: Calendar { get }
```

##### Discussion
和暦の扱いとなることに注意

```swift
let calendar = Calendar.iso8601
print(calendar.identifier) // => "iso8601"
```

## DateFormatter
### date(from:format:calendar:) -> Date?
String型をDate型に変換. 
##### Declaration
```swift
static func date(from dateString: String, format: String, calendar: Calendar = .gregorian) -> Date?
```

##### Parameters
- dateString: `Date`に変換したい文字列
- format: 変換するための書式
- calendar: 使用する`Calendar`. default is Gregorian Calendar.
 
##### Discussion
処理に失敗した場合はnilを返す

```swift
let data = DateFormatter.date(from: "20190214 12:01:30", format: "yyyyMMdd HH:mm:ss")
print(data) // => "Optional(2019-02-14 03:01:30 +0000)"
```

### string(from:format:calender:) -> String?
Date型をString型に変換
##### Declaration
```swift
static func string(from date: Date, format: String, calendar: Calendar = .gregorian) -> String?
```

##### Parameters
- date: 文字列にしたい`Date`
- format: 変換するための書式
- calendar: 使用する`Calendar`. default is Gregorian Calendar.

##### Discussion
処理に失敗した場合はnilを返す.

```swift
DateFormatter.string(from: Date(), format: "yyyyMMdd HH:mm:ss") // => "20190214 12:01:30"
```

## JSONDecoder
### func decode\<T>(_:string:using:) throws -> T
JSON文字列を指定した型のオブジェクトに変換

##### Declaration
```swift
func decode<T>(_ type: T.Type, string: String, using: String.Encoding = .utf8) throws -> T
```
Available when `T` conforms to `Decodable`

##### Parameters
- type: 変換したいオブジェクト
- string: json文字列
- using: 使用する`String.Encoding`. default は `.utf8`.

##### Discussion

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

---
### func decode\<T>(string:using:) throws -> T
JSON文字列を指定した型のオブジェクトを型推論を用いて変換

##### Declaration
```swift
public func decode<T>(string: String, using: String.Encoding = .utf8) throws -> T
```
Available when `T` conforms to `Decodable`

##### Parameters
- string: json文字列
- using: 使用する`String.Encoding`. default は `.utf8`.

##### Discussion
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
### ja_JP
`Locale`のidentifierに`"ja_JP"`を指定したものを取得する

##### Declaration
```swift
static var ja_JP: Locale { get }
```

##### Discussion
```swift
let locale = Locale.ja_JP
print(locale.identifier) // => "ja_JP"
```

デフォルト引数に特定の`Locale`を指定する場合にも使える

```swift
func setLocale(_: Locale == .ja_JP)
```
---
### en_US
`Locale`のidentifierに`"en_US"`を指定したものを取得する

##### Declaration
```swift
static var en_US: Locale { get }
```

##### Discussion
```swift
let locale = Locale.en_US
print(locale.identifier) // => "en_US"
```
---
### en_US\_POSIX
`Locale`のidentifierに`"en_US_POSIX"`を指定したものを取得する

##### Declaration
```swift
static var en_US_POSIX: Locale { get }
```

##### Discussion
```swift
let locale = Locale.en_US_POSIX
print(locale.identifier) // => "en_US_POSIX"
```

## NSObject
### className
クラス名を文字列で取得. Computed Type Properties.

##### Declaration
```swift
static var className: String { get }
```

##### Discussion
```swift
class MyObject: NSObject {}
MyObject.className // => "MyObject"
```
--- 

### className
クラス名を文字列で取得. Computed Properties.

##### Declaration
```swift
var className: String { get }
```

##### Discussion
```swift
class MyObject: NSObject {}
MyObject().className // => "MyObject" 
```

## NumberFormatter
### string(from:style:locale:) -> String?
NSNumberを文字列に変換

##### Declaration
```swift
class func string(from number: NSNumber, style: NumberFormatter.Style, locale: Locale) -> String?
```

##### Parameter
- number: 変換したい`NSNumber`
- style: `NumberFormatter.Style`を指定
- locale: `Locale`を指定

##### Discussion
```swift
let number = NSNumber(value: 1234)
let locale = Locale(identifier: "ja_JP")
NumberFormatter.string(from: number, style: .none, locale: locale) // => "1234"
```

### jpyString(from:) -> String?
日本円の書式に変換された文字列を取得

##### Declaration
```swift
class func jpyString(from value: Int) -> String?
```

##### Parameter
- value: 金額

##### Discussion
```swift
NumberFormatter.jpyString(from: 100) // => "¥100"
NumberFormatter.jpyString(from: 1000) // => "¥1,000"
NumberFormatter.jpyString(from: -100) // => "-¥100"
NumberFormatter.jpyString(from: -1000) // => "-¥1,000"
```
---
### decimalString(from:) -> String?
３桁区切りの文字列を取得

##### Declaration
```swift
class func decimalString(from value: Int) -> String?
```

##### Parameter
- value: 区切りたい`Int`

##### Discussion
```swift
NumberFormatter.jpyString(from: 100) // => "100"
NumberFormatter.jpyString(from: 1000) // => "1,000"
NumberFormatter.jpyString(from: -100) // => "-100"
NumberFormatter.jpyString(from: -1000) // => "-1,000"
```

## Sequence
### decodes\<T>(_:decoder:) throws -> [T]

`[Data]`を`[Decodable]`に変換

##### Declaration
```swift
func decodes<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
```
Available when `T` conforms to `Decodable ` and `Iterator.Element == Data`

##### Parameters
- type: デコードする`Type`
- decoder: `JSONDecoder`を指定. default is `JSONDecoder()`

##### Discussion
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
---
### decodes\<T>(_:) throws -> [T]
`[Data]`を`[Decodable]`に型推論を用いて変換

##### Declaration
```swift
public func decodes<T>(_ decoder: JSONDecoder = JSONDecoder()) throws -> [T]
```
Available when `T` conforms to `Decodable ` and `Iterator.Element == Data`

##### Discussion
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
---
### decodes\<T>(_:using:decoder:) throws -> [T]
Json書式の文字列配列を指定の Decodable の型配列に変換

##### Declaration
```swift
public func decodes<T>(_ type: T.Type, using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
```
Available when `T` comform to `Decodable` and `Iterator.Element` is `String`

##### Parameters
- type: デコードする`Type`
- using: `String.Encoding`を指定. default is `.utf8`.
- decoder: `JSONDecoder`を指定. default is `JSONDecoder()`.

##### Discussion
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
---
### decodes\<T>(using:decoder:) throws -> [T]
Json書式の文字列配列を指定の Decodable の型配列に変換（型推論）

##### Declaration
```swift
public func decodes<T>(using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
```
Available when `T` conform to `Decodable` and `Iterator.Element` is `String`

##### Parameters
- using: `String.Encoding`を指定. default is `.utf8`.
- decoder: `JSONDecoder`を指定. default is `JSONDecoder()`.

##### Discussion
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
---
### unique
重複した要素のない配列を取得

##### Declaration
```swift
var unique: [Element] { get }
```
Available when `Element` conform to `Equtable`

##### Discussion
```swift
[1, 1, 2].unique // => [1, 2]
```
---
### subtracting(_:)
**self**から指定の配列に含まれるものを除外して返す

##### Declaration
```swift
func subtracting(_ other: [Element]) -> [Element]
```

##### Parameters
- other: 除外したい`Element`の配列.

##### Discussion
```swift
[1, 2, 3].subtracting([2]) // => [1, 3]

```
## String
### split(length:) -> [String]
文字列を分割する

##### Declaration
```swift
func split(length: Int) -> [String]
```

##### Parameters
- length: 分割単位となる長さ

##### Return Value
`length`で指定された文字数毎に分割した`[String]`

##### Discussion
```swift
["abcde"].split(length: 2) // => ["ab", "cd", "e"]
```

## TimeZone
### JST
日本標準時を表す`TimeZone`を返す

##### Declaration
```swift
static var JST: TimeZone { get }
```

##### Discussion
```swift
let timeZone = TimeZone.JST
print(timeZone.identifier) // => "Asia/Tokyo"
```
---

### GMT
グリニッジ標準時のTimeZoneを返す

##### Declaration
```swift
static var GMT: TimeZone { get }
```

##### Discussion
```swift
let timeZone = TimeZone.GMT
print(timeZone.identifier) // => "GMT"
```

## URLComponents
### queryValue(for:) -> String?
URLパラメータ(name-value pair)からnameを指定してvalueを取得する

##### Declaration
```swift
func queryValue(for name: String) -> String?
```

##### Parameters
- name: クエリ名

##### Return Value
`name`に紐づく`value`

##### Discussion
該当するものがない場合は`nil`を返す

```swift
let components = URLComponents(string: "https://example.co.jp/index?q1=v1&q2=v2")
components?.queryValue(for: q1) // => Optional("v1")
```

## UIColor
### init(hex:alpha:)
16進数のRGBカラーコードからUIColorを作成

##### Declaration
```swfit
init(hex: Int, alpha: CGFloat = 1.0)
```

##### Parameters
- hex: 16進数のRGBカラーコード
- alpha: 透過値(0.0 - 1.0). 1.0は透過なし. default is 1.0.

##### Discussion
```swfit
let red = UIColor(hex: 0xFF0000)
let green = UIColor(hex: 0x00FF00)
let blue = UIColor(hex: 0x0000FF)
let white = UIColor(hex: 0xFFFFFF)
let black = UIColor(hex: 0x000000)
```
---
### init(cyan:magenta:yellow:black:alpha:)
CMYKによるUIColorの生成

##### Declaration
```swift
init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat = 1.0)
```

##### Parameters
- cyan: シアン(0.0-1.0)
- magenta: マゼンダ(0.0-1.0)
- yellow: イエロー(0.0-1.0)
- black: ブラック(0.0-1.0)
- alpha: 透過値(0.0 - 1.0). 1.0は透過なし. default is 1.0.

##### Discussion
```swift
let color = UIColor(cyan: 1.0, magenta: 1.0, yellow:1.0, black:1.0, alpha: 0.5)
```

## UIImage
### resize(to:) -> UIImage?
指定された`CGSize`にリサイズした`UIImage`を取得

##### Declaration
```swift
func resize(to toSize: CGSize) -> UIImage?
```

##### Parameters
- toSize: リサイズ後の`CGSize`

##### Discussion
```swift
let image = UIImage(named: "100x100")
let resized = image.resize(to: CGSize(width: 50, height: 50))
```
---
### createImageWith(color:size:) -> UIImage?
指定色で塗りつぶしたUIImageを取得

##### Declaration
```swift
static func createImageWith(color: UIColor, size: CGSize) -> UIImage?
```
##### Parameters
- color: 塗りつぶす色を`UIColor`で指定
- size: 取得したい`UIImage`のsizeを`CGSize`で指定

##### Discussion
```swift
let size = CGSize(width: 50, height: 50)
let image = UIImage.createImageWith(color: UIColor.red, size: size)
// 50×50の赤いUIImageを取得できる
```

## UIApplication
### func open(scheme:options:completionHandler:)

##### Declaration
```swift
func open(scheme: URLScheme, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil)
```

##### Parameters
- scheme: `URLScheme`を指定
- options: URLを開くときに使用するオプションの辞書。 この辞書に含めることができるキーのリストについては、URLオプションを参照してください。
- completion:結果とともに実行するブロック。 URLを開くことの成功または失敗を知らせたい場合は、このパラメーターに値を指定してください。 このブロックはアプリのメインスレッドで非同期に実行されます。 ブロックは戻り値を持たず、以下のパラメータを取ります。- success：URLが正常に開かれたかどうかを示すブール値。

##### Discussion
```swift
UIApplication.shared.open(scheme: .appSettings) { result in
    // handle completion
}
```

### URLScheme
`func open(scheme:options:completionHandler:)`で指定するenum.
##### Declaration
```swift
public enum URLScheme {
    case url(string: String)
    case tel(number: String)
    case telprompt(number: String)
    case settings
    case appSettings
}
```

##### cases
- url(string:): URLを文字列で指定する
- tel(number:): 確認アラートなしで電話発信を行う. iOS12から確認アラートが表示される.
- telprompt(number:): 確認アラートありで電話発信を行う.
- settings: 設定アプリを起動する
- appSettings: 設定アプリ内の自身のアプリランチャー画面を起動する. 通知のOn/Off, Appのバックグラウンド更新などを設定できる.