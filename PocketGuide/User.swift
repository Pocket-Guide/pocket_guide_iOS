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
    var scope: String!
    
    let ApplicationId = "deb0c97b165a5d94d8ca850cd3bba7f5d707eb65189bf76218299e2971595f96"
    let secretID = "d66827a8bbc03e922a863066ece18f39e8945c35df6ea1aecbc1d39d87b446b5"
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
                afterSignUp()
            }
        }
    }
    
    func logIn(URL: String, afterLogIn: () -> Void) {
        let parameters = ["grant_type": "password", "client_id": ApplicationId, "client_secret": secretID, "email": email, "scope": checkScopes(URL)]
        Alamofire.request(.POST, getTokenURL, parameters: parameters).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print(json)
            if let token = json["access_token"].string {
                let headers = ["Authorization": "Bearer \(token)"]
                Alamofire.request(.GET, URL, headers: headers, parameters: ["scope": self.checkScopes(URL)] ).response {
                    (_, _, data, _) in
                    let json = JSON(data: data!)
                    print("===============UserData===================")
                    print(json)
                    self.id = json["id"].int
                    print(self.id)
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
        userData["scope"] = scope
        
        print(userData)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(userData, forKey: "userData")
        userDefaults.synchronize()
    }
    
    func removeOautToken() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("userData")
    }
    
}


