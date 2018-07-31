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

class MainVC: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var bookLaterButton: UIButton!
    @IBOutlet weak var bookNowButton: UIButton!

    @IBOutlet weak var addressDisplayLabel: UILabel!
    
    @IBOutlet weak var signalIndicationView: UIView!
    @IBOutlet weak var isFavorite: UIButton!
    
     let startingPointMarker = GMSMarker()
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 19.1196235, longitude: 72.8617509, zoom: 15.0)
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera
        
        // Creates a marker in the center of the map.
       
        startingPointMarker.position = CLLocationCoordinate2D(latitude: 19.1196235, longitude: 72.8617509)
        startingPointMarker.title = "Sydney"
        startingPointMarker.snippet = "Australia"
        startingPointMarker.map = mapView
    
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //UI setup
        
        bookLaterButton.backgroundColor = .clear
        bookLaterButton.layer.cornerRadius = 1
        bookLaterButton.layer.borderWidth = 1.5
        bookLaterButton.layer.borderColor = UIColor.init(red: 0, green: 188/255, blue: 212/255, alpha: 1.0).cgColor
        
    }
    
   
    
    
    @IBAction func currentLocationAction(_ sender: Any) {
        
        print("currentLocationAction Pressed")
        //Find Current location
        //Place Camera/ pointer
        //Calucate the distance/time and Display
        
    }
    
    
    func animateHeaderFooter(){
        
        UIView.animate(withDuration: 50.0, animations: {
            self.headerView.frame = CGRect(x: 0, y: -200, width: self.headerView.frame.size.width, height: self.headerView.frame.size.height)
            self.footerView.frame = CGRect(x: 0, y: 1000, width: self.footerView.frame.size.width, height: self.footerView.frame.size.height)
        })
        
    }
    

}

extension MainVC: GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        print("Map will move")
        animateHeaderFooter()
    }
    
    //MARK - GMSMarker Dragging
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging")
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D){
        startingPointMarker.position = coordinate
    }
    
}


// MARK: - CLLocationManagerDelegate
extension MainVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
        //fetchNearbyPlaces(coordinate: location.coordinate)
    }
}
