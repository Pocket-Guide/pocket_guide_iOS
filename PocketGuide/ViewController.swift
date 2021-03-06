//
//  PlansViewVontrollerViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/28.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let currentUser = CurrentUser.sharedCurrentUser
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TourIndexView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Planning", style: .Plain, target: self, action: "moveToPlanViewController")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .Plain, target: self, action: "logout")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if currentUser.checkOauthToken() {
            performSegueWithIdentifier("ModalSelectSignUpOrLogIn", sender: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logout() {
        User.removeOauthToken { () -> Void in
            self.performSegueWithIdentifier("ModalSelectSignUpOrLogIn", sender: nil)
        }
    }
    
    func moveToPlanViewController() {
        performSegueWithIdentifier("ModalPlanViewController", sender: nil)
    }
}
