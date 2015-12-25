//
//  RecommendViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let answerManager = AnswerManager.sharedAnswerManager
    let recommendManager = RecommendManager.sharedRecommendManager
    let currentUser = CurrentUser.sharedCurrentUser
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "RecommendView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let recommendView = view as! RecommendView
        recommendView.recommendTableView.delegate = self
        recommendView.recommendTableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: "close")
        let planID = answerManager.planID
        recommendManager.getQuestion(currentUser.oauthToken!, planID: answerManager.planID) { () -> Void in
            print("hello")
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendTableViewCell", forIndexPath: indexPath) as! RecommendTableViewCell
        print(cell.cellImage.frame)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowDetailViewController", sender: nil)
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
