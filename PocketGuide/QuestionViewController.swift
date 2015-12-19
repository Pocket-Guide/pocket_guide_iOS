//
//  QuestionViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate {
    let questionManager = QuestionManager()
    let currentUser = CurrentUser.sharedCurrentUser
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "QuestionView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionView = view as! QuestionView
        questionView.questionTableView.delegate = self
        questionView.questionTableView.dataSource = questionManager
        questionView.questionTableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        questionManager.getQuestion(currentUser.oauthToken!) { () -> Void in
            let questionView = self.view as! QuestionView
            questionView.questionTableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
     
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
