//
//  Deletable.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

public protocol Deletable {
    
    associatedtype DeletionKey
    
    func delete(key: DeletionKey) -> Promise<Void>
}

public struct AnyDeletable<K>: Deletable {
    
    public typealias DeletionKey = K
    
    private let _delete: (K) -> Promise<Void>
    
    public init<D: Deletable>(_ deletable: D) where D.DeletionKey == K {
        _delete = deletable.delete
    }
    
    public func delete(key: K) -> Promise<Void> {
        return _delete(key)
    }
}
