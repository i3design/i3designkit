//
//  AnyRepositoryREW.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

/// Type Erasure for ReadableRepository & WritableRepository & EditableRepository
@available(*, deprecated)
public struct AnyRepositoryREW<E>: RepositoryREW {
    public typealias Element = E
    
    private let _element: (String) -> Promise<Element>
    private let _elements: () -> Promise<[Element]>
    private let _set: ([Element]) -> Promise<Void>
    private let _add: (Element) -> Promise<Void>
    private let _update: (Element) -> Promise<Void>
    private let _remove: (String) -> Promise<Void>
    private let _removeAll: () -> Promise<Void>
    
    public init<R: RepositoryREW>(_ repository: R) where R.Element == E {
        _element = repository.element
        _elements = repository.elements
        _set = repository.set
        _add = repository.add
        _update = repository.update
        _remove = repository.remove
        _removeAll = repository.removeAll
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
    
    public func add(_ element: Element) -> Promise<Void> {
        return _add(element)
    }
    
    public func update(_ element: Element) -> Promise<Void> {
        return _update(element)
    }
    
    public func remove(key: String) -> Promise<Void> {
        return _remove(key)
    }
    
    public func removeAll() -> Promise<Void> {
        return _removeAll()
    }
}

