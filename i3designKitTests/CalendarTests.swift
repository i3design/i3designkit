//
//  CalendarTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class CalendarTests: XCTestCase {

    func test_gregorian() {
        XCTAssertEqual(Calendar.Identifier.gregorian, Calendar.gregorian.identifier)
    }
    func test_japanese() {
        XCTAssertEqual(Calendar.Identifier.japanese, Calendar.japanese.identifier)
    }
    func test_iso8601() {
        XCTAssertEqual(Calendar.Identifier.iso8601, Calendar.iso8601.identifier)
    }
}
