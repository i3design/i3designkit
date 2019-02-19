//
//  WritableRepository.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import PromiseKit

/// 書き込み機能をもったリポジトリパターン用プロトコル
public protocol WritableRepository {
    
    associatedtype Element
    
    /// 上書き
    ///
    /// - Parameter [Element]: 上書きする [Element]
    /// - Returns: 更新完了ハンドラ. error は Promise.reject で返す
    func set(_: [Element]) -> Promise<Void>
}

public typealias RepositoryRW = ReadableRepository & WritableRepository
