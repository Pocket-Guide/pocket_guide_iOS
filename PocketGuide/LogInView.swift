//
//  LogInView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class LogInView: UIView {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var touristButton: UIButton!
    @IBOutlet weak var guideButton: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView.gradate()
        emailTextField.placeholder = "Your email address"
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
    }

}
