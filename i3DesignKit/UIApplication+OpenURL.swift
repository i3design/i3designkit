//
//  UIApplication+OpenURL.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3Design. All rights reserved.
//

import UIKit

public enum OpenSchemes {
    
    case url(string: String)
    /// 電話発信（確認なし）
    case tel(number: String)
    /// 電話発信（確認あり）
    case telprompt(number: String)
}

extension OpenSchemes {
    
    var schemeString: String {
        // 参考: http://blog.thetheorier.com/entry/urlscheme-ios12
        switch self {
        case .url(let string):
            return string
            
        case .tel(let number):
            return "tel:\(number)"
            
        case .telprompt(let number):
            return "telprompt:\(number)"
        }
    }
    
    var url: URL? {
        return URL(string: schemeString)
    }
}

extension UIApplication {
    
    public func open(scheme: OpenSchemes, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        guard let url = scheme.url else {
            completion?(false)
            return
        }
        open(url, options: options, completionHandler: completion)
    }
}

extension UIApplication {
    
    public func canOpenURLString(_ urlString: String) -> Bool {
        guard let url = URL(string: urlString) else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }
}
