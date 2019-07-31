//
//  AnyRepositoryRW.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

/// Type Erasure for ReadableRepository & WritableRepository
@available(*, deprecated)
public struct AnyRepositoryRW<E>: RepositoryRW {
    public typealias Element = E
    
    private let _element: (String) -> Promise<Element>
    private let _elements: () -> Promise<[Element]>
    private let _set: ([Element]) -> Promise<Void>
    
    public init<R: RepositoryRW>(_ repository: R) where R.Element == E {
        _element = repository.element
        _elements = repository.elements
        _set = repository.set
    }
    
    public func element(key: String) -> Promise<Element> {
        return _element(key)
    }
    
    public func elements() -> Promise<[Element]> {
        return _elements()
    }
    
    public func set(_ elements: [Element]) -> Promise<Void> {
        return _set(elements)
    }
}
