//
//  MainVC.swift
//  Meru Demo
//
//  Created by Vijay on 30/07/18.
//  Copyright © 2018 VJ. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MainVC: UIViewController, GMSMapViewDelegate {
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var footerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 19.1196235, longitude: 72.8617509, zoom: 15.0)
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 19.1196235, longitude: 72.8617509)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }

    
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        print("Map will move")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Diddrag marker")
    }
    
    
    @IBAction func currentLocationAction(_ sender: Any) {
        
        print("currentLocationAction Pressed")
        //Find Current location
        //Place Camera/ pointer
        //Calucate the distance/time and Display
        
    }
    

}
