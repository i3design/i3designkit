//
//  AnyRepositoryRWETests.swift
//  i3designKitTests
//
//  Created by Takuto Nagano on 2019/02/18.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import XCTest
import PromiseKit
@testable import i3designKit

@available(*, deprecated)
final class REWRepository: RepositoryREW {
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
    
    func set(_ elements: [KeyObject]) -> Promise<Void> {
        return Promise {
            self.values = elements
            $0.fulfill(())
        }
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

@available(*, deprecated)
class AnyRepositoryRWETests: XCTestCase {
    
    func test_elements() {
        
        let ex = self.expectation(description: "")
        let repository = REWRepository(values: [KeyObject(key: "key")])
        let anyRepository = AnyRepositoryREW(repository)
        
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
        let repository = REWRepository(values: [KeyObject(key: "key")])
        let anyRepository = AnyRepositoryREW(repository)
        
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
    
    func test_set() {
        let ex = self.expectation(description: "")
        let repository = REWRepository(values: [KeyObject(key: "key")])
        let anyRepository = AnyRepositoryREW(repository)
        
        // anyRepository.set() の実行で repository 側の値が更新される かつ 同じ値を取得できる
        anyRepository.set([KeyObject(key: "key1"), KeyObject(key: "key2")])
            .then { _ in when(fulfilled: repository.elements(), anyRepository.elements()) }
            .done { e1, e2 in
                ex.fulfill()
                XCTAssertEqual(2, e1.count)
                XCTAssertEqual("key1", e1[0].key)
                XCTAssertEqual("key2", e1[1].key)
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
        let repository = REWRepository(values: [])
        let anyRepository = AnyRepositoryREW(repository)
        
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
        let repository = REWRepository(values: [KeyObject(key: "key", value: "aaa")])
        let anyRepository = AnyRepositoryREW(repository)
        
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
        let repository = REWRepository(values: [
            KeyObject(key: "key1", value: "aaa"),
            KeyObject(key: "key2", value: "bbb")
            ])
        let anyRepository = AnyRepositoryREW(repository)
        
        // anyRepository.remove() の実行で repository 側の値が更新される かつ 同じ値を取得できる
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
        let repository = REWRepository(values: [
            KeyObject(key: "key1", value: "aaa"),
            KeyObject(key: "key2", value: "bbb")
            ])
        let anyRepository = AnyRepositoryREW(repository)
        
        // anyRepository.removeAll() の実行で repository 側の値が更新される かつ 同じ値を取得できる
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
