//
//  Storyboardable.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import UIKit

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
    var name: String { get }
    var bundle: Bundle? { get }
}

extension Storyboardable {
    
    public var bundle: Bundle? {
        return nil
    }
    
    public var instantiateInitialViewController: UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    
    public func instantiateViewController<T: UIViewController>(_ type: T.Type) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: T.className) as? T
    }
}
