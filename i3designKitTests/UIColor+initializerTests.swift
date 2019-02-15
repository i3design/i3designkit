//
//  UIColor+initializerTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class UIColor_initializerTests: XCTestCase {

    func test_RGB() {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        let red = UIColor(hex: 0x112233, alpha: 0.5)
        red.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        XCTAssertEqual(r, 0x11/255.0)
        XCTAssertEqual(g, 0x22/255.0)
        XCTAssertEqual(b, 0x33/255.0)
        XCTAssertEqual(a, 0.5)
    }
    
    func test_CMYK() {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        let color = UIColor(cyan: 0.1, magenta: 0.2, yellow: 0.3, black: 0.4, alpha: 0.5)
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        XCTAssertEqual(r, round(138/255.0 * 100)/100)
        XCTAssertEqual(g, round(122/255.0 * 100)/100)
        XCTAssertEqual(b, round(107/255.0 * 100)/100)
        XCTAssertEqual(a, 0.5)
    }
}
