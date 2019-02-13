//
//  UIColor+initializer.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension UIColor {
    
    /// 16進数によるUIColorの作成
    ///
    /// - Parameters:
    ///   - hex: 16進数による色情報を指定 ex)0x12FF34
    ///   - alpha: 透明度[0-1.0]
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    /// CMYKによるUIColorの生成
    ///
    /// - Parameters:
    ///   - c: cyan [0-1]
    ///   - m: magenta [0-1]
    ///   - y: yellow [0-1]
    ///   - k: black [0-1]
    ///   - alpha: alpha [0-1]
    convenience init(cyan c: CGFloat, magenta m: CGFloat, yellow y: CGFloat, black k: CGFloat, alpha: CGFloat = 1.0) {
        let r = (1 - c) * (1 - k)
        let g = (1 - m) * (1 - k)
        let b = (1 - y) * (1 - k)
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
