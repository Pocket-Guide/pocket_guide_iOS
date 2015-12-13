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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setCheckbox(y: CGFloat, text: String, tag: Int) {
//        let checkbox = CTCheckbox()
//        checkbox.frame = CGRectMake(16, y, 22, 22)
//        checkbox.checkboxColor = UIColor.blackColor()
//        checkbox.checkboxSideLength = 22
//        checkbox.textLabel.text = text
//        checkbox.addTarget(self, action: "checked:", forControlEvents: .TouchUpInside)
//        checkbox.tag = tag
//        self.addSubview(checkbox)
//    }
    
    func setQuestionLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 16, y: 50, width: 400, height: 40)
        addSubview(label)
    }
    
//    func checkbox(y: CGFloat, text: String, tag: Int) {
//        let checkbox = CTCheckbox()
//        checkbox.frame = CGRectMake(16, y, 40, 40)
//        checkbox.checkboxColor = UIColor.blackColor()
//        checkbox.textLabel.text = text
//        checkbox.addTarget(self, action: "checked:", forControlEvents: .TouchUpInside)
//        checkbox.tag = tag
//        checkboxes.append(checkbox)
//        addSubview(checkbox)
//    }
    
    

}
