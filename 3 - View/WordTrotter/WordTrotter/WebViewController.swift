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

    
    // View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.dindledoo.com/")!
        webView.loadRequest(NSURLRequest(URL: url))
        

        
        
        
        
    }
    
    // Methods

    
    
    
    
    
    
}


