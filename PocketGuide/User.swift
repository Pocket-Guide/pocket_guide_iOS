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
    var oauthToken: String?
    let ApplicationId = "e733415535f1b8801bec084f0bfbf0081afd01f4aed18d96ac2c0b49beac57ac"
    let secretID = "6b55f0886c2772aa4ab54f97d37cca90a1a273109c73836ffa291d82fc7ca42a"
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
    
    func signUp(URL: String) {
        let parameters = ["email": email, "password": password, "password_confirmation": passwordConfirmation, "name": name]
        Alamofire.request(.POST, URL, parameters: parameters, encoding: .URL, headers: nil).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print("===============UserDate=====================")
            print(json)
            let parameters = ["grant_type": "password", "client_id": self.ApplicationId, "client_secret": self.secretID, "email": self.email]
            Alamofire.request(.POST, self.getTokenURL, parameters: parameters).response {
                (request, response, data, error) in
                let json = JSON(data: data!)
                print("====================Token=================")
                print(json)
            }
        }
    }
    
    func logIn(URL: String) {
        let parameters = ["grant_type": "password", "client_id": ApplicationId, "client_secret": secretID, "email": email]
        Alamofire.request(.POST, getTokenURL, parameters: parameters).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            print(json)
            let token = json["access_token"].string
            if let oauthToken = token {
                self.oauthToken = oauthToken
                let parameter = ["Authorization": oauthToken]
                Alamofire.request(.GET, URL, parameters: parameter).response {
                    (request, response, data, error) in
                    let json = JSON(data: data!)
                    print("===============UserData===================")
                    print(json)
                }
            }
        }
    }
    
    func saveOauthToken() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(oauthToken, forKey: "oauthToken")
        userDefaults.synchronize()
    }
    
    func removeOautToken() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("oauthToken")
    }

}
