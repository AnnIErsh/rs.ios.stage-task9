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
    var timer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = self.contentView.layer
        let layer0 = createLayer(with: path)
        var counter: CGFloat = 0;
        if (state == true && timer == nil)
        {
            layer.sublayers?.removeAll()
            timer = Timer.scheduledTimer(withTimeInterval: 1 / 60, repeats: true) { [self] _ in
                if (counter >= 1)
                {
                    timer?.invalidate()
                    timer = nil
                    print("STOP")
                    return
                }
                layer0?.strokeStart = 0
                layer0?.strokeEnd = counter
                //print(counter)
                counter += 1 / 180
                layer.addSublayer(layer0!)
            }
        }
        else
        {
            layer.sublayers?.removeAll()
            layer0?.strokeStart = 0
            layer0?.strokeEnd = 1
            layer.addSublayer(layer0!)
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
    
//    func setConstrainrsToCell() {
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.accessibilityScroll(.left)
//        contentView.accessibilityScroll(.right)
//        NSLayoutConstraint.activate([
//            contentView.leftAnchor.constraint(equalTo: leftAnchor),
//            contentView.rightAnchor.constraint(equalTo: rightAnchor),
//            contentView.topAnchor.constraint(equalTo: topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
}
