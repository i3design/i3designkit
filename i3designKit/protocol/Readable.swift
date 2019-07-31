//
//  Readable.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

public protocol Readable {
    
    associatedtype Element
    
    associatedtype Key
    
    func element(key: Key) -> Promise<Element>
}

public extension Readable where Key == Void {
    
    func element() -> Promise<Element> {
        return element(key: ())
    }
}

public struct AnyReadable<E, K>: Readable {
    
    public typealias Element = E
    
    public typealias Key = K
    
    private let _element: (Key) -> Promise<E>
    
    public init<R: Readable>(_ readable: R) where R.Element == E, R.Key == K {
        _element = readable.element
    }
    
    public func element(key: K) -> Promise<E> {
        return _element(key)
    }
}
