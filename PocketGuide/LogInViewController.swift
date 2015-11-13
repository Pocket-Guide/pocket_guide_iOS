//
//  LogInViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "LogInView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInView = view as! LogInView
        logInView.backButton.addTarget(self, action: "goBackChooseSignUpOrLogInViewController", forControlEvents: .TouchUpInside)
        logInView.logInButton.addTarget(self, action: "tapLogInButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBackChooseSignUpOrLogInViewController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapLogInButton() {
        checkInputItems()
    }
    
    func checkInputItems() {
        let logInView = view as! LogInView
        if logInView.emailTextField.text?.isEmpty != nil && logInView.passwordTextField.text?.isEmpty != nil {
            logInUser()
        }
    }
    
    func logInUser() {
        let logInView = view as! LogInView
        let user = User(email: logInView.emailTextField.text!, password: logInView.passwordTextField.text!)
        user.logIn()
    }
}
