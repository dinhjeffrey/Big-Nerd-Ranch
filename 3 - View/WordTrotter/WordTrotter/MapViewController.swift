//
//  MapViewController.swift
//  WordTrotter
//
//  Created by jeffrey dinh on 7/29/16.
//  Copyright © 2016 jeffrey. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    // Constants and variables
    let mapView = MKMapView()

    // View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("map view loaded")
    }
    // when view controller is created, its view property is nil
    // when a view controller is asked for its view and its view is nil, loadView() method is called
    override func loadView() {
        // create a map view
        
        
        // set it as the view of this view controller
        view = mapView
        
        // allows user to choose between a discrete set of options
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(
            self,
            action: #selector(MapViewController.mapTypeChanged(_:)),
            forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // adds constraints programmatically
        // anchors are properties on the view that correspond to attributes that you might want to constain to an anchor on another view
        // creates a constraint between two anchors
        // top layout guide will allow content to not underlap the status bar or navigation bar at the top of the screen
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        let latitude:CLLocationDegrees = 33.6086549608 //insert latitutde
        
        let longitude:CLLocationDegrees = -117.929614227 //insert longitude
        
        let latDelta:CLLocationDegrees = 0.002
        
        let lonDelta:CLLocationDegrees = 0.002
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = "Newport Beach"
        dropPin.subtitle = "Pokemon Go ^^"
        mapView.addAnnotation(dropPin)
    }
    
    // Methods
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


