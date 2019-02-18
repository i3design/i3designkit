//
//  RepositoryError.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/02/18.
//  Copyright © 2019 i3design. All rights reserved.
//

import Foundation

public enum RepositoryError: Error {
    /// 未定義
    case notDefined
    /// データ不正
    case dataIllegal(String)
}
