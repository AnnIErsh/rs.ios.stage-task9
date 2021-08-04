//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let itemsVC = RSItemsVC()
        let settingsVC = RSSettingsNVC()
        let navVC = UINavigationController(rootViewController: settingsVC)
        self.viewControllers = [itemsVC, navVC]
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        self.tabBar.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        navVC.navigationBar.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        itemsVC.view.layer.backgroundColor = UIColor.white.cgColor
        settingsVC.view.layer.backgroundColor = UIColor.white.cgColor
        let image0 = UIImage(systemName: "square.grid.2x2", withConfiguration: UIImage.SymbolConfiguration(font: UIFont(name: "SFProDisplay-Medium", size: 16)!))
        let image1 = UIImage(systemName: "gear", withConfiguration: UIImage.SymbolConfiguration(font: UIFont(name: "SFProDisplay-Regular", size: 16)!))
        let item0 = UITabBarItem(title: "Items", image: image0, tag: 0)
        let item1 = UITabBarItem(title: "Settings", image: image1, tag: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        item0.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 10)!, NSAttributedString.Key.paragraphStyle: paragraphStyle], for: .selected)
        item0.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 10)!, NSAttributedString.Key.paragraphStyle: paragraphStyle], for: .normal)
        item1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 10)!, NSAttributedString.Key.paragraphStyle: paragraphStyle], for: .selected)
        item1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 10)!, NSAttributedString.Key.paragraphStyle: paragraphStyle], for: .normal)
        itemsVC.tabBarItem = item0
        navVC.tabBarItem = item1
    }
}
