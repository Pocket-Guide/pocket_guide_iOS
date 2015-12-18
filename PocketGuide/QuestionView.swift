//
//  QuestionView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet weak var questionTableView: UITableView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let nib = UINib(nibName: "QuestionTableViewCell", bundle: nil)
        questionTableView.registerNib(nib, forCellReuseIdentifier: "QuestionTableViewCell")
        
    }
}
