//
//  TimeZone.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension TimeZone {
    /// 日本時(Japan Standard Time)
    public static var JST: TimeZone {
        return TimeZone(identifier: "Asia/Tokyo")!
    }
    
    /// グリニッジ標準時(Greenwich Mean Time)
    public static var GMT: TimeZone {
        return TimeZone(identifier: "GMT")!
    }
}
