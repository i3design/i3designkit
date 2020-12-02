//
//  String.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

public extension String {
    /// 指定した長さで文字列を分割します
    ///
    /// - Parameter size: 分割の単位となる長さ (例: 2文字毎に区切りたい場合は2を指定する)
    /// - Returns: 分割結果の配列
    func split(length: Int) -> [String] {
        if length < 1 {
            return [self]
        }
        
        var source = self
        for i in 0 ..< (source.count - 1) / length {
            let offset = (i + 1) * length + i
            let index = source.index(source.startIndex, offsetBy: offset)
            source.insert(",", at: index)
        }
        
        return source.components(separatedBy: ",")
    }
}

public extension String {

    func replacingCharacters<T>(in range: NSRange, with replacement: T) -> String where T: StringProtocol {
        guard let r = Range(range, in: self) else {
            return self
        }
        return replacingCharacters(in: r, with: replacement)
    }
}
