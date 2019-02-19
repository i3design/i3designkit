//
//  DateFormatterTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest

class DateFormatterTests: XCTestCase {
    
    let calender = Calendar(identifier: .gregorian)

    func test_dateFromString() {
        guard let date = DateFormatter.date(from: "20190214 12:01:30", format: "yyyyMMdd HH:mm:ss", calendar: calender) else {
            return
        }
        XCTAssertEqual(2019, calender.component(.year, from: date))
        XCTAssertEqual(2, calender.component(.month, from: date))
        XCTAssertEqual(14, calender.component(.day, from: date))
        XCTAssertEqual(12, calender.component(.hour, from: date))
        XCTAssertEqual(1, calender.component(.minute, from: date))
        XCTAssertEqual(30, calender.component(.second, from: date))
    }

    func test_stringFromDate() {
        let format = "yyyyMMdd HH:mm:ss"
        guard let date = DateFormatter.date(from: "20190214 12:01:30", format: format, calendar: calender) else {
            return
        }
        XCTAssertEqual("20190214 12:01:30", DateFormatter.string(from: date, format: format, calender: calender))
    }
}
