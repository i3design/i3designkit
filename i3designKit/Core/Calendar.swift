//
//  Calendar.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension Calendar {
    
    /// Calendar.identifier == .gregorian のインスタンスを取得
    public static var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
    
    /// Calendar.identifier == .japanese のインスタンスを取得
    public static var japanese: Calendar {
        return Calendar(identifier: .japanese)
    }
    
    /// Calendar.identifier == .iso8601 のインスタンスを取得
    public static var iso8601: Calendar {
        return Calendar(identifier: .iso8601)
    }
}
