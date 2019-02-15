//
//  Either.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/12.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

/// 型Aか型Bのどちらかのオブジェクトを返す型
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)
    
    var left: Left? {
        switch self {
        case let .left(x):
            return x
            
        case .right:
            return nil
        }
    }
    
    var right: Right? {
        switch self {
        case .left:
            return nil
            
        case let .right(x):
            return x
        }
    }
}
