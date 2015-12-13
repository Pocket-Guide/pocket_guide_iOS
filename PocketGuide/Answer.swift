//
//  Answer.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/03.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class Answer: NSObject {
    static let sharedAnswer = Answer()
    var title = ""
    var answers = [String: AnyObject]()
}
