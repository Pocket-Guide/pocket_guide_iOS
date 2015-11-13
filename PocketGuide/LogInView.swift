//
//  LogInView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class LogInView: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        emailTextField.placeholder = "Your email address"
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
    }

}
