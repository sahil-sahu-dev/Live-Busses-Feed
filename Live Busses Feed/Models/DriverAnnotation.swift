//
//  DriverAnnotation.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation
import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var uid: String
    
    static let identifier = "DriverAnnotation"
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        
        self.coordinate = coordinate
        self.uid = uid
    }
    
    
}
