//
//  QuestionViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/11/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import CTCheckbox

class QuestionViewController: UIViewController {
    var checkboxes = [CTCheckbox]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkbox(100, text: "11111111111111", tag: 0)
        checkbox(132, text: "22222222222222", tag: 1)
        checkbox(164, text: "33333333333333", tag: 2)
        checkbox(196, text: "44444444444444", tag: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func checkbox(y: CGFloat, text: String, tag: Int) {
        let checkbox = CTCheckbox()
        checkbox.frame = CGRectMake(16, y, 22, 22)
        checkbox.checkboxColor = UIColor.blackColor()
        checkbox.checkboxSideLength = 20
        checkbox.textLabel.text = text
        checkbox.addTarget(self, action: "checked:", forControlEvents: .TouchUpInside)
        checkbox.tag = tag
        view.addSubview(checkbox)
        checkboxes.append(checkbox)
    }
    
    func checked (sender: CTCheckbox) {
        for var i = 0; i < checkboxes.count; i++ {
            if sender.tag == i {
                checkboxes[i].checked = true
            } else {
                checkboxes[i].checked = false
            }
        }
    }

}
