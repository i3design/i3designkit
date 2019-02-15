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

//@testable import i3designKit
//import PromiseKit
//
//struct StubReadableRepository: ReadableRepository {
//
//    typealias Element = [String: String]
//
//    func element(key: String) -> Promise<StubReadableRepository.Element> {
//        return Promise { $0.fulfill([:]) }
//    }
//
//    func elements() -> Promise<[StubReadableRepository.Element]> {
//        return Promise { $0.fulfill([]) }
//    }
//
//    let values: [Element]
//
//    init(values: [Element]) {
//        self.values = values
//    }
//}
//
//class AnyReadableRepositoryTests: XCTestCase {
//
//    let values = [
//        ["0":"abc"],
//        ["1":"123"],
//        ]
//
//    func test_element() {
//        let ex1 = self.expectation(description: "ex1")
//        let ex2 = self.expectation(description: "ex2")
//
//        let repository = AnyReadableRepository(StubReadableRepository(values: values))
//
//        repository.element(key: "0")
//            .done { element in
//                XCTAssertEqual("abv", element["0"])
//                ex1.fulfill()
//            }
//            .catch { error in
//                XCTAssert(false, error.localizedDescription)
//        }
//
//        repository.element(key: "1")
//            .done { element in
//                XCTAssertEqual("abv", element["1"])
//                ex2.fulfill()
//            }
//            .catch { error in
//                XCTAssert(false, error.localizedDescription)
//        }
//
//        wait(for: [ex1, ex2], timeout: 1.0)
//
//    }
//    func test_elements() {
//        let ex = self.expectation(description: "")
//        let repository = AnyReadableRepository(StubReadableRepository(values: values))
//        repository.elements()
//            .done { elements in
//                ex.fulfill()
//                XCTAssertEqual(self.values, elements)
//            }.catch { error in
//                XCTAssert(false, error.localizedDescription)
//        }
//        wait(for: [ex], timeout: 1.0)
//    }
//}
