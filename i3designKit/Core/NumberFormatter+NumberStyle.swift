//
//  NumberFormatter+NumberStyle.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    /// NSNumber を style と locale を指定して文字列に変換
    ///
    /// - Parameters:
    ///   - number: 入力値
    ///   - style: NumberFormatter.Style
    ///   - locale: Locale
    /// - Returns: 変換された文字列
    public class func string(from number: NSNumber, style: NumberFormatter.Style, locale: Locale) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = locale
        return formatter.string(from: number)
    }
    
    /// 日本円の書式に変換された文字列を取得
    /// - Convert 1234 to "¥1,234"
    public class func jpyString(from value: Int) -> String? {
        return string(from: NSNumber(value: value), style: .currency, locale: .ja_JP)
    }
    
    /// ３桁区切りの文字列を取得
    /// - Convert 1234 to "1,234"
    public class func decimalString(from value: Int) -> String? {
        return string(from: NSNumber(value: value), style: .decimal, locale: .ja_JP)
    }
}
