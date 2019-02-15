//
//  StringTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    func test_split() {
        XCTAssertEqual(["a", "b", "c"], "abc".split(length: 1))
        XCTAssertEqual(["ab", "c"], "abc".split(length: 2))
        XCTAssertEqual(["abc"], "abc".split(length: 0))
    }
}
