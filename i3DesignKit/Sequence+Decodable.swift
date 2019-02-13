//
//  Sequence+Decodable.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

// MARK: Iterator.Element == Data
extension Sequence {
    
    /// Data型の配列を指定の Decodable の型配列に変換します
    ///
    /// - Parameters:
    ///   - type: T.Typeを指定
    ///   - decoder: Decoderを指定. default は JSONDecoder()
    /// - Returns: T型の配列
    /// - Throws: 要素内で１つでも decode に失敗すると error を throw
    func decodes<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
        where T: Decodable, Iterator.Element == Data {
            return try map { try decoder.decode(type, from: $0) }
    }
    
    /// Sequence.decodes<T>(_ type: T.Type, decoder: JSONDecoder) -> [T] の型推論向け
    ///
    /// - Parameter decoder: Decoderを指定. default は JSONDecoder()
    /// - Returns: T型の配列
    /// - Throws: 要素内で１つでも decode に失敗すると error を throw
    func decodes<T>(_ decoder: JSONDecoder = JSONDecoder()) throws -> [T] where T: Decodable, Iterator.Element == Data {
        return try decodes(T.self, decoder: decoder)
    }
}

// MARK: Iterator.Element == String
extension Sequence {
    
    /// Json書式の文字列配列を指定の Decodable の型配列に変換します
    ///
    /// - Parameters:
    ///   - type: T.Typeを指定
    ///   - using: Encoding を指定. default は .utf8
    ///   - decoder: Decoderを指定. default は JSONDecoder()
    /// - Returns: T型の配列
    /// - Throws: 要素内で１つでも decode に失敗すると error を throw
    func decodes<T>(_ type: T.Type, using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
        where T: Decodable, Iterator.Element == String {
            return try map { try decoder.decode(type, string: $0, using: using) }
    }
    
    func decodes<T>(using: String.Encoding = .utf8, decoder: JSONDecoder = JSONDecoder()) throws -> [T]
        where T: Decodable, Iterator.Element == String {
            return try decodes(T.self, using: using, decoder: decoder)
    }
}
