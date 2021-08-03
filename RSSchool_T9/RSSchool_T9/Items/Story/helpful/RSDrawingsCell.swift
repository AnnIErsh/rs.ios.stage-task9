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

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = self.contentView.layer
        if (layer.sublayers != nil)
        {
            layer.sublayers?.removeLast()
        }
        let layer0 = createLayer(with: path)
        var counter: CGFloat = 0;
        if (state == true)
        {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if (counter > 1)
                {
                    return
                }
                layer0?.strokeStart = 0
                layer0?.strokeEnd = counter
                
                print(counter)
                counter += 0.1
            }
        }
        else
        {
            layer0?.strokeStart = 0
            layer0?.strokeEnd = 1
        }
        layer.addSublayer(layer0!)
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
}
