//
//  TourViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/10.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class TourViewController: UIViewController {

    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "TourView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tourView = view as! TourView
        tourView.startButton.addTarget(self, action: "tapStartButton", forControlEvents: .TouchUpInside)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: "tapCloseButton")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapCloseButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapStartButton() {
        let tourView = view as! TourView
        let tour = Tour.sharedTour
        tour.title = tourView.textField.text!
        performSegueWithIdentifier("ShowQuestionViewController", sender: nil)
    }
    
}
