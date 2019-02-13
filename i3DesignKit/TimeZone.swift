//
//  TimeZone.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension TimeZone {
    /// 日本時(Japan Standard Time)
    static var JST: TimeZone {
        return TimeZone(identifier: "Asia/Tokyo")!
    }
    
    /// 協定世界時(Universal Time, Coordinated)
    static var UTC: TimeZone {
        return TimeZone(identifier: "UTC")!
    }
}
