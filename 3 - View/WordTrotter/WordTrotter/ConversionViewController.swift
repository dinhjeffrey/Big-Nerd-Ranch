//
//  ConversionViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/28/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    // MARK: - IBActions
    @IBAction func fahrenheitEditingChanged(sender: UITextField) {
        if let text = textField.text where !text.isEmpty {
            celsiusLabel.text = textField.text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
