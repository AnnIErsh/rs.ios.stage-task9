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
    override init() {
        super.init()
        let w = (UIScreen.main.bounds.width - 56) / 2;
        let h = (w * 220) / 179
        self.itemSize = CGSize(width: w, height: h)
        self.scrollDirection = .vertical
        self.minimumLineSpacing = 16
        self.sectionInset.left = 20
        self.sectionInset.right = 20
        self.sectionInset.top = 40
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
