
//
//  RecommendStocks.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class RecommendStocks: NSObject {
    static let sharedRecommendStrocs = RecommendStocks()
    var myStrocks = [Recommend]()
    
    func getMyRecommends(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let articles = defaults.objectForKey("myStrocks") as? Array<Dictionary<String, AnyObject>> {
            for dic in articles {
                let recommend = RecommendStocks.convertRecommendModel(dic)
                myStrocks.append(recommend)
            }
        }
    }
    
    
    func addRecommendStocks(recommend: Recommend) {
        myStrocks.insert(recommend, atIndex: 0)
        saveRecommend()
    }
    
    func saveRecommend(){
        var tmpRecommend: Array<Dictionary<String, AnyObject>> = []
        for myStock in self.myStrocks {
            let recommendDic = RecommendStocks.convertDictionary(myStock)
            tmpRecommend.append(recommendDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tmpRecommend, forKey: "myStrocks")
        defaults.synchronize()
    }
    
    class func convertDictionary(recommend: Recommend) -> Dictionary<String, AnyObject>{
        var dic = Dictionary<String, AnyObject>()
        dic["title"] = recommend.title
        dic["content"] = recommend.content
        dic["image"] = recommend.image
        return dic
    }
    
    class func convertRecommendModel(dic: Dictionary<String, AnyObject>) -> Recommend {
        let recommend = Recommend()
        recommend.title = dic["title"]! as? String
        recommend.content = dic["content"]! as? String
        recommend.image = dic["image"]! as? UIImage
        return recommend
    }

}

