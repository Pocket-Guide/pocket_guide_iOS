//
//  Question.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Question: NSObject {
    static let sharedQuestions = Question()
    var questions = [JSON]()
    
    func getQuestions(callback: () -> Void) {
        let URL = "http://localhost:3000/current_tourist/me/questions.json"
        Alamofire.request(.GET, URL).response {
            (request, response, data, error) in
            if error == nil {
//                let json = JSON(data: data!)
//                self.questions = json.array!
                print(request)
                print(response)
                print(data)
                let json = JSON(data: data!)
                print(json)
                callback()
            }
//            } else {
//                print(error)
//            }
        }
    }
}
