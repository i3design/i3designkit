//
//  TimeZoneTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class TimeZoneTests: XCTestCase {

    func test() {
        XCTAssertEqual("Asia/Tokyo", TimeZone.JST.identifier)
        XCTAssertEqual("GMT", TimeZone.GMT.identifier)
    }
}
