//
//  TourViewController.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/10.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController, UIPickerViewDelegate {
    
    let answerManager = AnswerManager.sharedAnswerManager
    let location = Location()
    
    let backView = UIView()
    let prefecturePickerView = UIPickerView()
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "PlanView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let planView = view as! PlanView
        planView.startButton.addTarget(self, action: "tapStartButton", forControlEvents: .TouchUpInside)
        planView.destinationButton.addTarget(self, action: "tapDestinationButton", forControlEvents: .TouchUpInside)
        prefecturePickerView.delegate = self
        prefecturePickerView.dataSource = location
        
        setBackView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: "tapCloseButton")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //PickerView関連
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return location.prefectures[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let planView = self.view as! PlanView
        planView.destinationButton.setTitle(location.prefectures[row], forState: .Normal)
    }
    
    //ボタンが押された時のメソッド
    func tapCloseButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapDestinationButton() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.backView.frame.origin = CGPointMake(0, self.view.frame.height - 250)
        })
    }
    
    func tapStartButton() {
        let planView = view as! PlanView
        title = planView.textField.text
        answerManager.makePlan(title!)
        performSegueWithIdentifier("ShowQuestionViewController", sender: nil)
    }
    
    func setBackView(){
        let planView = view as! PlanView
        backView.alpha = 0.8
        backView.frame = CGRectMake(0, view.frame.height, view.frame.width, 250)
        backView.backgroundColor = UIColor.whiteColor()
        backView.layer.cornerRadius = 3
        planView.addSubview(backView)
        
        prefecturePickerView.frame = CGRectMake(0, 50, backView.frame.width, 200)
        backView.addSubview(prefecturePickerView)
        print(prefecturePickerView.frame)
        
        let completeButton = setButton(backView.frame.width - 108, text: "Complete")
        completeButton.addTarget(self, action: "complete", forControlEvents: .TouchUpInside)
        backView.addSubview(completeButton)
        
    }
    
    func setButton(x: CGFloat, text: String) -> UIButton {
        let button = UIButton()
        button.frame = CGRectMake(x, 6, 100, 30)
        button.setTitle(text, forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor.grayColor()
        return button
    }
    
    func complete() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.backView.frame.origin = CGPointMake(0, self.view.frame.height)
        })
    }
}
