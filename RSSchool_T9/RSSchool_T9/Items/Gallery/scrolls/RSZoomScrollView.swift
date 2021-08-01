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
        var which : Int {
            return 1
        }
        switch which {
        case 1:
            super.layoutSubviews()
            if let zoomView = self.delegate?.viewForZooming?(in: self)
            {
                let w = self.bounds.width
                let h = self.bounds.height
                let zoomW = zoomView.frame.width
                let zommH = zoomView.frame.height
                var frame = zoomView.frame
                if zoomW < w
                {
                    frame.origin.x = (w - zoomW) / 2
                }
                else
                {
                    frame.origin.x = 0
                }
                if zommH < h
                {
                    frame.origin.y = (h - zommH) / 2
                }
                else
                {
                    frame.origin.y = 0
                }
                zoomView.frame = frame
                zoomView.center = self.superview!.center
            }
        default: break
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
