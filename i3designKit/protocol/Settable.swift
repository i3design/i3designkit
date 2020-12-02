//
//  Settable.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

public protocol Settable {
    
    associatedtype Element
    
    func set(element: Element) -> Promise<Void>
}

public struct AnySettable<E>: Settable {
    
    public typealias Element = E
    
    private let _set: (Element) -> Promise<Void>
    
    public init<S: Settable>(_ setable: S) where S.Element == E {
        _set = setable.set
    }
    
    public func set(element: Element) -> Promise<Void> {
        return _set(element)
    }
}
