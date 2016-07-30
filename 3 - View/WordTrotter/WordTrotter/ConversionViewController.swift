//
//  ConversionViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/28/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - IBActions
    @IBAction func fahrenheitEditingChanged(sender: UITextField) {
        // updates fahrenheitValue whenever the text field changes, if no text, then value is nil. Check if text can be a Double, i.e.: "1.2.3" cannot
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    // MARK: - Constants and variables
    var fahrenheitValue: Double? { // double because user might not have typed in a number
        didSet { // property observer is called whenever a property's value changes. **Note: property obs are not triggered when property value is changed from within an initializer
            updateCelsiusLabel() // whenever fahrenheitValue changes, update the celsiusLabel which calls the computed propety celsiusValue
        }
    }
    var celsiusValue: Double? { // computed property. value is computed based on fahrenheitValue, if there is no fahrenheitValue, then return nil
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    let colors: [UIColor] = [.blackColor(), .blueColor(), .brownColor(), .clearColor(), .cyanColor(), .redColor(), .orangeColor(), .purpleColor(), .greenColor(), .yellowColor()]
    
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print("conversion view loaded")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // changes background color on load
        let randomNum = Int(arc4random_uniform(UInt32(colors.count - 1)))
        view.backgroundColor = colors[randomNum]
    }
    
    // MARK: - Methods
    func updateCelsiusLabel() { // if there is a value for celsius, we want to update the text, or set it to ??? if nil. called whenever fahrenheitValue changes
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    // using a closure to instantiate the number formatter.
    // number formatter customize the display of a number
    // displays no more than 1 fractional digit
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    // UITextFieldDelegate Protocols
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        let characterSet = NSMutableCharacterSet() //create an empty mutable set
        characterSet.formUnionWithCharacterSet(NSCharacterSet.decimalDigitCharacterSet())
        // allow decimal point
        characterSet.addCharactersInString(".")
        let range = string.rangeOfCharacterFromSet(characterSet)
        // allow backspace
        let  char = string.cStringUsingEncoding(NSUTF8StringEncoding)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil)
            || (range == nil && isBackSpace != -92)
        {
            return false
        } else {
            return true
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
