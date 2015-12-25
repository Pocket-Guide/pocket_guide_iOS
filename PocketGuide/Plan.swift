
//
//  Plan.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class Plan: NSObject {
    var title: String!
    var prefecture = 0
    
    init(title: String, prefectureCode: Int) {
        self.title = title
        self.prefecture = prefectureCode
    }
}
