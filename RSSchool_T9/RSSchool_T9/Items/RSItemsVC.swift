//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, RSStoryDelegate {
        
    var itemCV: UICollectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: RSItemsLayout())
    var textForStory: Array<(String, Int)> = []
    var imagesForGallery: [[UIImage]] = []
    var paths: [[CGPath]] = []
    var colorToDraw = UIColor(red: 0.953, green: 0.686, blue: 0.133, alpha: 1)
    var swithState = true
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCV.dequeueReusableCell(withReuseIdentifier: "RSItemsCell", for: indexPath)
        let img: UIImageView = cell.contentView.subviews[0] as! UIImageView
        let title: UILabel = img.subviews[0] as! UILabel
        let text: UILabel = img.subviews[1] as! UILabel
        let data = FillingData.data[indexPath.row]
        func getData() -> Any {
            switch data {
            case .story(let story):
                return story
            case .gallery(let gallery):
                return gallery
            }
        }
        let res = getData()
        if res is Story
        {
            let story = res as! Story
            img.image = story.coverImage
            title.text = story.title
            text.text = "Story"
            paths.append(story.paths)
            textForStory.append((story.text, indexPath.row))
            imagesForGallery.append([UIImage()])
        }
        if res is Gallery
        {
            let gallery = res as! Gallery
            img.image = gallery.coverImage
            title.text = gallery.title
            text.text = "Gallery"
            let images = gallery.images
            paths.append([])
            textForStory.append(("", indexPath.row))
            imagesForGallery.append(images)
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        itemCV.layer.backgroundColor = UIColor.white.cgColor
        itemCV.showsVerticalScrollIndicator = false
        itemCV.dataSource = self
        itemCV.delegate = self
        itemCV.register(RSItemsCell.self, forCellWithReuseIdentifier: "RSItemsCell")
        view.addSubview(itemCV)
        itemCV.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        itemCV.frameLayoutGuide.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        itemCV.frameLayoutGuide.widthAnchor.constraint(equalToConstant: dwidth).isActive = true
        itemCV.frameLayoutGuide.heightAnchor.constraint(equalToConstant: dheight).isActive = true
        itemCV.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        itemCV.setNeedsLayout()
        let nvc = self.tabBarController?.viewControllers?.last as! UINavigationController
        if nvc.visibleViewController is RSSettingsNVC
        {
            let vc = nvc.viewControllers.first as! RSSettingsNVC
            vc.delegateSwift = self
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let w = (dwidth - 56) / 2;
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height)
        {
            itemCV.contentInset.bottom = 500 * (w / 179)
        }
        else
        {
            itemCV.contentInset.bottom = 100 * (w / 179)
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        let img = cell?.contentView.subviews[0] as! UIImageView
        let text = img.subviews[1] as! UILabel
        let str = text.text
        if (str == "Story")
        {
            let storyVC = RSStoryVC()
            storyVC.contentImage = img.image
            let title = img.subviews[0] as? UILabel
            storyVC.contentTitleText = title?.text
            storyVC.contentText = textForStory[indexPath.row].0
            storyVC.paths = paths[indexPath.row]
            storyVC.color = colorToDraw
            storyVC.switchState = self.swithState
            storyVC.modalPresentationStyle = .overFullScreen
            present(storyVC, animated: true, completion: nil)
        }
        if (str == "Gallery")
        {
            let galleryVC = RSGalleryVC()
            galleryVC.contentImage = img.image
            let title = img.subviews[0] as? UILabel
            galleryVC.contentTitleText = title?.text
            galleryVC.images = imagesForGallery[indexPath.row]
            galleryVC.modalPresentationStyle = .overFullScreen
            present(galleryVC, animated: true, completion: nil)
        }
    }
    
    func pass(_ theValue: UIColor) {
        colorToDraw = theValue
    }
    
    func passSwitcherState(_ switcher: Bool) {
        if (switcher == true)
        {
            swithState = true
            print("SWIFT ON")
        }
        else
        {
            swithState = false
            print("SWIFT OFF")
        }
    }

}
