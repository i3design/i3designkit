//
//  LocaleTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class LocaleTests: XCTestCase {

    func test_jp_JP() {
        XCTAssertEqual("ja_JP", Locale.ja_JP.identifier)
    }
    
    func test_en_US() {
        XCTAssertEqual("en_US", Locale.en_US.identifier)
    }

    func test_en_US_POSIX() {
        XCTAssertEqual("en_US_POSIX", Locale.en_US_POSIX.identifier)
    }
}
