//
//  JSONDecoder+String.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    /// JSON文字列を指定した型のオブジェクトに変換する
    ///
    /// - Parameters:
    ///   - type: Decodeする型
    ///   - string: JSON文字列
    ///   - using: String.Encoding
    /// - Returns: typeで指定した型のインスタンス. Decodeに失敗した場合は error を trhow する.
    /// - Throws: DecodingError
    public func decode<T>(_ type: T.Type, string: String, using: String.Encoding = .utf8) throws -> T where T: Decodable {
        guard let data = string.data(using: using) else {
            let context = DecodingError.Context(codingPath: [],
                                                debugDescription: "failed to convert string to data using \(using.description)",
                                                underlyingError: nil)
            throw DecodingError.dataCorrupted(context)
        }
        return try decode(type, from: data)
    }
        
    /// decode<T>(:string:using)の型推論型
    ///
    /// - Parameters:
    ///   - string: JSON文字列
    ///   - using: String.Encoding
    /// - Returns: typeで指定した型のインスタンス. Decodeに失敗した場合は error を trhow する.
    /// - Throws: DecodingError
    public func decode<T>(string: String, using: String.Encoding = .utf8) throws -> T where T: Decodable {
        return try decode(T.self, string: string, using: using)
    }
}
