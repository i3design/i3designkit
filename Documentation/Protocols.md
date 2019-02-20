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