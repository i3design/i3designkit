//
//  DateFormatter.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    /// String型をDate型に変換する
    ///
    /// - Parameters:
    ///   - string: 時刻を示す文字列
    ///   - format: 文字列のフォーマット. ex) "yyyyMMdd"
    ///   - calendar: Calendar. defaultはグレゴリオ暦.
    /// - Returns: 変換したDate型. 変換に失敗した場合はnilを返す.
    public static func date(from string: String, format: String, calendar: Calendar = .gregorian) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = calendar
        return formatter.date(from: string)
    }
    
    /// Date型をString型に変換する
    ///
    /// - Parameters:
    ///   - date: Date型
    ///   - format: 変換したい文字列のフォーマット. ex) "yyyyMMdd"
    ///   - calender: Calender. defaultはグレゴリオ暦.
    /// - Returns: 変換された文字列. 失敗した場合はnilを返す.
    public static func string(from date: Date, format: String, calender: Calendar = .gregorian) -> String? {
        let formatter = DateFormatter()
        formatter.calendar = calender
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
