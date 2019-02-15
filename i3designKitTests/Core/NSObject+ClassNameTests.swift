//
//  NSObject+ClassNameTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class NSObject_ClassNameTests: XCTestCase {

    private class AnyObject: NSObject {
    }
    
    func test_computedProperty() {
        XCTAssertEqual("AnyObject", AnyObject().className)
    }

    func test_staticProperty() {
        XCTAssertEqual("AnyObject", AnyObject.className)
    }
}
