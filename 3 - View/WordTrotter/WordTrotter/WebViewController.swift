//
//  WebViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/29/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://www.bignerdranch.com")!
        webView.loadRequest(NSURLRequest(URL: url))
        

        
        
        
        
    }
    
    // Methods

    
    
    
    
    
    
}


