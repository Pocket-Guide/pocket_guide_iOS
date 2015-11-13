//
//  LogInModel.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInModel: NSObject {
    var email: String
    var password: String
    var token: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func logIn() {
        makeToken()
    }
    
    func makeToken() {
        let URL = "http://localhost:3000/oauth/token.json"
        let ApplicationId = "e733415535f1b8801bec084f0bfbf0081afd01f4aed18d96ac2c0b49beac57ac"
        let secretID = "6b55f0886c2772aa4ab54f97d37cca90a1a273109c73836ffa291d82fc7ca42a"
        let parameters = ["grant_type": "password", "client_id": ApplicationId, "client_secret": secretID, "email": email]
        Alamofire.request(.POST, URL, parameters: parameters).response {
            (request, response, data, error) in
            let json = JSON(data: data!)
            let oauthToken = json["access_token"].string
            if let token = oauthToken {
                let URL = "http://localhost:3000/tourists"
                let parameter = ["Authorization": token]
                Alamofire.request(.GET, URL, parameters: parameter).response {
                    (request, response, data, error) in
                    let json = JSON(data: data!)
                }
            }
        }
    }
    
}
