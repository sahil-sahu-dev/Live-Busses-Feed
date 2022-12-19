//
//  DriverAnnotation.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation
import MapKit

class BusAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var id: String
    
    static let identifier = "DriverAnnotation"
    
    init(id: String, coordinate: CLLocationCoordinate2D) {
        
        self.coordinate = coordinate
        self.id = id
    }
    
    
}
