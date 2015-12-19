//
//  AnswerManager.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AnswerManager: NSObject {
    static let sharedAnswerManager = AnswerManager()
    var currentUser = CurrentUser.sharedCurrentUser
    var answersAttributes = [[String:Int]()]
    var plan: Plan!
    var choices = [String:Int]()
    
    func makePlan(title: String) {
        plan = Plan(title: title)
    }
    
    func addAnswerToAttributes(choice: Choice, index: Int) {
        var answer = [String:Int]()
        answer["question_id"] = choice.id
        answer["choice_id"] = choice.questionID
        answersAttributes.append(answer)
        print(answersAttributes[index])
    }
    
    func savePlanAndAnswer() {
        let URL = "http://localhost:3000/current_tourist/me/plans"
        let headers = ["Authorization": "Bearer \(currentUser.oauthToken!)"]
        var parameters = [String:AnyObject]()
        parameters["title"] = plan.title
        parameters["answers_attributes"] = answersAttributes
        
        Alamofire.request(.POST, URL, headers: headers, parameters: parameters).response {
            (request, response, data, error) in
            print(error)
            let json = JSON(data: data!)
            print(json)
        }
    }
}
