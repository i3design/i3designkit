//
//  URLComponents.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension URLComponents {
    /// URLパラメータ(name-value pair)からnameを指定してvalueを取得する
    ///
    /// - Parameter name: クエリ名
    /// - Returns: 対応する value. 該当するものがない場合は nil を返す.
    public func queryValue(for name: String) -> String? {
        return self.queryItems?.filter { $0.name == name }.first?.value
    }
}
