//
//  PlansViewVontrollerViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/28.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class PlansViewVontrollerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = CurrentUser()
        if currentUser.checkOauthToken() {
            performSegueWithIdentifier("ModalSelectSignUpOrLogIn", sender: nil)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Planning", style: .Plain, target: self, action: "moveToQuestionViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToQuestionViewController() {
        performSegueWithIdentifier("ModalTourViewController", sender: nil)
    }
}
