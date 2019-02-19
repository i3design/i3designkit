//
//  NumberFormatter+NumberStyleTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest

class NumberFormatter_NumberStyleTests: XCTestCase {
    
    func test_styleNone() {
        let number = NSNumber(value: 1234)
        let locale = Locale(identifier: "ja_JP")
        let result = NumberFormatter.string(from: number, style: .none, locale: locale)
        XCTAssertEqual("1234", result)
    }

    func test_jpyString() {
        XCTAssertEqual("¥1,234", NumberFormatter.jpyString(from: 1234))
    }
    
    func test_decimalString() {
        XCTAssertEqual("1,234", NumberFormatter.decimalString(from: 1234))
    }
}
