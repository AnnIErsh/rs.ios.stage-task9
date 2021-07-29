//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSStoryVC: UIViewController {
    
    var contentImage: UIImageView?
    var contentText: UILabel?
    var contentTitle: UILabel?
    var close: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 40, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor.blue.cgColor
        makeCloseButton()
    }
    
    func makeCloseButton() {
        close.layer.backgroundColor = UIColor.red.cgColor
        close.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
        view.addSubview(close)
    }
    
    @objc func tapOnButton() {
        self.dismiss(animated: true, completion: nil)
    }

}
