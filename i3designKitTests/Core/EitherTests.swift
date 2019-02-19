//
//  EitherTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
@testable import i3designKit

class EitherTests: XCTestCase {

    func test_Left() {
        let either = Either<String, Int>.left("left")
        switch either {
        case .left(let value):
            XCTAssertEqual("left", value)
        case .right(_):
            XCTAssert(false)
        }
    }

    func test_Right() {
        let either = Either<String, Int>.right(1)
        switch either {
        case .left(_):
            XCTAssert(false)
        case .right(let value):
            XCTAssertEqual(1, value)
        }
    }
}
