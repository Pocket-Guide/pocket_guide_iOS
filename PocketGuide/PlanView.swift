//
//  PlanView.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/18.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class PlanView: UIView {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var destinationButton: UIButton!
//    var prefecturePickerView: UIPickerView?
//    var backView: UIView?

    
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView.gradate()
//        setPickerView()
    }
    
//    func setPickerView() {
//        let margin: CGFloat = 16
//        backView = UIView()
//        backView?.frame.origin = CGPoint(x: 0, y: -100)
//        backView?.frame.size = CGSize(width: 100, height: 200)
//        self.backImageView.addSubview(backView!)
//        prefecturePickerView = UIPickerView()
//        prefecturePickerView!.frame.origin = CGPoint(x: 0, y: 50)
//        prefecturePickerView!.frame.size = CGSize(width: 80, height: 150)
//        backView?.addSubview(prefecturePickerView!)
//    }
}
