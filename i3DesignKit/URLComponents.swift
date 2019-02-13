//
//  URLComponents.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension URLComponents {
    func queryValue(for name: String) -> String? {
        return self.queryItems?.filter { $0.name == name }.first?.value
    }
}
