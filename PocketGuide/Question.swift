//
//  Question.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class Question: NSObject {
    var id: Int!
    var content: String!
    var choises = [Choice]()
}