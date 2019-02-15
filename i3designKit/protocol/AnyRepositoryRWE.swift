//
//  AnyRepositoryRWE.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import PromiseKit

/// Type Erasure for RepositoryRWE
struct AnyRepositoryRWE<E>: RepositoryRWE {
    typealias Element = E
    
    private let _element: (String) -> Promise<Element>
    private let _elements: () -> Promise<[Element]>
    private let _set: ([Element]) -> Promise<Void>
    private let _add: (Element) -> Promise<Void>
    private let _update: (Element) -> Promise<Void>
    private let _remove: (String) -> Promise<Void>
    private let _removeAll: () -> Promise<Void>
    
    init<R: RepositoryRWE>(_ repository: R) where R.Element == E {
        _element = repository.element
        _elements = repository.elements
        _set = repository.set
        _add = repository.add
        _update = repository.update
        _remove = repository.remove
        _removeAll = repository.removeAll
    }
    
    func element(key: String) -> Promise<Element> {
        return _element(key)
    }
    
    func elements() -> Promise<[Element]> {
        return _elements()
    }
    
    func set(_ elements: [Element]) -> Promise<Void> {
        return _set(elements)
    }
    
    func add(_ element: Element) -> Promise<Void> {
        return _add(element)
    }
    
    func update(_ element: Element) -> Promise<Void> {
        return _update(element)
    }
    
    func remove(key: String) -> Promise<Void> {
        return _remove(key)
    }
    
    func removeAll() -> Promise<Void> {
        return _removeAll()
    }
}

