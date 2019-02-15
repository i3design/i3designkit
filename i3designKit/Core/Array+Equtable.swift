//
//  Array+Equtable.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    /// 配列の差分（引き算）
    ///
    /// - Parameter other: 除外する値の配列
    public mutating func subtract(_ other: [Element]) {
        self = subtracting(other)
    }
}
