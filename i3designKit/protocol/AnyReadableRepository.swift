//
//  AnyReadableRepository.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

/// Type Erasure for ReadableRepository
public struct AnyReadableRepository<E>: ReadableRepository {
    public typealias Element = E
    
    private let _element: (String) -> Promise<Element>
    private let _elements: () -> Promise<[Element]>
    
    init<R: ReadableRepository>(_ repository: R) where R.Element == E {
        _element = repository.element
        _elements = repository.elements
    }
    
    public func element(key: String) -> Promise<Element> {
        return _element(key)
    }
    
    public func elements() -> Promise<[Element]> {
        return _elements()
    }
}
