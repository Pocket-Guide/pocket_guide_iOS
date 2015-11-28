//
//  SelectSignUpOrLogInViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/12.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class SelectSignUpOrLogInViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "SelectSignUpOrLogInView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let selectSignUpOrLogInView = view as!SelectSignUpOrLogInView
        selectSignUpOrLogInView.logInButton.addTarget( self, action: "tapLogInButton", forControlEvents: .TouchUpInside)
        selectSignUpOrLogInView.signUpButton.addTarget(self, action: "tapSignUpButton", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapLogInButton() {
        performSegueWithIdentifier("ShowLogInViewController", sender: nil)
    }
    
    func tapSignUpButton() {
        performSegueWithIdentifier("ShowSignUpViewController", sender: nil)
    }

}
