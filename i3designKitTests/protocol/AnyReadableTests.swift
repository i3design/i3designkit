//
//  AnyReadableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
import PromiseKit
import i3designKit

class AnyReadableTests: XCTestCase {
    
    struct SimpleReadable: Readable {
        typealias Element = String
        typealias Key = Int
        
        let value: String
        
        init(value: String) {
            self.value = value
        }
        
        func element(key: Key) -> Promise<String> {
            return Promise { $0.fulfill(self.value) }
        }
    }
    struct KeyVoidReadable: Readable {
        typealias Element = String
        typealias Key = Void
        
        let value: String
        
        init(value: String) {
            self.value = value
        }
        
        func element(key: Key) -> Promise<String> {
            return Promise { $0.fulfill(self.value) }
        }
    }
    
    func test_simmple_readable() {
        let reader = AnyReadable(SimpleReadable(value: "aaa"))
        let ex = self.expectation(description: "")
        reader.element(key: 0)
            .done { value in
                XCTAssertEqual("aaa", value)
                ex.fulfill()
            }.catch { (error) in
                XCTFail(error.localizedDescription)
        }
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_key_void_readable() {
        let reader = AnyReadable(KeyVoidReadable(value: "aaa"))
        let ex = self.expectation(description: "")
        reader.element()
            .done { value in
                XCTAssertEqual("aaa", value)
                ex.fulfill()
            }.catch { (error) in
                XCTFail(error.localizedDescription)
        }
        wait(for: [ex], timeout: 1.0)
    }
}
