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
    //シングルトン
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
            scope = userData!["scope"] as! String
            oauthToken = userData!["oauthToken"] as? String
            return false
        }
    }
    
}
