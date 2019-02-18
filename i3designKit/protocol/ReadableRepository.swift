//
//  ReadableRepository.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import PromiseKit

public protocol ReadableRepository {
    
    associatedtype Element
    
    func element(key: String) -> Promise<Element>
    
    func elements() -> Promise<[Element]>
}
