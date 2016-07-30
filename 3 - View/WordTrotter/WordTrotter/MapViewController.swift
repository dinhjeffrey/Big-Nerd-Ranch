//
//  MapViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/29/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("map view loaded")
    }
    // when view controller is created, its view property is nil
    // when a view controller is asked for its view and its view is nil, loadView() method is called
    override func loadView() {
        // create a map view
        let mapView = MKMapView()
        
        // set it as the view of this view controller
        view = mapView
        
        // allows user to choose between a discrete set of options
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // adds constraints programmatically
        // anchors are properties on the view that correspond to attributes that you might want to constain to an anchor on another view
        // creates a constraint between two anchors
        // top layout guide will allow content to not underlap the status bar or navigation bar at the top of the screen
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
