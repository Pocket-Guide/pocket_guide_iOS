//
//  TourIndexView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class TourIndexView: UIView {
    @IBOutlet weak var tourIndexTableView: UITableView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let nib = UINib(nibName: "RecommendTableViewCell", bundle: nil)
        tourIndexTableView.registerNib(nib, forCellReuseIdentifier: "RecommendTableViewCell")
    }

}
