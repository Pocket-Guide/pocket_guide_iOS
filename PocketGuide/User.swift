//
//  User.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class User: NSObject {
    var name: String!
    var email: String
    var password: String
    var passwordConfirmation: String!
    var scopes: String?
    
    var currentUser = CurrentUser.sharedCurrentUser
    
    let ApplicationId = "f36208b605656466b487d3c24f6ee9c501dc6bf78df4857061337aca4886be83"
    let secretID = "8ee53f3f13e585b52f62c72550fbc23adb6f61469e24f1688fa838b9b9c7b1cc"
    let getTokenURL = "http://localhost:3000/oauth/token.json"
    
    init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
    
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
    
    func signUp(signUpURL: String, loginURL: String) {
        let parameters = ["email": email, "password": password, "password_confirmation": passwordConfirmation, "name": name, "scope": checkScopes(signUpURL)]
        Alamofire.request(.POST, signUpURL, parameters: parameters, encoding: .URL, headers: nil).response {
            (request, response, data, error) in
            if error == nil {
                self.logIn(loginURL)
//                self.logIn("http://localhost:3000/current_tourist/me")
//                ここを touristならhtp://localhost:3000/current_tourist/me
//                guideならhttp://localhot:3000/current_guide/me
//                にしてください
            }
        }
    }
    
    func logIn(URL: String) {
        let parameters = ["grant_type": "password", "client_id": ApplicationId, "client_secret": secretID, "email": email, "scope": checkScopes(URL)]
        Alamofire.request(.POST, getTokenURL, parameters: parameters).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print(json)
            if let token = json["access_token"].string {
                print(token)
                self.currentUser.oauthToken = token
                let headers = ["Authorization": "Bearer \(token)"]
                Alamofire.request(.GET, URL, headers: headers, parameters: ["scope": self.checkScopes(URL)] ).response {
                    (request, response, data, error) in
                    print(error)
                    let json = JSON(data: data!)
                    print("===============UserData===================")
                    print(json)
                    self.saveOauthToken(token)
                }
            }
        }
    }
    
    class func checkOauthToken() -> Bool {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let oauthToken = userDefaults.objectForKey("oauthToken")
        print(oauthToken)
        if oauthToken == nil {
            return true
        } else {
            return false
        }
    }
    
    func checkScopes(URL: String) -> String {
        if URL.rangeOfString("current_tourist") != nil {
           return "tourist"
        } else {
           return "guide"
        }
    }
    
    func saveOauthToken(token: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(currentUser.oauthToken, forKey: "oauthToken")
        userDefaults.synchronize()
    }
    
    func removeOautToken() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("oauthToken")
    }

}


