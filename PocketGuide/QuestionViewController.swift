//
//  QuestionViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import CTCheckbox
import SwiftyJSON

class QuestionViewController: UIViewController {
    let question = Question.sharedQuestions
    var checkboxes = [CTCheckbox]()
    
    var countQuestion = 0
    var checkboxFrameX:CGFloat = 100
    let tour = Tour.sharedTour
    
    let answer = [String: AnyObject]()
    var questionID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        question.getQuestions { () -> Void in
//            let currentQuestion = self.question.questions[self.countQuestion]
//            self.questionID = self.question.questions[self.countQuestion]["question_id"].int
//            print(self.questionID)
//            self.setQuestionLabel(currentQuestion["content"].string!)
//            for (index, choice) in currentQuestion["choices"].enumerate() {
//                self.checkbox(self.checkboxFrameX, text: choice.1["content"].string!, tag: index)
//                self.checkboxFrameX += 50
//            }
        }
        checkboxFrameX = 100
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "tapNextButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "tapBackButton")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuestionLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 16, y: 50, width: 400, height: 40)
        view.addSubview(label)
    }

    func checkbox(y: CGFloat, text: String, tag: Int) {
        let checkbox = CTCheckbox()
        checkbox.frame = CGRectMake(16, y, 40, 40)
        checkbox.checkboxColor = UIColor.blackColor()
        checkbox.textLabel.text = text
        checkbox.addTarget(self, action: "checked:", forControlEvents: .TouchUpInside)
        checkbox.tag = tag
        checkboxes.append(checkbox)
        view.addSubview(checkbox)
    }
    
    //チェックボックスがタップされた時
    func checked (sender: CTCheckbox) {
        for checkbox in checkboxes {
            checkbox.checked = false
        }
        sender.checked = true
        
    }
    
    //Nextボタンが押された時
    func tapNextButton() {
        countQuestion += 1
        if countQuestion == question.questions.count - 1 {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .Plain, target: self, action: "tapPostButton")
        }
        updateView()
    }
    
    //Backボタンが押された時
    func tapBackButton() {
        if countQuestion == 0 {
            print(countQuestion)
            navigationController?.popToRootViewControllerAnimated(true)
        } else {
            countQuestion -= 1
            updateView()
        }
    }
    
    //画面を更新するメソッド
    func updateView() {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        checkboxes = []
        viewDidLoad()
    }
    
    func tapPostButton() {
        
    }
    
}
