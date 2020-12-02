//
//  AnySetableTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
import PromiseKit
import i3designKit

class AnySettableTests: XCTestCase {
    
    class SimpleSetter: Settable {
        typealias Element = String
        
        private(set) var value: Element?
        
        func set(element: String) -> Promise<Void> {
            self.value = element
            return Promise { $0.fulfill(()) }
        }
    }
    
    func test_anySettable() {
        
        let setter = SimpleSetter()
        
        XCTAssertNil(setter.value)
        
        let ex = expectation(description: "")
        AnySettable(setter).set(element: "abc")
            .done {
                XCTAssertEqual("abc", setter.value)
                ex.fulfill()
            }
            .catch { error in
                XCTFail(error.localizedDescription)
        }
        wait(for: [ex], timeout: 1.0)
    }
}
