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

    @IBOutlet weak var signalIndicationView: UIView!
    @IBOutlet weak var addressDisplayLabel: UILabel!
    @IBOutlet weak var isFavorite: UIButton!
    @IBOutlet private weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var locateCurrentLocationButton: UIButton!

    var isCameraStartMoving = false
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate's
        mapView.delegate = self;
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //To make pointer center to the screen
        mapView.padding = UIEdgeInsets(top: 0, left: 0,
                                           bottom: 35, right: 0)
        
    
        //SWRevealController Methodes
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //UI setup
        signalIndicationView.roundedView() //To make UIView Rounded -> UIButton extension
        locateCurrentLocationButton.roundedView() //To make UIView Rounded -> UIButton extension
        bookLaterButton.button(withBorder: 1, andRadious: 2) //To make UIButton with Rounded corners -> UIButton extension
        bookNowButton.layer.cornerRadius = 2
        
    }
    
    
    @IBAction func currentLocationAction(_ sender: Any) {
        
        //Find Current location - Completed
        let target = locationManager.location?.coordinate
        
        //Place Camera/ pointer with animation - Completed
        mapView.animate(to: GMSCameraPosition.camera(withTarget: target!, zoom: 15))

        //without animation
        //mapView.camera = GMSCameraPosition.camera(withTarget: target!, zoom: 15)
        
        
        //Calucate the distance/time and Display
        //
        
    }

}

extension MainVC: GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
        //Camera position started changing.
        
        
        if gesture {
            isCameraStartMoving = true
            
            //Annimate Header & Footer Views
            OperationQueue.main.addOperation {
                UIView.animate(withDuration: 0.5) {
                    self.headerView.frame.origin.y -= 300
                    self.footerView.frame.origin.y += 300
                }
            }
        }
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        //Find Address by lat lang
        //Display to Addresslabel
        //print("Current Location: \(position.target.latitude) - \(position.target.latitude)")
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("Camera position Stoped Moving")
        
        //Annimate Header & Footer Views
        if isCameraStartMoving {
            
            isCameraStartMoving = false //Camera is ideal
            
            UIView.animate(withDuration: 0.5) {
                self.headerView.frame.origin.y += 300
                self.footerView.frame.origin.y -= 300
            }
        }
        
        
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        
        print(marker)
        
        return UIView()
    }
    
//    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D){

//    }
    
}


// MARK: - CLLocationManagerDelegate
extension MainVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        //mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
        
        //Display addres line to user
    }
}
