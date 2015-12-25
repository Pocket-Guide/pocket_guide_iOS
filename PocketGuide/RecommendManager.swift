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
    
    func getRecommend(token: String, planID: Int, callback: () -> Void) {
        let headers = ["Authorization": "Bearer \(token)"]
        let URL = "http://localhost:3000/current_tourist/me/plans/\(planID)/locations"
        Alamofire.request(.GET, URL, headers: headers).response {
            (request, response, data, error) in
            let recommends = JSON(data: data!)
            for recommendDate in recommends.array! {
                print(recommendDate)
                let recommend = Recommend()
                recommend.status = recommendDate["status"].int
                recommend.id = recommendDate["id"].int
                recommend.introduction = recommendDate["introduction"].string
                recommend.name = recommendDate["name"].string
                recommend.captureImage = recommendDate["captured_images"][0]["name"]["url"].string
                self.recommends.append(recommend)
            }
            callback()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendTableViewCell", forIndexPath: indexPath) as! RecommendTableViewCell
        cell.titleLabel.text = recommends[indexPath.row].name
        cell.contentLabel.text = recommends[indexPath.row].introduction
        let imageURL = NSURL(string: recommends[indexPath.row].captureImage)
        let request = NSURLRequest(URL: imageURL!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (Response, data, error) -> Void in
            let image = UIImage(data: data!)
            cell.cellImage.image = image
            print(cell.cellImage.image)
        }
        return cell
    }
}
