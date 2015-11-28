//
//  SignUpView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    @IBOutlet weak var touristButton: UIButton!
    @IBOutlet weak var guideButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func layoutSubviews() {
        super.layoutSubviews()
        nameTextField.placeholder = "Your name"
        emailTextField.placeholder = "Your email address"
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
        passwordConfirmationTextField.placeholder = "Password Confirmation"
        passwordConfirmationTextField.secureTextEntry = true
    }

}
