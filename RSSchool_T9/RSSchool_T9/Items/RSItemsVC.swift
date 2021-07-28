//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var itemCV: UICollectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: RSItemsLayout())
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCV.dequeueReusableCell(withReuseIdentifier: "RSItemsCell", for: indexPath)
        let img:UIImageView = cell.contentView.subviews[0] as! UIImageView
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
        }
        if res is Gallery
        {
            let gallery = res as! Gallery
            img.image = gallery.coverImage
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        itemCV.setNeedsLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        itemCV.frame = UIScreen.main.bounds
        itemCV.center = view.center
    }
}
