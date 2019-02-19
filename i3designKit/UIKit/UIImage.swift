//
//  UIImage+extension.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/08.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// UIImagewをリサイズ
    ///
    /// - Parameter toSize: 変更するSize
    /// - Returns: 変更されたUIImage
    public func resize(to toSize: CGSize) -> UIImage? {
        let widthRatio = toSize.width / size.width
        let heightRatio = toSize.height / size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        let resizedSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        defer {
            UIGraphicsEndImageContext()
        }
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
        draw(in: CGRect(origin: .zero, size: resizedSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// 任意の色で塗りつぶしたUIImageを生成
    ///
    /// - Parameters:
    ///   - color: 塗り潰す色
    ///   - rect: UIImageのサイズ
    /// - Returns: UIImage
    public class func createImageWith(color: UIColor, size: CGSize) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(color.cgColor)
        var rect = CGRect.zero
        rect.size = size
        context.fill(rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
