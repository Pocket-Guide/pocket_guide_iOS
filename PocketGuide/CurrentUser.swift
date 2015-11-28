//
//  CurrentUser.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/12.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class CurrentUser: NSObject {
    static let sharedCurrentUser = CurrentUser()
    var oauthToken: String?
    
    func checkOauthToken() -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        oauthToken = userDefaults.objectForKey("oauthToken") as? String
        print(oauthToken)
        if oauthToken == nil {
            return true
        } else {
            return false
        }
    }
}
