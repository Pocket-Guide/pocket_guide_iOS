//
//  UINavigaitonBar+Extension.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/23.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    func setSignUpAndLogInNavigationBar() {
        translucent = true
        setBackgroundImage(UIImage(), forBarMetrics: .Default)
        shadowImage = UIImage()
    }
}