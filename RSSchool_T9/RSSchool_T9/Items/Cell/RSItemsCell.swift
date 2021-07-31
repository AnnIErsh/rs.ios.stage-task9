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
    var contentTitle: UILabel?
    
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
        contentImage!.contentMode = .scaleAspectFill
        contentImage!.clipsToBounds = true
        let layer0 = CAGradientLayer()
        layer0.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
                         UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        layer0.locations = [0.74, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = contentImage!.bounds.insetBy(dx: -0.5 * contentImage!.bounds.size.width, dy: -0.5 * contentImage!.bounds.size.height)
        layer0.position = contentImage!.center
        contentImage!.layer.addSublayer(layer0)
        makeTitle()
        self.contentView.addSubview(contentImage!)
    }
    
    func makeTitle() {
        contentTitle = UILabel()
        let size = 16 * (contentImage!.frame.height / 200)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        let w = contentImage!.bounds.width - size
        let y: CGFloat = (contentImage!.frame.height * 151) / 200
        contentTitle!.frame = CGRect(x: 10, y: y, width: w, height: 19)
        contentTitle!.font = font
        contentTitle!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentImage!.addSubview(contentTitle!)
        makeText()
    }
    
    func makeText() {
        contentText = UILabel()
        let size = 12 * (contentImage!.frame.height / 200)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        let dy = 3 * (size / 16)
        let w = contentTitle!.frame.width
        let y: CGFloat = contentTitle!.frame.origin.y + contentTitle!.frame.height + dy
        contentText!.frame = CGRect(x: 10, y: y, width: w, height: 14)
        contentText!.font = font
        contentText!.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        contentImage!.addSubview(contentText!)
    }
}

