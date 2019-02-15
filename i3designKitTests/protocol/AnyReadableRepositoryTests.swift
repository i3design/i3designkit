//
//  AnyReadableRepositoryTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest
import PromiseKit
@testable import i3designKit

struct StubReadableRepository: ReadableRepository {
    
    typealias Element = KeyObject
    
    let values: [Element]
    
    init(values: [Element]) {
        self.values = values
    }

    func element(key: String) -> Promise<Element> {
        return Promise { seal in
            guard let ret = self.values.filter({ $0.key == key }).first else {
                throw RepositoryError.dataIllegal("not found for \(key)")
            }
            seal.fulfill(ret)
        }
    }
    
    func elements() -> Promise<[Element]> {
        return Promise { $0.fulfill(self.values) }
    }
}

class AnyReadableRepositoryTests: XCTestCase {

    let objects = [
        KeyObject(key: "key1"),
        KeyObject(key: "key2"),
        ]
    
    func test_element() {
        
        let ex = self.expectation(description: "ex1")
        
        let repository = StubReadableRepository(values: objects)
        let anyRepository = AnyReadableRepository(repository)

        // repository と anyRepository の結果が一致する
        when(fulfilled: repository.element(key: "key1"), anyRepository.element(key: "key1"))
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                XCTAssert(false, error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_elements() {
        
        let ex = self.expectation(description: "")
        
        let repository = StubReadableRepository(values: objects)
        let anyRepository = AnyReadableRepository(repository)
        
        // repository と anyRepository の結果が一致する
        when(fulfilled: repository.elements(), anyRepository.elements())
            .done { elements1, elements2 in
                ex.fulfill()
                XCTAssertEqual(elements1, elements2)
            }.catch { error in
                XCTAssert(false, error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
}
