//
//  SelectSignUpOrLogInView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/12.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class SelectSignUpOrLogInView: UIView {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func layoutSubviews() {
        backImageView.gradate()
    }
}
