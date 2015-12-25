//
//  RecommendViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController, UITableViewDelegate {
    let answerManager = AnswerManager.sharedAnswerManager
    let recommendManager = RecommendManager.sharedRecommendManager
    let currentUser = CurrentUser.sharedCurrentUser
    var selectedRecommend: Recommend!
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "RecommendView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let recommendView = view as! RecommendView
        recommendView.recommendTableView.delegate = self
        recommendView.recommendTableView.dataSource = recommendManager
        recommendView.closeButton.addTarget(self, action: "close", forControlEvents: .TouchUpInside)
        recommendManager.getRecommend(currentUser.oauthToken!, planID: answerManager.planID) { () -> Void in
            recommendView.recommendTableView.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRecommend = recommendManager.recommends[indexPath.row]
        print(selectedRecommend)
        performSegueWithIdentifier("ShowDetailViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.recommend = selectedRecommend
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

}
