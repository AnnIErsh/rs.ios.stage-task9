//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSDrawingsCell: UICollectionViewCell {
    
    public var state: Bool = false
    var color: UIColor!
    var path: CGPath!
    var layer0: CAShapeLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (layer0 == nil)
        {
            layer0 = createLayer(with: path)
            layer.addSublayer(layer0!)
        }
        if (state == true)
        {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.duration = 3
            layer0?.add(animation, forKey: "MyAnimation")
        }
        else
        {
            layer0?.strokeStart = 0
            layer0?.strokeEnd = 1
        }
    }
    
    func createLayer(with path: CGPath?) -> CAShapeLayer? {
        let layer = CAShapeLayer()
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 1
        layer.lineJoin = .round
        layer.lineCap = .round
        layer.path = path
        layer.opacity = 1
        return layer
    }
    
    override func reloadInputViews() {
        super.reloadInputViews()
        self.layoutSubviews()
    }
}
