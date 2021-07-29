//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryVC: UIViewController, UIScrollViewDelegate {

    var contentImageView: UIImageView?
    var contentImage: UIImage?
    var contentText: UILabel?
    var contentTitle: UILabel?
    var close: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.black.cgColor
        makeScroll()
        makeCloseButton()
        setImageContent()
    }
    
    func makeScroll() {
        
    }
    
    func makeCloseButton() {
        close.layer.backgroundColor = UIColor.black.cgColor
        close.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
        close.layer.cornerRadius = close.layer.frame.height / 2
        close.layer.borderColor = UIColor.white.cgColor
        close.layer.backgroundColor = UIColor.black.cgColor
        close.layer.borderWidth = 1
        close.tintColor = UIColor.white
        let image = UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(font: UIFont(name: "SFProDisplay-Regular", size: 22)!))
        close.setImage(image, for: .normal)
        close.setImage(image, for: .highlighted)
        view.addSubview(close)
        setConstraintsForClose()
    }
    
    func setConstraintsForClose() {
        close.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        close.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        close.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    @objc func tapOnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setImageContent() {
        let w = dw - 40
        let h = (w * 500) / 374
        contentImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: w, height: h))
        contentImageView!.layer.borderWidth = 1
        contentImageView!.layer.borderColor = UIColor.white.cgColor
        contentImageView!.layer.cornerRadius = 8
        contentImageView!.image = contentImage
        contentImageView!.contentMode = .scaleAspectFill
        contentImageView!.clipsToBounds = true
        view.addSubview(contentImageView!)
        setImageConstraints()
    }
    
    func setImageConstraints() {
        contentImageView!.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        let hc = dw * 80 / 374
        contentImageView!.topAnchor.constraint(equalTo: margins.topAnchor, constant: hc).isActive = true
        contentImageView!.centerXAnchor.constraint(equalTo: margins.centerXAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: contentImageView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: contentImageView!.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: contentImageView!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: contentImageView!.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
}
