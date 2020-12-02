//
//  UITableView.swift
//  i3designKit
//
//  Created by Takuto Nagano on 2019/07/31.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<C>(_ type: C.Type, bundle: Bundle? = nil) where C: UITableViewCell {
        let nib = UINib(nibName: type.className, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: type.className)
    }

    func dequeueReusableCell<C>(with type: C.Type, for indexPath: IndexPath) -> C where C: UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: C.className, for: indexPath)
        guard let customCell = cell as? C else {
            fatalError()
        }
        return customCell
    }
}
