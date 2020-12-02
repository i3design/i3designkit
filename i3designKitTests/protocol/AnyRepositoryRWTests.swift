//
//  AnyRepositoryRWTests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/15.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
import PromiseKit
@testable import i3designKit

@available(*, deprecated)
final class RWRepository: RepositoryRW {
    
    typealias Element = KeyObject
    
    private(set) var objects: [Element]
    
    init(objects: [Element]) {
        self.objects = objects
    }
    
    func element(key: String) -> Promise<Element> {
        return Promise { seal in
            guard let value = self.objects.first(where: { $0.key == key }) else {
                throw RepositoryError.dataIllegal("not found for \(key)")
            }
            seal.fulfill(value)
        }
    }
    
    func elements() -> Promise<[KeyObject]> {
        return Promise { $0.fulfill(self.objects) }
    }
    
    func set(_ objects: [KeyObject]) -> Promise<Void> {
        return Promise { seal in
            self.objects = objects
            seal.fulfill(())
        }
    }
}

@available(*, deprecated)
class AnyRepositoryRWTests: XCTestCase {

    func test_elements() {
        
        let ex = self.expectation(description: "")
        let repository = RWRepository(objects: [KeyObject(key: "key1")])
        let anyRepository = AnyRepositoryRW(repository)

        // 結果が一致する
        when(fulfilled: repository.elements(), anyRepository.elements())
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                XCTAssert(false, error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_element() {
        
        let ex = self.expectation(description: "")
        let repository = RWRepository(objects: [KeyObject(key: "key1")])
        let anyRepository = AnyRepositoryRW(repository)

        // 結果が一致する
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
    
    func test_set() {
        
        let ex = self.expectation(description: "")
        let repository = RWRepository(objects: [KeyObject(key: "key1")])
        let anyRepository = AnyRepositoryRW(repository)

        let key3 = KeyObject(key: "key3")
        
        // anyRepository から set したら repository も更新され、取得される結果が一致する
        anyRepository.set([key3])
            .then { when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                XCTAssert(false, error.localizedDescription)
        }

        wait(for: [ex], timeout: 1.0)
    }
}
