//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneRS = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        self.window = UIWindow(windowScene: sceneRS)
        self.window?.makeKeyAndVisible()
        let itemsVC = RSItemsVC()
        let settingsVC = RSSettingsVC()
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [itemsVC, settingsVC]
        self.window?.rootViewController = tabBarVC
    }
}

