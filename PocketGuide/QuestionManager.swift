//
//  QuetionManager.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class QuestionManager: NSObject, UITableViewDataSource {
    var questions = [Question]()
    var presentQuesiton = 0
    var numberOfQuestion: Int!
    
    //質問とその選択肢を取得するメソッド
    func getQuestion(token: String, callback: () -> Void) {
        let headers = ["Authorization": "Bearer \(token)"]
        let URL = "http://localhost:3000/current_tourist/me/questions.json"
        Alamofire.request(.GET, URL, headers: headers).response {
            (request, response, data, error) in
            if error == nil {
                //取得したQuestions(JSON)
                let allQuestionsAndChoices = JSON(data: data!)
                
                for questionAndChoices in allQuestionsAndChoices.array! {
                    questionAndChoices.dictionary
                    let question = Question()
                    question.id = questionAndChoices["id"].int
                    question.content = questionAndChoices["content"].string
                    
                    for choiceJSON in questionAndChoices["choices"].array! {
                        let choice = Choice()
                        choice.id = choiceJSON["id"].int
                        choice.content = choiceJSON["content"].string
                        choice.questionID = choiceJSON["question_id"].int
                        question.choises.append(choice)
                    }
                    self.questions.append(question)
                }
                self.numberOfQuestion = self.questions.count
                print(self.numberOfQuestion)
                
                callback()
                
            } else {
                print(error)
            }
        }
    }
    
    //DataSourceメソッド
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionTableViewCell", forIndexPath: indexPath) as! QuestionTableViewCell
        if questions.count > 0 {
            cell.choiceContent.text = questions[presentQuesiton].choises[indexPath.row].content
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if questions.count > 0 {
            return questions[presentQuesiton].choises.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if questions.count > 0 {
            return questions[presentQuesiton].content
        }
        return ""
    }
}
