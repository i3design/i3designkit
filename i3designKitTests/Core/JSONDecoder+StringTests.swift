//
//  JSONDecoder+StringTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class JSONDecoder_StringTests: XCTestCase {

    struct Decode: Decodable {
        var title: String
    }
    
    
    func test_typeSpecification() {
        let jsonString = """
        {
            "title": "タイトル"
        }
        """
        do {
            let value = try JSONDecoder().decode(Decode.self, string: jsonString, using: .utf8)
            XCTAssertEqual("タイトル", value.title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

    func test_hoge() {
        let jsonString = """
        {
            "title": "タイトル"
        }
        """
        do {
            let value: Decode = try JSONDecoder().decode(string: jsonString, using: .utf8)
            XCTAssertEqual("タイトル", value.title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
}
