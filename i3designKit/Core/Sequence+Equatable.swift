//
//  Sequence+Equatable.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension Sequence where Element: Equatable {
    
    /// 重複した要素のない配列を取得
    public var unique: [Element] {
        return reduce([Element]()) { $0.contains($1) ? $0 : $0 + [$1] }
    }
    
    /// 配列の差分（引き算）
    ///
    /// - Parameter other: 除外する値の配列
    /// - Returns: otherに含まれるものが除外された配列
    public func subtracting(_ other: [Element]) -> [Element] {
        return compactMap { element in
            if other.filter({ $0 == element }).count == 0 {
                return element
            }
            return nil
        }
    }
}
