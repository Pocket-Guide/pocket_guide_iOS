//
//  RecommendView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class RecommendView: UIView {
    @IBOutlet weak var recommendTableView: UITableView!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let nib = UINib(nibName: "RecommendTableViewCell", bundle: nil)
        recommendTableView.registerNib(nib, forCellReuseIdentifier: "RecommendTableViewCell")
    }
}
