//
//  ReadableRepository.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import PromiseKit

enum RepositoryError: Error {
    /// 未定義
    case notDefined
    /// データ不正
    case dataIllegal(String)
}

protocol ReadableRepository {
    
    associatedtype Element
    
    func element(key: String) -> Promise<Element>
    
    func elements() -> Promise<[Element]>
}
