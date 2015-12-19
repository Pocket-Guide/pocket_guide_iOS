//
//  TourViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/10.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {
    
    let answerManager = AnswerManager.sharedAnswerManager
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "PlanView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let planView = view as! PlanView
        planView.startButton.addTarget(self, action: "tapStartButton", forControlEvents: .TouchUpInside)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: "tapCloseButton")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapCloseButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapStartButton() {
        let planView = view as! PlanView
        title = planView.textField.text
        answerManager.makePlan(title!)
        performSegueWithIdentifier("ShowQuestionViewController", sender: nil)
    }
    
}
