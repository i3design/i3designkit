[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://git.i3design.com/i3design-jp/i3designkit)
[![badge-platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)](https://git.i3design.com/i3design-jp/i3designkit)

i3designKit is a common internal library written in Swift.

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

To integrate i3designKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
git "https://git.i3design.com/i3design-jp/i3designkit.git"
```

Run `carthage update --platform iOS` to build the framework and drag the built `i3designKit.framework` into your Xcode project.
