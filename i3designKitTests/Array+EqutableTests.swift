//
//  Array+EqutableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class Array_EqutableTests: XCTestCase {
    
    func test_subtract() {
        var array = [1,2]
        array.subtract([2])
        XCTAssertEqual([1], array)
        
        array = [1,2]
        array.subtract([2,3])
        XCTAssertEqual([1], array)
        
        array = [1,2]
        array.subtract([3,4])
        XCTAssertEqual([1,2], array)
    }
    
    func test_subtract_empty() {
        var array = [1]
        array.subtract([])
        XCTAssertEqual([1], array)
        
        array = [1,2]
        array.subtract([])
        XCTAssertEqual([1,2], array)
    }
    
    func test_subtract_equal() {
        var array = [1]
        array.subtract([1])
        XCTAssertEqual([], array)
        
        array = [1,2]
        array.subtract([1,2])
        XCTAssertEqual([], array)
    }
    
    func test_subtract_duplication() {
        var array = [1,1]
        array.subtract([1,1])
        XCTAssertEqual([], array)
        
        array = [1,1]
        array.subtract([1])
        XCTAssertEqual([], array)
        
        array = [1]
        array.subtract([1,1])
        XCTAssertEqual([], array)
    }
}
