//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemsLayout: UICollectionViewFlowLayout {
    var dw: CGFloat {
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            return UIScreen.main.bounds.height
        }
        else
        {
            return UIScreen.main.bounds.width
        }
    }
    
    override init() {
        super.init()
        let w = (dw - 56) / 2;
        let h = (w * 220) / 179
        self.itemSize = CGSize(width: w, height: h)
        self.scrollDirection = .vertical
        self.minimumLineSpacing = 16 * (w / 179)
        self.sectionInset.left = 20 * (w / 179)
        self.sectionInset.right = 20 * (w / 179)
        self.sectionInset.top = 40 * (w / 179)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
