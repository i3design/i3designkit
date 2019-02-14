//
//  Sequence+EquatableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class Sequence_EquatableTests: XCTestCase {

    func test_unique() {
        XCTAssertEqual([1,2,3], [1,2,3].unique)
        XCTAssertEqual([1,2], [1,1,2].unique)
        XCTAssertEqual([1,2], [1,2,2].unique)
        XCTAssertEqual([1,2], [1,1,2,2].unique)
    }
    
    func test_subtracting() {
        XCTAssertEqual([], [1].subtracting([1]))
        XCTAssertEqual([1], [1].subtracting([]))
        XCTAssertEqual([], [1,2].subtracting([1,2]))
        XCTAssertEqual([1], [1,2].subtracting([2]))
        XCTAssertEqual([1], [1,2].subtracting([2,3]))
        XCTAssertEqual([1,2], [1,2].subtracting([3,4]))
    }
}
