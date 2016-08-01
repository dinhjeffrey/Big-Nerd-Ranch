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
    let mapView = MKMapView() // creates mapView programmatically
    var annotationPins = [MKPointAnnotation]()
    var count = 0

    // View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("map view loaded")
    }
    // when view controller is created, its view property is nil
    // when a view controller is asked for its view and its view is nil, loadView() method is called
    override func loadView() {
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
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false // resizing mask will not be translated into constraints. set autolayout size dynamically
        view.addSubview(segmentedControl)
        
        // adds constraints programmatically
        // anchors are properties on the view that correspond to attributes that you might want to constain to an anchor on another view
        // creates a constraint between two anchors
        // top layout guide will allow content to not underlap the status bar or navigation bar at the top of the screen
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        var margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        var trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        

        
        mapView.setRegion(makeRegion(CLLocationCoordinate2D(latitude: 33.6086549608, longitude: -117.929614227)), animated: true)
        
        // Creating Pins
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = CLLocationCoordinate2D(latitude: 33.6086549608, longitude: -117.929614227)
        dropPin.title = "Newport Beach"
        dropPin.subtitle = "Pokemon Go ^^"
        mapView.addAnnotation(dropPin)
        
        let dropPin2 = MKPointAnnotation()
        dropPin2.coordinate = CLLocationCoordinate2D(latitude: 33.607220, longitude: -117.928491)
        dropPin2.title = "Sand"
        dropPin2.subtitle = "Dratini"
        mapView.addAnnotation(dropPin2)
        
        let dropPin3 = MKPointAnnotation()
        dropPin3.coordinate = CLLocationCoordinate2D(latitude: 33.609945, longitude: -117.928416)
        dropPin3.title = "Restaurants"
        dropPin3.subtitle = "PokeStops"
        mapView.addAnnotation(dropPin3)
        
        annotationPins.append(dropPin)
        annotationPins.append(dropPin2)
        annotationPins.append(dropPin3)
        
        // create a button programmatically
        let btn: UIButton = UIButton(frame: CGRectMake(100, 400, 100, 50))
        btn.layer.cornerRadius = 0.05 * btn.bounds.size.width
        btn.backgroundColor = UIColor.orangeColor()
        btn.setTitle("Cycle", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        btn.addTarget(self, action: #selector(MapViewController.cycleAnnotations(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false // resizing mask will not be translated into constraints. set autolayout size dynamically
        view.addSubview(btn) // add to view as subview
        
        // create button constraints
        let bottomConstraint = btn.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.bottomAnchor, constant: -50)
        margins = view.layoutMarginsGuide
        //leadingConstraint = btn.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        trailingConstraint = btn.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        bottomConstraint.active = true
        //leadingConstraint.active = true
        trailingConstraint.active = true

    }
    
    // Methods
    func makeRegion(latLong: CLLocationCoordinate2D) -> MKCoordinateRegion {
        // Setting map view
        
        let latDelta:CLLocationDegrees = 0.002
        
        let lonDelta:CLLocationDegrees = 0.002
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = latLong
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        return region
    }
    
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
    
    func cycleAnnotations(sender: UIButton) {
        count += 1;
        if count > 2 {
            count = 0
        }
        mapView.setRegion(makeRegion(annotationPins[count].coordinate), animated:  true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


