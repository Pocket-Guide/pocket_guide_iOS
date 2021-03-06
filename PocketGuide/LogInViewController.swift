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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-", style: .Plain, target: self, action: "tapGoBackButton")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(URL)
        let logInView = view as! LogInView
        logInView.logInButton.addTarget(self, action: "tapLogInButton", forControlEvents: .TouchUpInside)
        logInView.guideButton.addTarget(self, action: "tapGuideButton", forControlEvents: .TouchUpInside)
        logInView.touristButton.addTarget(self, action: "tapTouristButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapGoBackButton() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func tapGuideButton() {
        URL = "http://localhot:3000/current_guide/me"
    }
    
    func tapTouristButton() {
        URL = "http://localhost:3000/current_tourist/me"
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
        user.logIn(URL) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
