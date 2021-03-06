//
//  SignUpViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var signUpURL = "http://localhost:3000/tourists"
    var logInURL = "http://localhost:3000/current_tourist/me"
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "SignUpView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = false
        navigationController?.navigationBar.setSignUpAndLogInNavigationBar()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-", style: .Plain, target: self, action: "tapGoBackButton")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUpView = view as! SignUpView
        signUpView.signUpButton.addTarget(self, action: "tapSignUpButton", forControlEvents: .TouchUpInside)
        signUpView.guideButton.addTarget(self, action: "tapGuideButton", forControlEvents: .TouchUpInside)
        signUpView.touristButton.addTarget(self, action: "tapTouristButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapGoBackButton() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func tapSignUpButton() {
        registerUser()
    }
    
    func tapGuideButton() {
        signUpURL = "http://localhost:3000/guides"
        logInURL = "http://localhot:3000/current_guide/me"
    }
    
    func tapTouristButton() {
        signUpURL = "http://localhost:3000/tourists"
        logInURL = "http://localhost:3000/current_tourist/me"
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
        user.signUp(signUpURL) { () -> Void in
            user.logIn(self.logInURL, afterLogIn: { () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
        
    }
}
