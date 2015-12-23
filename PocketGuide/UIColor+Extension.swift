//
//  UIColor+Extension.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/23.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func rgb(r r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    class func barColor() -> UIColor {
        return UIColor.rgb(r: 116, g: 168, b: 71, alpha: 1.0)
    }
    
    class func userRelatedButtonColor() -> UIColor {
        return UIColor.rgb(r: 175, g: 226, b: 225, alpha: 1.0)
    }
    
}