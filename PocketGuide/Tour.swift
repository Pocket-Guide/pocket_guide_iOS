
//
//  Tour.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/11.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Tour: NSObject {
    static let sharedTour = Tour()
    var parameters = [String: AnyObject]()
    var title = ""
    var answerAttributes = []
    var answer = [String: AnyObject]()
    
    func saveTour() {
        parameters["answer_attributes"] = self.answerAttributes
        let URL = "http://localhost:3000/current_tourist/me/plans"
        Alamofire.request(.POST, URL, parameters: parameters).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print(json)
        }
    }
}
