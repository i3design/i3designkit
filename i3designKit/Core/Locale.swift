//
//  Locale.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension Locale {
    
    /// Locale の identifier を "ja_JP" で取得
    public static var ja_JP: Locale {
        return Locale(identifier: "ja_JP")
    }
    
    /// Locale の identifier を "en_US" で取得
    public static var en_US: Locale {
        return Locale(identifier: "en_US")
    }
    
    /// Locale の identifier を "en_US_POSIX" で取得
    public static var en_US_POSIX: Locale {
        return Locale(identifier: "en_US_POSIX")
    }
}
