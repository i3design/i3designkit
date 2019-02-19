//
//  XibView.swift
//  i3Design
//
//  Created by Takuto Nagano on 2019/02/12.
//  Copyright © 2019 i3DESIGN. All rights reserved.
//

import UIKit

/// xibファイルと紐付けるUIViewの基底クラス
/// - class name と xib name を一致させる必要がある.
/// - AutoresizingMaskではなくAutoLayoutを使用すること
open class XibView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed(self.className, owner: self, options: nil)?.first as? UIView else {
            assertionFailure("cannot load nibName: \(self.className)")
            return
        }
        // enable AutoLayout
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = self.bounds
        addSubview(view)
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
