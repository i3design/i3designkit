//
//  UICollectionView.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func regist<C>(_ type: C.Type, bundle: Bundle? = nil) where C: UICollectionViewCell {
        let nib = UINib(nibName: type.className, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: type.className)
    }

    func dequeueReusableCell<C>(with type: C.Type, for indexPath: IndexPath) -> C where C: UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: C.className, for: indexPath)
        guard let customCell = cell as? C else {
            fatalError()
        }
        return customCell
    }
}

public extension UICollectionView {

    func register<C>(_ type: C.Type, bundle: Bundle? = nil) where C: UICollectionReusableView {
        let nib = UINib(nibName: type.className, bundle: bundle)
        self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.className)
    }

    func dequeueReusableSupplementaryHeaderView<V>(with type: V.Type, for indexPath: IndexPath) -> V where V: UICollectionReusableView {
        let kind = UICollectionView.elementKindSectionHeader
        let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: V.className, for: indexPath)
        guard let reusableView = view as? V else {
            fatalError()
        }
        return reusableView
    }
}
