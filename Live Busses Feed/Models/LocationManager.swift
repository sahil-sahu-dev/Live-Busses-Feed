//
//  LocationManager.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.

import Foundation
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate {
    
    
    static let shared = LocationManager()

    var locationManager: CLLocationManager!
    var location: CLLocation?

    override init() {
        super.init()

        locationManager = CLLocationManager()
        locationManager.delegate = self

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}
