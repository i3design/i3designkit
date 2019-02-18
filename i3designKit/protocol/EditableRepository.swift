//
//  EditableRepository.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import PromiseKit

public protocol EditableRepository {
    
    associatedtype Element
    
    /// 追加
    ///
    /// - Parameter Element: 追加する Element
    /// - Returns: 更新完了ハンドラ. error は Promise.reject で返す
    func add(_: Element) -> Promise<Void>
    
    /// 更新
    ///
    /// - Parameter: Elementを更新
    /// - Returns: 更新完了ハンドラ. error は Promise.reject で返す
    func update(_: Element) -> Promise<Void>
    
    /// 削除
    ///
    /// - Parameter RepositoryArgument で指定したElementを削除
    /// - Returns: 更新完了ハンドラ. error は Promise.reject で返す
    func remove(key: String) -> Promise<Void>
    
    /// 全件削除
    ///
    /// - Returns: 更新完了ハンドラ. error は Promise.reject で返す
    func removeAll() -> Promise<Void>
}

public typealias RepositoryRE = ReadableRepository & EditableRepository
public typealias RepositoryREW = ReadableRepository & WritableRepository & EditableRepository
