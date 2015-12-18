//
//  CurrentUser.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/12.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire

class CurrentUser: NSObject {
    static let sharedCurrentUser = CurrentUser()
    var name: String!
    var id: Int!
    var scope: String!
    var email: String!
    var oauthToken: String?
    
    func checkOauthToken() -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userData = userDefaults.dictionaryForKey("userData")
        if userData?["oauthToken"] == nil {
            return true
        } else {
            name = userData!["name"] as! String
            id = userData!["id"] as! Int
            scope = userData!["scopes"] as! String
            oauthToken = userData!["oauthToken"] as? String
            print(name)
            print(id)
            print(scope)
            print(oauthToken)
            return false
        }
    }
    
//    func getCurrentUser() {
//        let headers = ["Authorization": "Bearer \(oauthToken)"]
//        let URL = "http://localhost:3000/current_tourist/me"
//        Alamofire.request(.GET, URL, headers: headers, parameters: ["scope": self.checkScopes(URL)] ).response {
//            (request, response, data, error) in
//            print(error)
//            let json = JSON(data: data!)
//            print("===============UserData===================")
//            print(json)
//            self.saveOauthToken(token)
//        }
//    }

}
