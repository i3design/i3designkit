//
//  NumberFormatter+NumberStyle.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    public class func string(from number: NSNumber, style: NumberFormatter.Style, locale: Locale) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = locale
        return formatter.string(from: number)
    }
    
    /// "¥1,234" の書式で取得
    public class func jpyString(from value: Int) -> String? {
        return string(from: NSNumber(value: value), style: .currency, locale: .ja_JP)
    }
    
    /// "1,234" の書式で取得
    public class func decimalString(from value: Int) -> String? {
        return string(from: NSNumber(value: value), style: .decimal, locale: .ja_JP)
    }
}
