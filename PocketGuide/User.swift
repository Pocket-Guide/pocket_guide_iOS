//
//  User.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/07.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    func save() {
        let URL = ""
        let parameters = ["name": name, "email": email, "password": password]
        Alamofire.request(.POST, URL, parameters: parameters, encoding: .URL, headers: nil)
    }

}
