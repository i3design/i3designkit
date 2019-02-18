//
//  KeyObject.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import Foundation

struct KeyObject {
    let key: String
    var value: String = ""
    
    init(key: String, value: String = "") {
        self.key = key
        self.value = value
    }
}

extension KeyObject: Equatable {
    static func == (lhs: KeyObject, rhs: KeyObject) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}
