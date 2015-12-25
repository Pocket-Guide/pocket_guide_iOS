//
//  RecommendManager.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecommendManager: NSObject, UITableViewDataSource {
    static let sharedRecommendManager = RecommendManager()
    var recommends = [Recommend]()
    
    func getQuestion(token: String, planID: Int, callback: () -> Void) {
        let headers = ["Authorization": "Bearer \(token)"]
        let URL = "http://localhost:3000/current_tourist/me/plans/\(planID)/locations"
        Alamofire.request(.GET, URL, headers: headers).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print(json)
            callback()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendTableViewCell", forIndexPath: indexPath) as! RecommendTableViewCell
        return cell
    }
}
