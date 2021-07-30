//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSCustomLabel: UILabel {

    var top: CGFloat = 0
    var bottom: CGFloat = 0
    var left: CGFloat = 0
    var right: CGFloat = 0
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        var ratio: CGFloat = 3
        if (self.text!.count < 600)
        {
            ratio = 2.5
        }
        if (self.text!.count == 921)
        {
            ratio = 3.5
        }
        top = 18 * (size.width / 388)
        left = 50 * (size.width / 388)
        right = 55 * (size.width / 388)
        bottom = (top + left + right) * ratio
        return CGSize(width: size.width + left + right, height: size.height + bottom)
    }

    override func drawText(in rect: CGRect) {
        bottom = 0
        let insets = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
        super.drawText(in: rect.inset(by: insets))
    }
    
}
