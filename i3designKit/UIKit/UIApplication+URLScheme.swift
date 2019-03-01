//
//  UIApplication+OpenURL.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

/// URLScheme
public enum URLScheme {
    /// 文字列を指定
    case url(string: String)
    /// 電話発信（確認なし）. iOS12からはこちらでも確認アラートが表示される. "tel:" + number
    case tel(number: String)
    /// 電話発信（確認あり） "telprompt:" + number
    case telprompt(number: String)
    /// 設定
    case settings
    /// 設定アプリ内の自身のアプリランチャー. 通知のOn/Off, Appのバックグラウンド更新などを設定できる.
    case appSettings
}

extension URLScheme {
    
    public var string: String {
        // 参考: http://blog.thetheorier.com/entry/urlscheme-ios12
        switch self {
        case .url(let urlString):
            return urlString
            
        case .tel(let number):
            return "tel:\(number)"
            
        case .telprompt(let number):
            return "telprompt:\(number)"
            
        case .settings:
            return "App-Prefs:"
            
        case .appSettings:
            return "app-settings:"
        }
    }
    
    public var url: URL? {
        return URL(string: string)
    }
}

extension UIApplication {
    
    /// URLSchemeを指定して open(:options:completionHandler:) を実行
    ///
    /// - Parameters:
    ///   - scheme: URLScheme
    ///   - options: A dictionary of options to use when opening the URL. For a list of possible keys to include in this dictionary, see URL Options.
    ///   - completion: The block to execute with the results. Provide a value for this parameter if you want to be informed of the success or failure of opening the URL. This block is executed asynchronously on your app's main thread. The block has no return value and takes the following parameter:
    ///     - success: A Boolean indicating whether the URL was opened successfully.
    @available(iOS 10.0, *)
    public func open(scheme: URLScheme, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        guard let url = scheme.url else {
            completion?(false)
            return
        }
        open(url, options: options, completionHandler: completion)
    }
    
    @available(iOS, introduced: 2.0, deprecated: 10.0, message: "Please use open:scheme:options:completionHandler: instead")
    public func openURL(scheme: URLScheme) -> Bool {
        guard let url = scheme.url else {
            return false
        }
        return openURL(url)
    }
}

extension UIApplication {
    
    /// UIApplication.shared.canOpenURL()を文字列から直接実行する
    ///
    /// - Parameter string: string for URL
    /// - Returns: false if no app installed on the device is registered to handle the URL’s scheme, or if you have not declared the URL’s scheme in your Info.plist file; otherwise, true.
    public func canOpenURL(string: String) -> Bool {
        guard let url = URL(string: string) else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }
}
