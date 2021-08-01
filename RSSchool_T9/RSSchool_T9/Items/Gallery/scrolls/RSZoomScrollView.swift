//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSZoomScrollView : UIScrollView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var which : Int {
            return 1
        }
        switch which {
        case 1:
            super.layoutSubviews()
            if let zoomView = self.delegate?.viewForZooming?(in: self)
            {
                zoomView.center = self.superview!.center
            }
        default: break
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
