//
//  QuestionViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate {
    //ユーザー情報
    let currentUser = CurrentUser.sharedCurrentUser
    //質問
    let questionManager = QuestionManager()
    //
    let answerManager = AnswerManager.sharedAnswerManager
    //選択された選択肢
    var selectedChoice: Choice!
    
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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "tapBackButton")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "tapNextOrPostButton")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        questionManager.getQuestion(currentUser.oauthToken!) { () -> Void in
            print("get questions")
            let questionView = self.view as! QuestionView
            questionView.questionTableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //=======TableView関連==========
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedChoice = questionManager.questions[questionManager.presentQuesiton].choises[indexPath.row]
    }
    
    //Backが押された時の処理
    func tapBackButton() {
        if questionManager.presentQuesiton == 0 {
            navigationController?.popViewControllerAnimated(true)
        } else {
            questionManager.presentQuesiton -= 1
            let questionView = view as! QuestionView
            questionView.questionTableView.reloadData()
        }
    }
    
    //Nextが押された時の処理
    func tapNextOrPostButton() {
        if questionManager.presentQuesiton == questionManager.questions.count - 1 {
            print("post")
            answerManager.addAnswerToAttributes(selectedChoice, index: questionManager.presentQuesiton)
            answerManager.savePlanAndAnswer({ () -> Void in
                self.performSegueWithIdentifier("ShowRecommendViewController", sender: nil)
            })
        } else if questionManager.presentQuesiton == questionManager.questions.count - 2 {
            answerManager.addAnswerToAttributes(selectedChoice, index: questionManager.presentQuesiton)
            navigationItem.rightBarButtonItem?.title = "Post"
            questionManager.presentQuesiton += 1
            let questionView = view as! QuestionView
            questionView.questionTableView.reloadData()
        } else {
            answerManager.addAnswerToAttributes(selectedChoice, index: questionManager.presentQuesiton)
            questionManager.presentQuesiton += 1
            let questionView = view as! QuestionView
            questionView.questionTableView.reloadData()
        }
    }
    
}
