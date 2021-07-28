//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemsCell: UICollectionViewCell {
    
    var contentImage: UIImageView?
    var contentText: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        makeImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeImageView() {
        let w = self.contentView.bounds.width - 16
        let h = self.contentView.bounds.height - 20
        contentImage = UIImageView(frame: CGRect(x: 8, y: 10, width: w, height: h))
        contentImage!.layer.borderWidth = 1
        contentImage!.layer.cornerRadius = 10
        contentImage!.layer.borderColor = UIColor.black.cgColor
        self.contentView.addSubview(contentImage!)
    }
}
