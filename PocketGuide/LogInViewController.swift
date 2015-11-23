//
//  LogInViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    var URL = "http://localhost:3000/current_tourist/me"
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "LogInView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(URL)
        let logInView = view as! LogInView
        logInView.backButton.addTarget(self, action: "goBackChooseSignUpOrLogInViewController", forControlEvents: .TouchUpInside)
        logInView.logInButton.addTarget(self, action: "tapLogInButton", forControlEvents: .TouchUpInside)
        logInView.guideButton.addTarget(self, action: "tapGuideButton", forControlEvents: .TouchUpInside)
        logInView.touristButton.addTarget(self, action: "tapTouristButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBackChooseSignUpOrLogInViewController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapGuideButton() {
        URL = "http://localhost:3000/guides"
        print(URL)
    }
    
    func tapTouristButton() {
        URL = "http://localhost:3000/tourists"
        print(URL)
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
        user.logIn(URL)
    }
}
