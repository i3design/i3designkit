//
//  AnyDeletableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
import PromiseKit
import i3designKit

class AnyDeletableTests: XCTestCase {
    
    class SimpleDeleter: Deletable {
        typealias DeletionKey = String
        
        private(set) var dict = [String: String]()
        
        init(key: String, value: String) {
            dict[key] = value
        }
        
        func delete(key: String) -> Promise<Void> {
            return Promise { seal in
                self.dict[key] = nil
                seal.fulfill_()
            }
        }
    }
    
    func test_deletable() {
        
        let deleter = SimpleDeleter(key: "key", value: "value")
        let any = AnyDeletable(deleter)
        
        XCTAssertEqual("value", deleter.dict["key"])
        
        let ex = expectation(description: "")
        any.delete(key: "key")
            .done {
                XCTAssertNil(deleter.dict["key"])
                ex.fulfill()
            }
            .catch { error in
                XCTFail(error.localizedDescription)
        }
        wait(for: [ex], timeout: 1.0)
    }
}
