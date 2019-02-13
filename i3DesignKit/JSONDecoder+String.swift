//
//  JSONDecoder+String.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

import Foundation

extension JSONDecoder {
    
    func decode<T>(string: String, using: String.Encoding = .utf8) throws -> T where T: Decodable {
        return try decode(T.self, string: string, using: using)
    }
    
    func decode<T>(_ type: T.Type, string: String, using: String.Encoding = .utf8) throws -> T where T: Decodable {
        guard let data = string.data(using: using) else {
            let context = DecodingError.Context(codingPath: [],
                                                debugDescription: "failed to convert string to data using \(using.description)",
                                                underlyingError: nil)
            throw DecodingError.dataCorrupted(context)
        }
        return try decode(type, from: data)
    }
}
