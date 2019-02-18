//
//  NSObject+ClassName.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension NSObject {
    /// クラス名を文字列で取得
    public static var className: String {
        return String(describing: self)
    }
    
    /// クラス名を文字列で取得
    public var className: String {
        return type(of: self).className
    }
}
