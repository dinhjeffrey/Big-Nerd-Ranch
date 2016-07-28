//
//  ViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/28/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To create a CGRect, you use its initializer and pass in values for x,y,width,height
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        // creating the view using the dimension of firstFrame
        let firstView = UIView(frame: firstFrame)
        // setting the background color on the view
        firstView.backgroundColor = UIColor.blueColor()
        // adding subview to view
        view.addSubview(firstView)
    }


}

