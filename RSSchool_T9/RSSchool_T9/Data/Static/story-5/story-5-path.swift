//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Anna Ershova
// On: 04.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

extension CGPath {
    static let story5path1: CGPath = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 5.5, y: 63.5))
        bezierPath.addLine(to: CGPoint(x: 7.5, y: 25.5))
        bezierPath.addLine(to: CGPoint(x: 8.5, y: 20.5))
        bezierPath.addLine(to: CGPoint(x: 11.5, y: 14.5))
        bezierPath.addCurve(to: CGPoint(x: 19.5, y: 5.5), controlPoint1: CGPoint(x: 11.5, y: 14.5), controlPoint2: CGPoint(x: 13.5, y: 10.5))
        bezierPath.addCurve(to: CGPoint(x: 55.5, y: 6.5), controlPoint1: CGPoint(x: 25.5, y: 0.5), controlPoint2: CGPoint(x: 43.5, y: -3.5))
        bezierPath.addCurve(to: CGPoint(x: 65.5, y: 25.5), controlPoint1: CGPoint(x: 67.5, y: 16.5), controlPoint2: CGPoint(x: 65.5, y: 25.5))
        bezierPath.addLine(to: CGPoint(x: 66.5, y: 27.5))
        bezierPath.addLine(to: CGPoint(x: 69.5, y: 63.5))
        bezierPath.addLine(to: CGPoint(x: 48.5, y: 78.5))
        bezierPath.addLine(to: CGPoint(x: 26.5, y: 78.5))
        bezierPath.addLine(to: CGPoint(x: 5.5, y: 63.5))
        bezierPath.close()
        bezierPath.append({
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 32, y: 76.5))
            bezier2Path.addCurve(to: CGPoint(x: 32, y: 37.5), controlPoint1: CGPoint(x: 32, y: 76.5), controlPoint2: CGPoint(x: 32, y: 38.5))
            bezier2Path.addCurve(to: CGPoint(x: 12, y: 32.5), controlPoint1: CGPoint(x: 32, y: 36.5), controlPoint2: CGPoint(x: 12, y: 32.5))
            bezier2Path.addLine(to: CGPoint(x: 12, y: 28.5))
            bezier2Path.addLine(to: CGPoint(x: 63, y: 28.5))
            bezier2Path.addLine(to: CGPoint(x: 63, y: 32.5))
            bezier2Path.addLine(to: CGPoint(x: 44, y: 37.5))
            bezier2Path.addLine(to: CGPoint(x: 44, y: 76.5))
            bezier2Path.addLine(to: CGPoint(x: 47, y: 76.5))
            bezier2Path.addCurve(to: CGPoint(x: 50, y: 47.5), controlPoint1: CGPoint(x: 47, y: 76.5), controlPoint2: CGPoint(x: 46.14, y: 58.79))
            bezier2Path.addCurve(to: CGPoint(x: 63, y: 37.5), controlPoint1: CGPoint(x: 52.6, y: 39.92), controlPoint2: CGPoint(x: 58.98, y: 37.1))
            bezier2Path.addCurve(to: CGPoint(x: 65, y: 57.5), controlPoint1: CGPoint(x: 65.5, y: 37.75), controlPoint2: CGPoint(x: 65, y: 57.5))
            bezier2Path.addLine(to: CGPoint(x: 65, y: 62.5))
            bezier2Path.addLine(to: CGPoint(x: 67, y: 62.5))
            bezier2Path.addLine(to: CGPoint(x: 65, y: 26.5))
            bezier2Path.addLine(to: CGPoint(x: 10, y: 26.5))
            bezier2Path.addLine(to: CGPoint(x: 7, y: 62.5))
            bezier2Path.addLine(to: CGPoint(x: 10, y: 63.5))
            bezier2Path.addLine(to: CGPoint(x: 12, y: 37.5))
            bezier2Path.addCurve(to: CGPoint(x: 26, y: 50.5), controlPoint1: CGPoint(x: 12, y: 37.5), controlPoint2: CGPoint(x: 24, y: 36.5))
            bezier2Path.addCurve(to: CGPoint(x: 28, y: 76.5), controlPoint1: CGPoint(x: 28, y: 64.5), controlPoint2: CGPoint(x: 28, y: 76.5))
            bezier2Path.addLine(to: CGPoint(x: 32, y: 76.5))
            bezier2Path.close()
            return bezier2Path
        }())
        return bezierPath.cgPath
    }()
    
    static let story5path2: CGPath = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 23.5, y: 59.5))
        bezierPath.addLine(to: CGPoint(x: 26.5, y: 44.5))
        bezierPath.addLine(to: CGPoint(x: 23.5, y: 42.5))
        bezierPath.addLine(to: CGPoint(x: 26.5, y: 28.5))
        bezierPath.addCurve(to: CGPoint(x: 11.5, y: 23.5), controlPoint1: CGPoint(x: 26.5, y: 28.5), controlPoint2: CGPoint(x: 18.5, y: 28.5))
        bezierPath.addCurve(to: CGPoint(x: 7.5, y: 19.5), controlPoint1: CGPoint(x: 9.39, y: 21.99), controlPoint2: CGPoint(x: 8.78, y: 21.25))
        bezierPath.addCurve(to: CGPoint(x: 3.5, y: 16.5), controlPoint1: CGPoint(x: 6.27, y: 17.82), controlPoint2: CGPoint(x: 4.53, y: 17.87))
        bezierPath.addCurve(to: CGPoint(x: 1.5, y: 11.5), controlPoint1: CGPoint(x: 2.04, y: 14.56), controlPoint2: CGPoint(x: 1.5, y: 11.5))
        bezierPath.addCurve(to: CGPoint(x: 28.5, y: 11.5), controlPoint1: CGPoint(x: 1.5, y: 11.5), controlPoint2: CGPoint(x: 23.5, y: 11.5))
        bezierPath.addCurve(to: CGPoint(x: 34.5, y: 6.5), controlPoint1: CGPoint(x: 30.27, y: 11.5), controlPoint2: CGPoint(x: 31.76, y: 8.69))
        bezierPath.addCurve(to: CGPoint(x: 43.5, y: 3.5), controlPoint1: CGPoint(x: 36.72, y: 4.73), controlPoint2: CGPoint(x: 42.5, y: 3.5))
        bezierPath.addCurve(to: CGPoint(x: 51.5, y: 3.5), controlPoint1: CGPoint(x: 44.12, y: 3.5), controlPoint2: CGPoint(x: 48.49, y: 3.5))
        bezierPath.addCurve(to: CGPoint(x: 58.5, y: 6.5), controlPoint1: CGPoint(x: 53.35, y: 3.5), controlPoint2: CGPoint(x: 58.5, y: 6.5))
        bezierPath.addLine(to: CGPoint(x: 62.5, y: 9.5))
        bezierPath.addLine(to: CGPoint(x: 65.5, y: 11.5))
        bezierPath.addLine(to: CGPoint(x: 90.5, y: 11.5))
        bezierPath.addCurve(to: CGPoint(x: 92.5, y: 13.5), controlPoint1: CGPoint(x: 90.5, y: 11.5), controlPoint2: CGPoint(x: 96.5, y: 8.5))
        bezierPath.addCurve(to: CGPoint(x: 79.5, y: 26.5), controlPoint1: CGPoint(x: 88.5, y: 18.5), controlPoint2: CGPoint(x: 82.5, y: 24.5))
        bezierPath.addCurve(to: CGPoint(x: 65.5, y: 28.5), controlPoint1: CGPoint(x: 76.5, y: 28.5), controlPoint2: CGPoint(x: 65.5, y: 28.5))
        bezierPath.addLine(to: CGPoint(x: 69.5, y: 42.5))
        bezierPath.addLine(to: CGPoint(x: 67.5, y: 44.5))
        bezierPath.addLine(to: CGPoint(x: 71.5, y: 59.5))
        bezierPath.addCurve(to: CGPoint(x: 47.5, y: 71.5), controlPoint1: CGPoint(x: 71.5, y: 59.5), controlPoint2: CGPoint(x: 64.5, y: 71.5))
        bezierPath.addCurve(to: CGPoint(x: 23.5, y: 59.5), controlPoint1: CGPoint(x: 30.5, y: 71.5), controlPoint2: CGPoint(x: 23.5, y: 59.5))
        bezierPath.close()
        bezierPath.append({
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 36.5, y: 22.5))
            bezier2Path.addCurve(to: CGPoint(x: 33.5, y: 16.5), controlPoint1: CGPoint(x: 33.32, y: 21.39), controlPoint2: CGPoint(x: 30.17, y: 18.5))
            bezier2Path.addCurve(to: CGPoint(x: 40.5, y: 16.5), controlPoint1: CGPoint(x: 38.5, y: 13.5), controlPoint2: CGPoint(x: 40.5, y: 16.5))
            bezier2Path.addCurve(to: CGPoint(x: 40.5, y: 22.5), controlPoint1: CGPoint(x: 40.5, y: 16.5), controlPoint2: CGPoint(x: 43.5, y: 22.5))
            bezier2Path.addCurve(to: CGPoint(x: 36.5, y: 22.5), controlPoint1: CGPoint(x: 39.5, y: 22.5), controlPoint2: CGPoint(x: 38.1, y: 23.06))
            bezier2Path.close()
            return bezier2Path
        }())
        
        bezierPath.append({
            let bezier3Path = UIBezierPath()
            bezier3Path.move(to: CGPoint(x: 55.42, y: 22.26))
            bezier3Path.addCurve(to: CGPoint(x: 58.19, y: 16.46), controlPoint1: CGPoint(x: 58.36, y: 21.18), controlPoint2: CGPoint(x: 61.26, y: 18.39))
            bezier3Path.addCurve(to: CGPoint(x: 51.73, y: 16.46), controlPoint1: CGPoint(x: 53.58, y: 13.55), controlPoint2: CGPoint(x: 51.73, y: 16.46))
            bezier3Path.addCurve(to: CGPoint(x: 51.73, y: 22.26), controlPoint1: CGPoint(x: 51.73, y: 16.46), controlPoint2: CGPoint(x: 48.96, y: 22.26))
            bezier3Path.addCurve(to: CGPoint(x: 55.42, y: 22.26), controlPoint1: CGPoint(x: 52.65, y: 22.26), controlPoint2: CGPoint(x: 53.95, y: 22.8))
            bezier3Path.close()
            return bezier3Path
        }())
        return bezierPath.cgPath
    }()
}
