//
//  Injectable.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

public protocol Injectable {
    associatedtype Dependency
    init(with dependency: Dependency)
}
