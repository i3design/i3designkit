# Protocols

## Injectable
### Declaration
```swift
protocol Injectable
```

### Overview
Dependency Injectionに準拠させるプロトコル.

```swift
protocol SayProtocol {
    var say: String { get }
}

struct SayHello: SayProtocol {
    var say: String {
    	return "Hello"
    }
}

struct MySay: Injectable {
	typealias Dependency = SayProtocol
	
	private let dependency: Dependency
	
	init(dependency: Dependency) {
	    self.dependency = dependency
	}
	
	var say: String {
	    return dependency.say
	}
}

let object = MySay(dependency: SayHello())
print(object.say) // => "Hello"
```

## Storyboardable
`storyboard`から`ViewController`のインスタンス取得を簡易にするためのプロトコル. `ViewController`の`Storyboard ID`をViewController名と一致させる必要がある.

### Declaration
```swift
protocol Storyboardable
```

### Interface Propaties
```swift
var name: String { get }
```
Storyboardの名前を返す. Required.

```swift
var bundle: Bundle? { get }
```
storyboardを取得するBundleを指定. default is nil. Optional.

### Discussion
```swift
enum Storyboard: Storyboardable {
    case main
    
    var name: String {
        switch self {
        case .main:
            return "Main"
        }
    }
}
// Main.storyboard の instantiateInitialViewController を取得
let viewController = Storyboard.main.instantiateInitialViewController

// Main.storyboard の MyViewController を取得
let myViewController = Storyboard.main.instantiateViewController(MyViewController.self)
```

# Repositories

## ReadableRepository
読込機能を持ったリポジトリプロトコル. PromiseKitに依存.

### Declaration
```swift
protocol ReadableRepository
```

### Associated Type
```
assosiatedType Element
```

### Interface funcsions
```swift
func element(key: String) -> Promise<Element>
```
keyを渡してElementを非同期で取得する

```swift
func elements() -> Promise<[Element]>
```
全件を非同期で取得する

## WritableRepository
書込み機能を持ったリポジトリプロトコル. PromiseKitに依存.

### Declaration
```swift
protocol WritableRepository
```

### Associated Type
```
assosiatedType Element
```

### Interface funcsions
```swift
func set(_: [Element]) -> Promise<Void>
```
全件を更新し、完了を非同期で返す

## EditableRepository
編集機能を持ったリポジトリプロトコル. PromiseKitに依存.

### Declaration
```swift
protocol EditableRepository
```

### Associated Type
```
assosiatedType Element
```

### Interface funcsions
```swift
func add(_: Element) -> Promise<Void>
``` 
`Element`を追加して完了を非同期で返す

```swift
func update(_: Element) -> Promise<Void>
``` 
`Element`を更新して完了を非同期で返す

```swift
func remove(key: String) -> Promise<Void>
``` 
keyを指定して`Element`を削除して完了を非同期で返す

```swift
func removeAll() -> Promise<Void>
```
全件を削除して完了を非同期で返す

## RepositoryError
リポジトリパターンで返すエラー
### Declaration
```swift
public enum RepositoryError: Error {
    case notDefined
    case dataIllegal(String)
}
```

### Case
##### notDefined
Interface function が未定義

##### dataIllegal(String)
データ不正. 任意のテキストを指定可能.

## typealias
### RepositoryRE
```swift
typealias RepositoryRE = ReadableRepository & EditableRepository
```

### RepositoryREW
```swift
typealias RepositoryREW = ReadableRepository & WritableRepository & EditableRepository
```

### RepositoryRW
```swift
typealias RepositoryRW = ReadableRepository & WritableRepository
```


## Type Erasure
### AnyReadableRepository
Type Erasure for ReadableRepository

```swift
struct AnyReadableRepository<E>: ReadableRepository
```

### AnyRepositoryRE
Type Erasure for ReadableRepository & EditableRepository

```swift
struct AnyRepositoryRE<E>: RepositoryRE
```

### AnyRepositoryREW
Type Erasure for ReadableRepository & WritableRepository & EditableRepository

```swift
public struct AnyRepositoryREW<E>: RepositoryREW
```

### AnyRepositoryRW
Type Erasure for ReadableRepository & WritableRepository

```swift
public struct AnyRepositoryRW<E>: RepositoryRW
```
