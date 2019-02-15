//
//  Sequence+DecodableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/14.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest

class Sequence_DecodableTests: XCTestCase {

    private struct AnyObject: Codable {
        let title: String
    }
    
    func test_typeSpecification_DataList() {
        do {
            let data = try JSONEncoder().encode(AnyObject(title: "タイトル"))
            let objects = try [data].decodes(AnyObject.self, decoder: JSONDecoder())
            XCTAssertEqual(1, objects.count)
            XCTAssertEqual("タイトル", objects[0].title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func test_typeInference_DataList() {
        do {
            let data = try JSONEncoder().encode(AnyObject(title: "タイトル"))
            let objects: [AnyObject] = try [data].decodes(JSONDecoder())
            XCTAssertEqual(1, objects.count)
            XCTAssertEqual("タイトル", objects[0].title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func test_typeSpecification_Strings() {
        let jsonString = "{\"title\": \"タイトル\"}"
        do {
            let objects = try [jsonString].decodes(AnyObject.self, using: .utf8, decoder: JSONDecoder())
            XCTAssertEqual(1, objects.count)
            XCTAssertEqual("タイトル", objects[0].title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func test_typeInference_Strings() {
        let jsonString = "{\"title\": \"タイトル\"}"
        do {
            let objects: [AnyObject] = try [jsonString].decodes(using: .utf8, decoder: JSONDecoder())
            XCTAssertEqual(1, objects.count)
            XCTAssertEqual("タイトル", objects[0].title)
        }
        catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
}
