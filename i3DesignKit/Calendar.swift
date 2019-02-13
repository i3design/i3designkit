//
//  Calendar.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension Calendar {
    static var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
    
    static var japanese: Calendar {
        return Calendar(identifier: .japanese)
    }
    
    static var iso8601: Calendar {
        return Calendar(identifier: .iso8601)
    }
}
