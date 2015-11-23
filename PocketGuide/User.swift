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
    var scopes: String?
    let ApplicationId = "d599af3c9835d4a62faf2813788f7c4f6cf2d0b7807a0e8c68f60be5b23b8d3f"
    let secretID = "b2c77abc89556f1923457b1f2139f4718c46237fd39e60444ef2c1f2be29030a"
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
        let parameters = ["email": email, "password": password, "password_confirmation": passwordConfirmation, "name": name, "scope": checkScopes(URL)]
        Alamofire.request(.POST, URL, parameters: parameters, encoding: .URL, headers: nil).response {
            (request, response, data, error) in
            if error == nil {
                print(URL)
                self.logIn("http://localhost:3000/current_tourist/me")
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
            if let token = json["access_token"].string {
                print("=================token=========")
                print(token)
                self.oauthToken = token
                let headers = ["Authorization": "Bearer \(token)"]
                Alamofire.request(.GET, URL, headers: headers, parameters: ["scope": self.checkScopes(URL)] ).response {
                    (request, response, data, error) in
                    print(error)
                    let json = JSON(data: data!)
                    print("===============UserData===================")
                    print(json)
//                    self.saveOauthToken(token)
                }
            }
        }
    }
    
    func checkScopes(URL: String) -> String {
return "tourist"
    }
    
    func saveOauthToken(token: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(oauthToken, forKey: "oauthToken")
        userDefaults.synchronize()
    }
    
    func removeOautToken() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("oauthToken")
    }

}
