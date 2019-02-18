//
//  AnyRepositoryRETests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/18.
//  Copyright © 2019 i3design. All rights reserved.
//

import XCTest
import PromiseKit
@testable import i3designKit

final class RERepository: RepositoryRE {
    typealias Element = KeyObject
    
    private var values: [KeyObject]
    
    init(values: [KeyObject]) {
        self.values = values
    }
    
    func element(key: String) -> Promise<KeyObject> {
        return elements().firstValue(where: { $0.key == key })
    }
    
    func elements() -> Promise<[KeyObject]> {
        return Promise { $0.fulfill(self.values) }
    }
    
    func add(_ element: KeyObject) -> Promise<Void> {
        return Promise { seal in
            self.values = self.values + [element]
            seal.fulfill(())
        }
    }
    
    func update(_ element: KeyObject) -> Promise<Void> {
        return Promise { seal in
            var values = self.values
            if let index = values.firstIndex(where: { $0.key == element.key }) {
                values[index] = element
                self.values = values
            }
            seal.fulfill(())
        }
    }
    
    func remove(key: String) -> Promise<Void> {
        return Promise { seal in
            var values = self.values
            if let index = values.firstIndex(where: { $0.key == key }) {
                values.remove(at: index)
                self.values = values
            }
            seal.fulfill(())
        }
    }
    
    func removeAll() -> Promise<Void> {
        return Promise { seal in
            self.values = []
            seal.fulfill(())
        }
    }
}

class AnyRepositoryRETests: XCTestCase {

    func test_elements() {
        
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [KeyObject(key: "key")])
        let anyRepository = AnyRepositoryRE(repository)
        
        // 結果が一致する
        when(fulfilled: repository.elements(), anyRepository.elements())
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_element() {
        
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [KeyObject(key: "key")])
        let anyRepository = AnyRepositoryRE(repository)
        
        // 結果が一致する
        when(fulfilled: repository.element(key: "key"), anyRepository.element(key: "key"))
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_add() {
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [])
        let anyRepository = AnyRepositoryRE(repository)
        
        // anyRepository.add() の実行で repository 側の値が更新される かつ 同じ値を取得できる
        anyRepository.elements()
            .get { XCTAssertTrue($0.isEmpty)  }
            .then { _ in anyRepository.add(KeyObject(key: "key")) }
            .then { _ in when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(1, e1.count)
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }

        wait(for: [ex], timeout: 1.0)
    }
    
    func test_update() {
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [KeyObject(key: "key", value: "aaa")])
        let anyRepository = AnyRepositoryRE(repository)
        
        // anyRepository.update() の実行で repository 側の値が更新される かつ 同じ値を取得できる
        anyRepository.update(KeyObject(key: "key", value: "bbb"))
            .then { _ in when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual("bbb", e1.first?.value)
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_remove() {
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [
                KeyObject(key: "key1", value: "aaa"),
                KeyObject(key: "key2", value: "bbb")
            ])
        let anyRepository = AnyRepositoryRE(repository)
        
        anyRepository.remove(key: "key1")
            .then { _ in when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(1, e1.count)
                XCTAssertEqual("bbb", e1.first?.value)
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
    
    func test_removeAll() {
        let ex = self.expectation(description: "")
        let repository = RERepository(values: [
            KeyObject(key: "key1", value: "aaa"),
            KeyObject(key: "key2", value: "bbb")
            ])
        let anyRepository = AnyRepositoryRE(repository)
        
        // anyRepository.update() の実行で repository 側の値が更新される かつ 同じ値を取得できる
        anyRepository.removeAll()
            .then { _ in when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertTrue(e1.isEmpty)
                XCTAssertEqual(e1, e2)
            }
            .catch { error in
                ex.fulfill()
                XCTFail(error.localizedDescription)
        }
        
        wait(for: [ex], timeout: 1.0)
    }
}
