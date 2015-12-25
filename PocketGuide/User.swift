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
    var id: Int?
    var scope: String?
    
    let ApplicationId = "a62d78d9cb2f20b9b8f72b8784e45a8497aa44c06ea77382ee69baf0610be39b"
    let secretID = "29742779d16d8b33fb2ca263fcb8b59e075a50a8c4ff9da7f849432e9672e58a"
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
    
    func signUp(signUpURL: String, afterSignUp: () -> Void) {
        scope = checkScopes(signUpURL)
        let parameters = ["email": email, "password": password, "password_confirmation": passwordConfirmation, "name": name, "scope": scope]
        Alamofire.request(.POST, signUpURL, parameters: parameters, encoding: .URL, headers: nil).response {
            (request, response, data, error) in
            if error == nil {
                let json = JSON(data: data!)
                print(json)
                afterSignUp()
            }
        }
    }
    
    func logIn(URL: String, afterLogIn: () -> Void) {
        let parameters = ["grant_type": "password", "client_id": ApplicationId, "client_secret": secretID, "email": email, "scope": checkScopes(URL)]

        Alamofire.request(.POST, getTokenURL, parameters: parameters).response {
            (request, response, data, error) in
            print("================Alamofire===================")
            let json = JSON(data: data!)
            print(json)
            self.scope = json["scope"].string
            print("======================================")
            if let token = json["access_token"].string {
                let headers = ["Authorization": "Bearer \(token)"]
                Alamofire.request(.GET, URL, headers: headers, parameters: ["scope": self.checkScopes(URL)] ).response {
                    (request, response, data, error) in
                    let json = JSON(data: data!)
                    print("===============UserData===================")
                    print(json)
                    self.id = json["id"].int
                    self.name = json["name"].string
                    self.scope = json["scope"].string
                    print(self.scope                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        )
                    self.saveUserData(token)
                    afterLogIn()
                }
            }
        }
    }
    
    func checkScopes(URL: String) -> String {
        if URL.rangeOfString("tourist") != nil {
            return "tourist"
        } else {
            return "guide"
        }
    }
    
    func saveUserData(token: String) {
        var userData = [String: AnyObject]()
        userData["oauthToken"] = token
        userData["name"] = name
        userData["id"] = id
        userData["scope"] = "tourist"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(userData, forKey: "userData")
        userDefaults.synchronize()
    }
    
    class func removeOauthToken(callback: () -> Void) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("userData")
        callback()
    }
    
}


