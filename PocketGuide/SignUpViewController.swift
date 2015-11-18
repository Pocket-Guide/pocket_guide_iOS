//
//  SignUpViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var URL = "http://localhost:3000/tourists"

    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "SignUpView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(URL)
        let signUpView = view as! SignUpView
        signUpView.backButton.addTarget(self, action: "goBackChooseSignUpOrLogInViewController", forControlEvents: .TouchUpInside)
        signUpView.signUpButton.addTarget(self, action: "tapSignUpButton", forControlEvents: .TouchUpInside)
        signUpView.guideButton.addTarget(self, action: "tapGuideButton", forControlEvents: .TouchUpInside)
        signUpView.touristButton.addTarget(self, action: "tapTouristButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBackChooseSignUpOrLogInViewController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapSignUpButton() {
        registerUser()
    }
    
    func tapGuideButton() {
        URL = "http://localhost:3000/guides"
        print(URL)
    }
    
    func tapTouristButton() {
        URL = "http://localhost:3000/tourists"
        print(URL)
    }
    
    func checkInputItems() {
        let signUpView = view as! SignUpView
        if signUpView.nameTextField.text?.isEmpty != nil && signUpView.passwordTextField.text == signUpView.passwordConfirmationTextField.text{
            registerUser()
        }
    }
    
    func registerUser() {
        let signUpView = view as! SignUpView
        let user = User(name: signUpView.nameTextField.text!, email: signUpView.emailTextField.text!
            , password: signUpView.passwordTextField.text!, passwordConfirmation: signUpView.passwordConfirmationTextField.text!)
        user.signUp(URL)
    }
}
