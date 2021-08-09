//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSGalleryVC: RSOwnClassVC, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    var scroll: RSScrollView!
    var tap: UITapGestureRecognizer?
    var container: UIView!
    var images: [UIImage]!
    var close: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
    var mainImageView: UIImageView?
    var contentImage: UIImage?
    var contentTitle: UILabel?
    var contentTitleText: String?
    var label: UILabel!
    var hc: CGFloat = 0
    var stroke: UIView!
    var dw: (CGFloat, Int) {
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            return (UIScreen.main.bounds.height, 1)
        }
        else
        {
            return (UIScreen.main.bounds.width, 0)
        }
    }
    
    var dh: (CGFloat, Int) {
        if (UIScreen.main.bounds.height > UIScreen.main.bounds.width)
        {
            return (UIScreen.main.bounds.height, 0)
        }
        else
        {
            return (UIScreen.main.bounds.width, 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.black.cgColor
        makeScroll()
        setImageContent(contentImageView: &mainImageView)
        makeTitle()
        setImageConstraints()
        setLabelStoryWithConstraints()
        makeCloseButton()
        setStrokeWithConstraints()
        setPictureViews()
        scroll.isScrollEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(addActionOnImg))
        tap!.numberOfTapsRequired = 1
        scroll.addGestureRecognizer(tap!)
        scroll.canCancelContentTouches = false
    }
    
    func makeScroll() {
        scroll = RSScrollView(frame: CGRect(origin: view.bounds.origin, size: CGSize(width: dw.0, height: dh.0)))
        scroll.delegate = self
        scroll.isUserInteractionEnabled = true
        scroll.contentSize = CGSize(width: dw.0, height: dh.0)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        let margins = view.layoutMarginsGuide
        scroll.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scroll.widthAnchor.constraint(equalToConstant: dw.0).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: dh.0).isActive = true
        container = UIView(frame: CGRect(origin: view.bounds.origin, size: CGSize(width: dw.0, height: dh.0)))
        container.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(container)
        container.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0).isActive = true
        container.centerXAnchor.constraint(equalTo: scroll.centerXAnchor, constant: 0).isActive = true
        container.widthAnchor.constraint(equalToConstant: dw.0).isActive = true
        container.heightAnchor.constraint(equalToConstant: dh.0).isActive = true
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
        container.addSubview(close)
        setConstraintsForClose()
    }
    
    func setConstraintsForClose() {
        close.translatesAutoresizingMaskIntoConstraints = false
        let margins = container.layoutMarginsGuide
        close.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        close.trailingAnchor.constraint(equalTo: mainImageView!.trailingAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    @objc func tapOnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setImageContent(contentImageView: inout UIImageView?) {
        let w = dw.0 - 40
        let h = (w * 500) / 374
        contentImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: w, height: h))
        contentImageView!.layer.borderWidth = 1
        contentImageView!.layer.borderColor = UIColor.white.cgColor
        contentImageView!.layer.cornerRadius = 8
        contentImageView!.image = contentImage
        contentImageView!.contentMode = .scaleAspectFill
        contentImageView!.clipsToBounds = true
        let layer0 = CAGradientLayer()
        layer0.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
                         UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        layer0.locations = [0.51, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.81, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = contentImageView!.bounds.insetBy(dx: -0.5 * contentImageView!.bounds.size.width, dy: -0.5 * contentImageView!.bounds.size.height)
        layer0.position = contentImageView!.center
        contentImageView!.layer.addSublayer(layer0)
        container.addSubview(contentImageView!)
    }
    
    func setImageConstraints() {
        mainImageView!.translatesAutoresizingMaskIntoConstraints = false
        let margins = container.layoutMarginsGuide
        hc = dw.0 * 80 / 374
        mainImageView!.topAnchor.constraint(equalTo: margins.topAnchor, constant: hc).isActive = true
        mainImageView!.centerXAnchor.constraint(equalTo: margins.centerXAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: mainImageView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: mainImageView!.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: mainImageView!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: mainImageView!.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    func makeTitle() {
        contentTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        contentTitle!.numberOfLines = 0
        contentTitle!.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        paragraphStyle.lineSpacing = 12 * (mainImageView!.frame.height / 500)
        contentTitle!.attributedText = NSMutableAttributedString(string: contentTitleText!, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let size = 48 * (mainImageView!.frame.height / 500)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        contentTitle!.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        contentTitle!.font = font
        contentTitle!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        mainImageView!.addSubview(contentTitle!)
        setTitleConstraints()
    }
    
    func setTitleConstraints() {
        let w = 314 * (mainImageView!.frame.width / 374)
        let h = 116 * (mainImageView!.frame.height / 500)
        let y = 329 * (mainImageView!.frame.height / 500)
        let dx = 30 * (mainImageView!.frame.width / 374)
        contentTitle!.translatesAutoresizingMaskIntoConstraints = false
        let margins = mainImageView!.layoutMarginsGuide
        contentTitle!.translatesAutoresizingMaskIntoConstraints = false
        contentTitle!.widthAnchor.constraint(equalToConstant: w).isActive = true
        contentTitle!.heightAnchor.constraint(equalToConstant: h).isActive = true
        contentTitle!.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: dx).isActive = true
        contentTitle!.topAnchor.constraint(equalTo: margins.topAnchor, constant: y).isActive = true
    }
    
    func setLabelStoryWithConstraints() {
        var w = dw.0 - 292
        let h = (w * 40) / 122
        if (w < 100)
        {
            w = 100
        }
        label = UILabel(frame: CGRect(x: 0, y: 0, width: w, height: h))
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 8
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.backgroundColor = UIColor.black.cgColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        label.attributedText = NSMutableAttributedString(string: "Gallery", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        let size = 24 * (mainImageView!.frame.height / 500)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        label.font = font
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let margins = mainImageView!.layoutMarginsGuide
        let hc = size + 11
        label.widthAnchor.constraint(equalToConstant: w).isActive = true
        label.heightAnchor.constraint(equalToConstant: hc).isActive = true
        label.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: hc / 1.5).isActive = true
    }
    
    func setStrokeWithConstraints() {
        let h: CGFloat = 1.00
        stroke = UIView(frame: CGRect(x: 0, y: 0, width: 208, height: 1))
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        container.addSubview(stroke)
        stroke.translatesAutoresizingMaskIntoConstraints = false
        let margins = mainImageView!.layoutMarginsGuide
        stroke.heightAnchor.constraint(equalToConstant: h).isActive = true
        stroke.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        let aspectRatio: CGFloat = 9 / 16
        let d = label.frame.height / 1.5
        stroke.widthAnchor.constraint(equalTo: mainImageView!.widthAnchor,
                                       multiplier: aspectRatio).isActive = true
        stroke.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: d).isActive = true
    }
    
    func setPictureViews() {
        for (i, picture) in images.enumerated()
        {
            var imgContainer = UIView()
            var img = UIImageView()
            imgContainer.layer.borderWidth = 1
            imgContainer.layer.borderColor = UIColor.white.cgColor
            imgContainer.layer.cornerRadius = 8
            img.image = picture
            imgContainer.addSubview(img)
            imgContainer.clipsToBounds = true
            let prevImg = container.subviews.last!
            container.addSubview(imgContainer)
            setImageConstraintsForContainer(img: &img)
            setConstraintsForPicture(picture: &imgContainer, previous: prevImg, index: i)
        }
    }
    
    func setImageConstraintsForContainer(img: inout UIImageView) {
        let margins = img.superview!.layoutMarginsGuide
        img.clipsToBounds = true
        img.layer.cornerRadius = img.superview!.layer.cornerRadius / 2
        let size: CGFloat = mainImageView!.frame.height / 500
        let w: CGFloat = mainImageView!.bounds.width - (22 * size)
        let h: CGFloat = mainImageView!.bounds.height - (22 * size)
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: h).isActive = true
        img.widthAnchor.constraint(equalToConstant: w).isActive = true
        img.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    }
    
    func setConstraintsForPicture(picture: inout UIView, previous: UIView, index: Int) {
        picture.translatesAutoresizingMaskIntoConstraints = false
        let magrinX = mainImageView!.layoutMarginsGuide
        picture.centerXAnchor.constraint(equalTo: magrinX.centerXAnchor).isActive = true
        picture.widthAnchor.constraint(equalToConstant: mainImageView!.bounds.width).isActive = true
        picture.heightAnchor.constraint(equalToConstant: mainImageView!.bounds.height).isActive = true
        let margin = previous.layoutMarginsGuide
        var size: CGFloat = 27 * mainImageView!.frame.height / 500
        if (index == 0)
        {
            size = label.frame.height / 1.5
        }
        picture.topAnchor.constraint(equalTo: margin.bottomAnchor, constant: size).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var h: CGFloat = 0
        var rest: CGFloat = 27 * (mainImageView!.frame.height / 500)
        for i: UIView in container.subviews {
            h += (i.bounds.height + (27 * mainImageView!.frame.height / 500))
        }
        if (dh.1 == 1)
        {
            rest += UIScreen.main.bounds.height
        }
        scroll.contentSize = CGSize(width: scroll.contentSize.width, height: hc + h + rest)
    }
    
    @objc func addActionOnImg() {
        let point:CGPoint = tap!.location(in: scroll)
        for imgView: UIView in container.subviews
        {
            if (imgView.subviews.count > 0 && imgView.subviews[0].isKind(of: UIImageView.self))
            {
                let img = imgView.subviews[0]
                let pointInside = scroll.convert(point, to: img.coordinateSpace)
                if (img.bounds.contains(pointInside))
                {
                    let pictureVC = RSPictureVC()
                    let imageToShow = img as! UIImageView
                    pictureVC.img.image = imageToShow.image
                    pictureVC.modalPresentationStyle = .overFullScreen
                    present(pictureVC, animated: true, completion: nil)
                }
            }
        }
    }
}
