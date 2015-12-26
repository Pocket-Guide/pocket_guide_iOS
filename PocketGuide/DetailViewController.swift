//
//  DetailViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/25.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recommend: Recommend!
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "DetailView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let detailView = view as! DetailView
        detailView.detailTextView.text = recommend.introduction
        detailView.titleLabel.text = recommend.name
        let imageURL = NSURL(string: recommend.captureImage)
        let request = NSURLRequest(URL: imageURL!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (Response, data, error) -> Void in
            let image = UIImage(data: data!)
            detailView.detailImageView.image = image
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let detailView = view as! DetailView
        detailView.favoriteButton.addTarget(self, action: "tapFavoriteButton", forControlEvents: .TouchUpInside)
        navigationController?.navigationBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapFavoriteButton() {
        let detailView = view as! DetailView
        if recommend.status == 0 {
            recommend.status = 1
            detailView.favoriteButton.titleLabel?.text = "行きたいを取り消す"
            print(recommend.status)
        } else if recommend.status == 1 {
            recommend.status = 0
            detailView.favoriteButton.titleLabel?.text = "行きたい"
            print(recommend.status)
        }
    }
}
