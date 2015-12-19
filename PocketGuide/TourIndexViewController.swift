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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Planning", style: .Plain, target: self, action: "moveToQuestionViewController")
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
    
    func moveToQuestionViewController() {
        performSegueWithIdentifier("ModalPlanViewController", sender: nil)
    }
}
