//
//  DetailViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "DetailView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let detailView = view as! DetailView
        detailView.favoriteButton.addTarget(self, action: "tapFavoriteButton", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapFavoriteButton() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
