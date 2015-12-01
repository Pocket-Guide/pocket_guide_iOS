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
    class func getQuestions() {
        _ = []
        let URL = "http://localhost:3000/current_tourist/me/questions.json"
        Alamofire.request(.GET, URL).response {
            (request, response, data, error) in
            if error == nil {
                print("============request==============")
                print(request)
                
                print("=============resoponse=============")
                print(response)
                
                print("============data==============")
                print(data)
                
                let json = JSON(data: data!)
                print(json)
                
            } else {
                print(error)
            }
        }
    }
}
