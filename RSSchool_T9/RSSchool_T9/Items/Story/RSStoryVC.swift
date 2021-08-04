//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryVC: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, RSStoryDelegate {

    var contentImageView: UIImageView?
    var shapeLayer: CALayer?
    var layerToDraw: CALayer?
    var contentImage: UIImage?
    var contentText: String?
    var contentTextLabel: RSCustomLabel!
    var contentTitle: UILabel?
    var contentTitleText: String?
    var close: UIButton = UIButton(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
    var stroke: UIView!
    var drawings: UICollectionView!
    var paths: [CGPath]!
    var color: UIColor!
    var switchState = false
    var timer: Timer?
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
    var hc: CGFloat = 0
    var scroll: UIScrollView!
    var container: UIView!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.black.cgColor
        makeScroll()
        setImageContent()
        makeCloseButton()
        setStrokeWithConstraints()
        setDrawingsWithConstraints()
        setTextForStoryWithConstraints()
    }
    
    func makeScroll() {
        scroll = UIScrollView(frame: CGRect(origin: view.bounds.origin, size: CGSize(width: dw.0, height: dh.0)))
        scroll.delegate = self
        scroll.contentSize = CGSize(width: dw.0, height: 10)
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
        close.trailingAnchor.constraint(equalTo: contentImageView!.trailingAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: close, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: close.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    @objc func tapOnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setImageContent() {
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
        makeTitle()
        setImageConstraints()
        setLabelStoryWithConstraints()
    }
    
    func setImageConstraints() {
        contentImageView!.translatesAutoresizingMaskIntoConstraints = false
        let margins = container.layoutMarginsGuide
        hc = dw.0 * 80 / 374
        contentImageView!.topAnchor.constraint(equalTo: margins.topAnchor, constant: hc).isActive = true
        contentImageView!.centerXAnchor.constraint(equalTo: margins.centerXAnchor, constant: 0).isActive = true
        let heightConstraint = NSLayoutConstraint(item: contentImageView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: contentImageView!.frame.size.height)
        let widthConstraint = NSLayoutConstraint(item: contentImageView!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: contentImageView!.frame.size.width)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    func makeTitle() {
        contentTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        contentTitle!.numberOfLines = 0
        contentTitle!.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        paragraphStyle.lineSpacing = 12 * (contentImageView!.frame.height / 500)
        contentTitle!.attributedText = NSMutableAttributedString(string: contentTitleText!, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let size = 48 * (contentImageView!.frame.height / 500)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        contentTitle!.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        contentTitle!.font = font
        contentTitle!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentImageView!.addSubview(contentTitle!)
        setTitleConstraints()
    }
    
    func setTitleConstraints() {
        let w = 314 * (contentImageView!.frame.width / 374)
        let h = 116 * (contentImageView!.frame.height / 500)
        let y = 329 * (contentImageView!.frame.height / 500)
        let dx = 30 * (contentImageView!.frame.width / 374)
        contentTitle!.translatesAutoresizingMaskIntoConstraints = false
        let margins = contentImageView!.layoutMarginsGuide
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
        label.attributedText = NSMutableAttributedString(string: "Story", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        let size = 24 * (contentImageView!.frame.height / 500)
        let font = UIFont(name: "Rockwell-Regular", size: size)
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        label.font = font
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let margins = contentImageView!.layoutMarginsGuide
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
        let margins = contentImageView!.layoutMarginsGuide
        stroke.heightAnchor.constraint(equalToConstant: h).isActive = true
        stroke.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        let aspectRatio: CGFloat = 9 / 16
        let d = label.frame.height / 1.5
        stroke.widthAnchor.constraint(equalTo: contentImageView!.widthAnchor,
                                       multiplier: aspectRatio).isActive = true
        stroke.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: d).isActive = true
    }
    
    func setDrawingsWithConstraints() {
        drawings = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 300), collectionViewLayout: UICollectionViewFlowLayout())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: dw.0 / 4, height: dw.0 / 4)
        layout.minimumLineSpacing = dw.0 / 4
        layout.sectionInset = UIEdgeInsets(top: dw.0 / 10, left: dw.0 / 8, bottom: 2, right: 2)
        layout.scrollDirection = .horizontal
        drawings.isPagingEnabled = true;
        drawings.collectionViewLayout = layout
        drawings.dataSource = self
        drawings.delegate = self
        drawings.register(RSDrawingsCell.self, forCellWithReuseIdentifier: "RSDrawingsCell")
        drawings.isScrollEnabled = true
        drawings.layer.backgroundColor = UIColor.black.cgColor
        drawings.layer.cornerRadius = 20
        container.addSubview(drawings)
        drawings.translatesAutoresizingMaskIntoConstraints = false
        let margins = contentImageView!.layoutMarginsGuide
        drawings.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        drawings.widthAnchor.constraint(equalToConstant: contentImageView!.frame.width).isActive = true
        drawings.heightAnchor.constraint(equalToConstant: (dw.0 / 4) + (dw.0 / 10) + 4).isActive = true
        drawings.topAnchor.constraint(equalTo: stroke.bottomAnchor, constant: 1).isActive = true
    }
    
    
    func setTextForStoryWithConstraints() {
        contentTextLabel = RSCustomLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        contentTextLabel.numberOfLines = 0
        contentTextLabel.sizeToFit()
        contentTextLabel.textColor = UIColor.white
        contentTextLabel.layer.borderWidth = 1
        contentTextLabel.layer.borderColor = UIColor.white.cgColor
        contentTextLabel.layer.cornerRadius = 8
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        contentTextLabel.attributedText = NSMutableAttributedString(string: contentText!, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let size = 24 * (contentImageView!.frame.height / 500)
        contentTextLabel.font = UIFont(name: "Rockwell-Regular", size: size)
        contentTextLabel.lineBreakMode = .byWordWrapping
        container.addSubview(contentTextLabel)
        contentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let margins = contentImageView!.layoutMarginsGuide
        contentTextLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        contentTextLabel.widthAnchor.constraint(equalToConstant: contentImageView!.frame.width).isActive = true
        contentTextLabel.topAnchor.constraint(equalTo: drawings.bottomAnchor, constant: 1).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var h: CGFloat = 0
        var rest: CGFloat = 40 * (contentImageView!.frame.height / 500)
        for i: UIView in container.subviews {
            h += i.bounds.height
        }
        if (dh.1 == 1)
        {
            rest += UIScreen.main.bounds.height
        }
        scroll.contentSize = CGSize(width: scroll.contentSize.width, height: hc + h + rest)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RSDrawingsCell = drawings.dequeueReusableCell(withReuseIdentifier: "RSDrawingsCell", for: indexPath) as! RSDrawingsCell
        cell.state = switchState
        cell.path = paths[indexPath.row]
        cell.color = color
        cell.isUserInteractionEnabled = false
        drawings.bounces = true
        return cell
    }
    
    func pass(_ theValue: UIColor) {
        color = theValue
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if(drawings.panGestureRecognizer.translation(in: scrollView.superview).x > 0)
        {
            if (scroll.panGestureRecognizer.translation(in: scrollView.superview).y.isZero == true)
            {
                let path = IndexPath(row: 0, section: 0)
                let cell = drawings.cellForItem(at: path) as? RSDrawingsCell
                cell?.reloadInputViews()
                print("rigth")
            }
        }
        if (drawings.panGestureRecognizer.translation(in: scrollView.superview).x < 0)
        {
            if (scroll.panGestureRecognizer.translation(in: scrollView.superview).y.isZero == true)
            {
                let path = IndexPath(row: 2, section: 0)
                let cell = drawings.cellForItem(at: path) as? RSDrawingsCell
                cell?.reloadInputViews()
                print("left")
            }
        }
    }
}
