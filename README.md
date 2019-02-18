[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://git.i3design.com/i3design-jp/i3designkit)

i3designKit is common library for internal use written in Swift.

# i3designKit 1.0 Released
i3designKit 1.0 has been released;

## Requirements

- iOS 11.0+ / macOS 10.14+
- Xcode 10.1+
- Swift 4.2+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
git "https://git.i3design.com/i3design-jp/i3designkit.git"
```

Run `carthage update` to build the framework and drag the built `Alamofire.framework` into your Xcode project.
