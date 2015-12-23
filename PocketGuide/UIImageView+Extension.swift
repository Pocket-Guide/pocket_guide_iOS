//
//  UIImageView+Extension.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/24.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func gradate() {
        layer.shouldRasterize = true
        layer.rasterizationScale = 0.08
        layer.minificationFilter = kCAFilterTrilinear
    }
}