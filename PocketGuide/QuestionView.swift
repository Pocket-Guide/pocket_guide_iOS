//
//  QuestionView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import CTCheckbox

class QuestionView: UIView {
    override func layoutSubviews() {
        setCheckbox(100, text: "111111111111111111", tag: 1)
        setCheckbox(116, text: "222222222222222222", tag: 2)
        setCheckbox(132, text: "333333333333333333", tag: 3)
        setCheckbox(146, text: "444444444444444444", tag: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCheckbox(y: CGFloat, text: String, tag: Int) {
        let checkbox = CTCheckbox()
        checkbox.frame = CGRectMake(16, y, 22, 22)
        checkbox.checkboxColor = UIColor.blackColor()
        checkbox.checkboxSideLength = 22
        checkbox.textLabel.text = text
        checkbox.addTarget(self, action: "checked:", forControlEvents: .TouchUpInside)
        checkbox.tag = tag
        self.addSubview(checkbox)
    }

}
