//
//  LocationButtonViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/18.
//

import UIKit
import CoreLocationUI
import CoreLocation
import MapKit

class LocationButtonViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.frame = CGRect(x: 20, y: 50, width: self.view.frame.self.width - 40, height: self.view.frame.size.height - 200)
        manager.delegate = self
        createButton()
        
    
    }
    
    private func createButton() {
        let button = CLLocationButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.label = .currentLocation
        button.icon = .arrowOutline
        button.cornerRadius = 12
        //button.center = self.view.center
        button.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height - 100)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton() {
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        self.manager.stopUpdatingLocation()
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
    
}
