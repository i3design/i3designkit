//
//  Storyboardable.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

/// Storyboard から ViewController のインスタンス取得を簡素にするプロトコル
///
///     // 実装例
///     enum Storyboard: Storyboardable {
///         case main
///
///         var name: String {
///             switch self {
///             case .main:
///                 return "Main"
///             }
///         }
///     }
///
///     let viewController = Storyboard.main.instantiateInitialViewController
///     let myViewController = Storyboard.main.instantiateViewController(MyViewController.self)
public protocol Storyboardable {
    /// storyboardのファイル名
    var name: String { get }
    /// storyboardを取得するBundle. default は nil.
    var bundle: Bundle? { get }
}

extension Storyboardable {
    
    public var bundle: Bundle? {
        return nil
    }
    
    /// instantiateInitialViewController() を取得
    public var instantiateInitialViewController: UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    
    /// instantiateViewController(withIdentifier:) を取得
    public func instantiateViewController<T: UIViewController>(_ type: T.Type) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: T.className) as? T
    }
}
