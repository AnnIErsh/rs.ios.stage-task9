//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSPictureVC: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    var container: UIView!
    var scroll: RSScrollView!
    var close: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
    var img = UIImageView()
    var tap: UITapGestureRecognizer?
    var dwidth: CGFloat {
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            return UIScreen.main.bounds.height
        }
        else
        {
            return UIScreen.main.bounds.width
        }
    }
    var dheight: CGFloat {
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            return UIScreen.main.bounds.width
        }
        else
        {
            return UIScreen.main.bounds.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.black.cgColor
        makeZoomScroll()
        setImageToContainer()
        makeCloseButton()
        tap = UITapGestureRecognizer(target: self, action: #selector(tapOnPicture))
        scroll.addGestureRecognizer(tap!)
        scroll.delegate = self
        scroll.isUserInteractionEnabled = true
        scroll.canCancelContentTouches = false
        tap!.numberOfTapsRequired = 1
    }
    
    @objc func tapOnPicture() {
        let point = tap!.location(in: scroll)
        let pointInside = scroll.convert(point, to: img)
        if (img.bounds.contains(pointInside))
        {
            if (close.isHidden == false)
            {
                close.isHidden = true
            }
            else
            {
                close.isHidden = false
            }
        }
    }
    
    func makeZoomScroll() {
        scroll = RSScrollView()
        scroll.delegate = self
        scroll.contentSize = CGSize(width: dwidth, height: dheight)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        let margins = view.layoutMarginsGuide
        scroll.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        scroll.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        scroll.widthAnchor.constraint(equalToConstant: dwidth).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: dheight).isActive = true
        container = UIView(frame: CGRect(origin: view.bounds.origin, size: CGSize(width: dwidth, height: dheight)))
        scroll.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0).isActive = true
        container.centerXAnchor.constraint(equalTo: scroll.centerXAnchor, constant: 0).isActive = true
        container.widthAnchor.constraint(equalToConstant: dwidth).isActive = true
        container.heightAnchor.constraint(equalToConstant: dheight).isActive = true
    }
    
    func setImageToContainer() {
        let margins = container.layoutMarginsGuide
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        container.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: dwidth).isActive = true
        img.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        img.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
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
        view.addSubview(close)
        setConstraintsForClose()
    }
    
    @objc func tapOnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setConstraintsForClose() {
        close.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        close.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30).isActive = true
        close.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        let heightConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.width) 
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            let newH = UIScreen.main.bounds.height
            let newW = UIScreen.main.bounds.width
            scroll.contentSize = CGSize(width: newW, height: newH)
            scroll.updateConstraint(attribute: NSLayoutConstraint.Attribute.height, constant: newH)
            scroll.updateConstraint(attribute: NSLayoutConstraint.Attribute.width, constant: newW)
            container.updateConstraint(attribute: NSLayoutConstraint.Attribute.height, constant: newH)
            container.updateConstraint(attribute: NSLayoutConstraint.Attribute.width, constant: newW)
        }
        else
        {
            scroll.contentSize = CGSize(width: dwidth, height: dheight)
            container.updateConstraint(attribute: NSLayoutConstraint.Attribute.height, constant: dheight)
            container.updateConstraint(attribute: NSLayoutConstraint.Attribute.width, constant: dwidth)
            scroll.updateConstraint(attribute: NSLayoutConstraint.Attribute.height, constant: dheight)
            scroll.updateConstraint(attribute: NSLayoutConstraint.Attribute.width, constant: dwidth)
        }
    }
}
