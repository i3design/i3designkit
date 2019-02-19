//
//  URLComponentsTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest

class URLComponentsTests: XCTestCase {

    func test_queryValue() {
        guard let components = URLComponents(string: "https://example.co.jp/index?q1=v1&q2=v2") else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual("v1", components.queryValue(for: "q1"))
        XCTAssertEqual("v2", components.queryValue(for: "q2"))
    }
}
